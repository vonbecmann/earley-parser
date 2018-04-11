Extension { #name : #JEGrammar }

{ #category : #'*EarleySyntaxTree' }
JEGrammar >> parseTree: words [
	"returns a syntax tree"

	^ (ESyntaxTreeParser given: self) parse: words
]

{ #category : #'*EarleySyntaxTree' }
JEGrammar >> parseTree: words startingAt: aNonterminalNamed [
	"returns a syntax tree starting at a given nonterminal"

	^ (self startAt: aNonterminalNamed) parseTree: words
]
