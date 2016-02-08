if exists('g:loaded_oden_lint_checker')
    finish
endif
let g:loaded_oden_lint_checker = 1

let s:save_cpo = &cpo
set cpo&vim

function! SyntaxCheckers_oden_lint_IsAvailable() dict
    return executable(self.getExec())
endfunction

function! SyntaxCheckers_oden_lint_GetLocList() dict
    let makeprg = self.makeprgBuild({
                \ 'args': '-M lint' })

    let errorformat =
        \ '%E%f:%l:%c: error: %m,' .
        \ '%W%f:%l:%c: warning: %m,' .
        \ '%A%f: %m,%C%m'

    return SyntasticMake({ 'makeprg': makeprg, 'errorformat': errorformat })
endfunction

call g:SyntasticRegistry.CreateAndRegisterChecker({
            \ 'filetype': 'oden',
            \ 'name': 'lint',
            \ 'exec': 'oden' })

let &cpo = s:save_cpo
unlet s:save_cpo

" vim: set sw=4 sts=4 et fdm=marker:
