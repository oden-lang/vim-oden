" Vim syntax file
"      Language: Oden
"    Maintainer: Oskar Wickström <https://github.com/owickstrom>
"       Version: 0.1.0
"

if !exists("main_syntax")
  if version < 600
    syntax clear
  elseif exists("b:current_syntax")
    finish
  endif
  let main_syntax = 'oden'
endif

syntax keyword odenKeyword package import let in if then else any

syntax region odenComment         start="/\*" end="\*/"
syntax region odenMultiComment    start="/\*" end="\*/"
syntax region odenString          start=+"+ end=+"+
syntax match  odenOperator        "+\|-\|*\|/\|==\|!=\|<\|>\|<=\|>=\|->\|::"
syntax match  odenEquals          "=" contained
syntax match  odenBinding         "\w\+ =" contains=odenEquals
syntax match  odenBraces          "[{}\[\]]"

hi link odenBinding         Identifier
hi link odenOperator        Operator
hi link odenEquals          Operator
hi link odenString          String
hi link odenTextBlock       Special
hi link odenKey             Constant
hi link odenComment         Comment
hi link odenMultiComment    Comment


let b:current_syntax = "oden"
if main_syntax == 'oden'
  unlet main_syntax
endif
