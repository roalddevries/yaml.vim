" {{{ Stream
" A stream is the only top-level syntax item
syntax region Stream
	\ start=/\%^/
	\ end=/\%$/
	\ fold keepend
	\ contains=DirectivesDocument,ExplicitDocument,BareDocument
" }}}

" {{{ DirectivesDocument
syntax region DirectivesDocument
	\ start=/^%/
	\ end=/^\.\.\.\|^\(---\)\_.\{-}^\(---\)\@=/
	\ keepend
	\ contains=Directives,ExplicitDocument
	\ contained
" }}}

" {{{ Directives
syntax region Directives
	\ start=/^%/
	\ end=/^\.\.\.\|^\(---\)\@=/
	\ fold keepend
	\ contains=NONE
	\ contained
" }}}

" {{{ ExplicitDocument
syntax region ExplicitDocument
	\ start=/^---/
	\ end=/^\.\.\.\|^\(---\)\@=/
	\ fold keepend
	\ contains=BlockSequenceContent,BlockMappingContent
	\ contained
" }}}

" {{{ BareDocument
syntax region BareDocument
	\ start=/.\?/
	\ end=/^\.\.\.\|^\(---\)\@=/
	\ fold keepend
	\ contains=BlockSequenceContent,BlockMappingContent
	\ contained
" }}}

" {{{ BlockSequenceContent
syntax region BlockSequenceContent
	\ start=/^\(\z( *\)-\( \|$\)\)\@=/
	\ end=/^\(\.\.\.\|---\)\@=/
	\ fold keepend
	\ contains=BlockSequenceEntry
	\ contained
" }}}

" {{{ BlockSequenceEntry
syntax region BlockSequenceEntry
	\ start=/^\z( *\)-\( \|$\)/
	\ end=/^\(\z1-\)\@=/
	\ fold keepend
	\ contains=None
	\ contained
" }}}

" {{{ BlockMapping
  " start:
  "        +--------+ white spaces
  "                  +--------------------------------------+ either
  "                    +----+                                 an explicit key
  "                          ++                               OR
  "                            +--------------------------+   an implicit key
syntax region BlockMappingContent
	\ start=/^\(\z( *\)\(? \|?$\|\([^ ?-]\|-[^ ]\).*:\( \|$\)\)\)\@=/
	\ end=/^\(\.\.\.\|---\)\@=/
	\ fold keepend
	\ contains=BlockMappingExplicitEntry,BlockMappingImplicitEntry
	\ contained
" }}}

" {{{ BlockMappingExplicitEntry
syntax region BlockMappingExplicitEntry
	\ start=/^\z( *\)?\( \|$\)/
	\ end=/^\(\z1\(? \|?$\|\([^ ?-]\|-[^ ]\).*:\( \|$\)\)\)\@=/
	\ fold keepend
	\ contains=NONE
	\ contained
" }}}

" {{{ BlockMappingImplicitEntry
syntax region BlockMappingImplicitEntry
	\ start=/^\z( *\)\([^ ?-]\|-[^ ]\).*:/
	\ end=/^\(\z1\(? \|?$\|\([^ ?-]\|-[^ ]\).*:\( \|$\)\)\)\@=/
	\ fold keepend
	\ contains=NONE
	\ contained
" }}}
