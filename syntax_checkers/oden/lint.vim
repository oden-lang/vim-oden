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
                \ 'args': 'lint' })

    " TODO: Fix this
    " let errorformat = '%A"%f" (line %l\, column %c):,%C%m'
    let errorformat = '%m'

    return SyntasticMake({ 'makeprg': makeprg, 'errorformat': errorformat })
endfunction

call g:SyntasticRegistry.CreateAndRegisterChecker({
            \ 'filetype': 'oden',
            \ 'name': 'lint',
            \ 'exec': 'oden' })

let &cpo = s:save_cpo
unlet s:save_cpo

" vim: set sw=4 sts=4 et fdm=marker:
