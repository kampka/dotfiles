
# is_git_repo returns true if cwd is in git repository
is_git_repo() {
    git rev-parse --is-inside-work-tree &>/dev/null
    return $status
}

is_git_crypt_locked() {
    is_git_repo && \
    git ls-tree -r master --name-only | sed 's/.*/"&"/' | xargs grep -qsPa "\x00GITCRYPT"
}
