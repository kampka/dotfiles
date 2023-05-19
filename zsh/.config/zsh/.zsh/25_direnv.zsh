
__direnv_is_allowed() {
	local p="$(realpath $1)"
	[ -d "$p" ] && p="$(realpath $p)/.envrc"

	local temp="$(mktemp)"
	echo "$p" > "$temp"
	cat "$p" >> "$temp"
	local file_checksum="$(sha256sum $temp | grep -o '^[^ ]*')"
	rm -f "$temp"
	if [ -f "$HOME/.config/direnv/allow/$file_checksum" ] && grep -q "$p" "$HOME/.config/direnv/allow/$file_checksum" ; then
		return 0
	fi
	return 1
}

__direnv_update_recursive() {
	local p="$(realpath $1)"
	local oldsha="$2"
	local newsha="$3"

	[ -d "$p" ] || p="$(dirname $(realpath $p))"

 	while read file; do
		local old_checksum="$(sha1sum $file | grep -o '^[^ ]*')"
		if __direnv_is_allowed "$file"; then
			sed -i 's/source_up_secure '"$oldsha"'/source_up_secure '"$newsha"'/g' "$file"
			direnv allow "$file"
			local new_checksum="$(sha1sum $file | grep -o '^[^ ]*')"
			__direnv_update_recursive "$file" "$old_checksum" "$new_checksum"
		fi
	done < <(find "$p" -mindepth 2 -type f -name .envrc )

}

direnv_edit() {

	local p="${1:-$(pwd)}"

	[ -e "$p" ] || {
    echo "First parameter has to be a valid path" 1>&2
    return 1
	}

	p="$(realpath $p)"
	[ -f "$p" ] && p="$(dirname $(realpath $p))"
	local file="$p/.envrc"

	[ -f "$file" ] || {
		echo "No .envrc file found in path $p" 1>&2
		return 1
	}

	local old_checksum="$(sha1sum $file | grep -o '^[^ ]*')"
	direnv edit "$file"
	local new_checksum="$(sha1sum $file | grep -o '^[^ ]*')"
	if [ "$new_checksum" != "$old_checksum" ]; then
		__direnv_update_recursive "$p" "$old_checksum" "$new_checksum"
	fi
}
