augroup VimWiki
  let s:vim_wiki_state_dir = $HOME."/.local/share/vimwiki"

  let s:personal_wiki = {}
  let s:personal_wiki.path = s:vim_wiki_state_dir."/personal/"

  let g:vimwiki_list = [ s:personal_wiki ]


  function! s:OnData(id, data, event) dict
    let str = join(a:data, "\n")
    echomsg str
  endfunction

  let s:jobOption = {}
  let s:jobOption.on_stdout = function('s:OnData')
  let s:jobOption.on_stderr = function('s:OnData')

  let s:timer = ""
  
  function! s:GitPull()
    let id = jobstart(['git', '-C', s:vim_wiki_state_dir, 'pull', '-q', '--rebase', 'origin', 'master' ], s:jobOption)
    let results = jobwait([id])
    if results[0] != 0
      echoerr "Failed to pull from remote repositry"
    endif
  endfunction

  function! s:GitCommit()
    let add_job = jobstart(['git', '-C', s:vim_wiki_state_dir, 'add', '.'], s:jobOption)
    let result = jobwait([add_job])[0]
    if result != 0
      erroerr "Failed to add files to index"
    endif
    let id = jobstart(['git', '-C', s:vim_wiki_state_dir, 'commit', '-m', 'Auto commit', '.'], s:jobOption)
  endfunction

  function! s:GitPush()
    let id = jobstart(['git', '-C', s:vim_wiki_state_dir, 'push', '-q', 'origin', 'master'], s:jobOption)
    let results = jobwait([id])
    if results[0] != 0
      echoerr "Failed to push to remote repositry"
    endif
  endfunction

  function! s:VimWikiStart()
    call s:GitPull()
    let s:timer = timer_start(1000 * 60 * 1, function('s:TimerHandler'), { 'repeat': -1 })
  endfunction

  function! s:VimWikiStop() 
    call s:GitPush()
  endfunction

  function! s:TimerHandler(timer)
    call s:GitPush()
  endfunction

  " sync changes at the start
  au!
  au BufWritePost *.wiki call s:GitCommit()
  au BufEnter index.wiki call s:VimWikiStart()
  au QuitPre index.wiki call s:VimWikiStop()
augroup END
