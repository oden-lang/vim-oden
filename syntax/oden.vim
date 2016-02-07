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

syntax keyword odenKeyword    let in if then else any
syntax keyword odenBasicType  int string float bool
syntax keyword odenBoolean    true false

syntax region odenString          start=+"+ end=+"+
syntax match  odenOperator        '++'
syntax match  odenOperator        '+'
syntax match  odenOperator        '-'
syntax match  odenOperator        '*'
syntax match  odenOperator        '/'
syntax match  odenOperator        '=='
syntax match  odenOperator        '!='
syntax match  odenOperator        '<'
syntax match  odenOperator        '>'
syntax match  odenOperator        '<='
syntax match  odenOperator        '>='
syntax match  odenOperator        '->'
syntax match  odenNumber          "\v[+-]?\d+"
syntax match  odenFloat           "\v[+-]?\d\.\d+"
syntax match  odenFloat           "\v\.\d+"
syntax match  odenTypeOperator    '::'
syntax match  odenTypeVariable    '\v#[a-zA-Z]+' contained
syntax match  odenType            "\v.*$"   contained contains=odenBasicType,odenTypeVariable
syntax match  odenEquals          "="       contained
syntax match  odenDefinitionName  "\v^\w+"  contained
syntax match  odenDefinition      "\v^\w+ =" contains=odenDefinitionName,odenEquals
syntax match  odenDefinition      "\v^\w+\s+(\w+\s+)*->" contains=odenDefinitionName,odenOperator
syntax match  odenSignature       "\v^\w+\s+::" transparent contains=odenDefinitionName,odenTypeOperator nextgroup=odenType
syntax match  odenPackageMember   "\v[a-zA-Z/.]+\.\w+"
syntax match  odenBinding         "\w\+ ="  contains=odenEquals
syntax match  odenBraces          "[{}\[\]]"
syntax match  odenComment         "\v//.*$"
syntax region odenMultiComment    start="/\*" end="\*/"
syntax match  odenPackagePath     '.*$' contained
syntax match  odenPackageDecl     '^package\s*' nextgroup=odenPackagePath
syntax match  odenImport          '^import\s*' nextgroup=odenPackagePath

hi link odenBinding         Identifier
hi link odenOperator        Operator
hi link odenTypeOperator    Operator
hi link odenTypeVariable    Label
hi link odenType            Normal
hi link odenBasicType       Special
hi link odenEquals          Operator
hi link odenString          String
hi link odenNumber          Number
hi link odenFloat           Float
hi link odenKeyword         Keyword
hi link odenPackageDecl     Keyword
hi link odenImport          Keyword
hi link odenBoolean         Boolean
hi link odenDefinitionName  Identifier
hi link odenPackageMember   Include
hi link odenPackagePath     Include
hi link odenSignature       SpecialComment
hi link odenComment         Comment
hi link odenMultiComment    Comment

let b:current_syntax = "oden"
if main_syntax == 'oden'
  unlet main_syntax
endif
