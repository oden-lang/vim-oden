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

syntax keyword odenKeyword    let in if then else any type forall
syntax keyword odenBasicType  int string float bool ()
syntax keyword odenBoolean    true false

syntax match  odenEscapeC         display contained +\\[abfnrtv\\'"]+

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
syntax match  odenOperator        '='
syntax match  odenTypeOperator    ':'
syntax match  odenTypeOperator    '->'
syntax match  odenTypeOperator    '|'
syntax match  odenTypeOperator    '\.'
syntax match  odenType            ".[^\( ]$"   contained contains=odenBasicType,odenTypeOperator,odenEquals
syntax match  odenIdentifier  "\v\w[^ \(]*"
syntax match  odenNumber          "\v[+-]?\d+"
syntax match  odenFloat           "\v[+-]?\d\.\d+"
syntax match  odenFloat           "\v\.\d+"
syntax match  odenDefinitionName  "\v\w+"  contained
syntax match  odenSignatureName   "\v\w[^ \(]*"  contained
syntax match  odenDefinition      "\v^\w[^ \(]* =" contains=odenDefinitionName,odenEquals,odenOperator
syntax match  odenSignature       "\v^\w[^ \(]*\s*:{1}" contains=odenDefinitionName nextgroup=odenBasicType
syntax match  odenBraces          "[{}\[\]]"
syntax match  odenComment         "\v//.*$"
syntax region odenMultiComment    start="/\*" end="\*/"
syntax match  odenPackagePath     '.*$' contained
syntax match  odenPackageDecl     '^package\s*' nextgroup=odenPackagePath
syntax match  odenImport          '^import\s*' nextgroup=odenPackagePath
syntax region odenString          start=+"+ skip=+\\\\\|\\"+ end=+"+ contains=odenEscapeC

hi link odenOperator        Operator
hi link odenTypeOperator    Operator
hi link odenTypeVariable    Normal
hi link odenType            Normal
hi link odenBasicType       Special
hi link odenEquals          Operator
hi link odenString          String
hi link odenEscapeC         Special
hi link odenNumber          Number
hi link odenFloat           Float
hi link odenKeyword         Keyword
hi link odenPackageDecl     Keyword
hi link odenImport          Keyword
hi link odenBoolean         Boolean
hi link odenDefinitionName  Identifier
hi link odenIdentifier      Normal
hi link odenPackagePath     Include
hi link odenComment         Comment
hi link odenMultiComment    Comment

let b:current_syntax = "oden"
if main_syntax == 'oden'
  unlet main_syntax
endif
