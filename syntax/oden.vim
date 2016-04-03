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

syntax keyword odenKeyword    let in if then else type forall
syntax keyword odenBasicType  int string float bool ()
syntax keyword odenBuiltin    print println len
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
syntax match  odenOperator        ':'
syntax match  odenTypeOperator    '|' contained
syntax match  odenTypeOperator    '->' contained
syntax match  odenTypeOperator    '=' contained
syntax match  odenTypeOperator    ':' contained
syntax match  odenTypeOperator    '\.' contained
syntax match  odenTypeOperator    'forall' contained
syntax match  odenTypeSymbol      "\v[a-zA-Z]\w*" contained
syntax match  odenType            "\v.*" contained transparent contains=odenBasicType,odenTypeSymbol,odenTypeOperator
syntax match  odenIdentifier      "\v\w[^ \(\)]*"
syntax match  odenNumber          "\v[+-]?\d+"
syntax match  odenFloat           "\v[+-]?\d\.\d+"
syntax match  odenFloat           "\v\.\d+"
syntax match  odenDefinitionName  "\v\w+"  contained
syntax match  odenSignatureName   "\v\w[^ \(]*"  contained
syntax match  odenDefinition      "\v^[a-zA-Z][^ \(]* =" contains=odenDefinitionName,odenEquals,odenOperator
syntax match  odenSignature       "\v^[a-zA-Z][^ \(]*\s*:" contains=odenDefinitionName nextgroup=odenType
syntax match  odenBraces          "[{}\[\]]"
syntax match  odenComment         "\v//.*$"
syntax region odenMultiComment    start="/\*" end="\*/"
syntax match  odenPackagePath     '.*$' contained
syntax match  odenPackageDecl     '^package\s*' nextgroup=odenPackagePath
syntax match  odenImport          '^import\s*' nextgroup=odenPackagePath
syntax region odenString          start=+"+ skip=+\\\\\|\\"+ end=+"+ contains=odenEscapeC

hi link odenOperator        Operator
hi link odenType            Type
hi link odenTypeOperator    Type
hi link odenTypeVariable    Type
hi link odenTypeSymbol      Type
hi link odenBasicType       Special
hi link odenEquals          Operator
hi link odenString          String
hi link odenEscapeC         Special
hi link odenNumber          Number
hi link odenFloat           Float
hi link odenKeyword         Keyword
hi link odenBuiltin         Special
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
