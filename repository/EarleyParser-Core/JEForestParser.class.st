"
Jay Earley Algorithm as a Parser.
It will return a parse forest .
where the syntax forest is a
Binary Shared Packed Parse Forest (BSPPF)
	with its root is the final item.
"
Class {
	#name : #JEForestParser,
	#superclass : #JEAlgorithm,
	#category : #'EarleyParser-Core-Implementation'
}

{ #category : #'private operations' }
JEForestParser >> complete: item [
	item
		predictionItemsWithSymbolAtDotIsHeadDo: [ :previous | 
			previous addFamilyWith: item to: (item end moveDotForward: previous) ]
]

{ #category : #'private operations' }
JEForestParser >> newForestFrom: finalItem [
	"remove the START symbol from the forest, so the root is the first nonterminal of the grammar"

	self
		assert: [ finalItem familiesSize = 1 ];
		assert: [ finalItem families first size = 1 ].
	^ JEBSPPForest root: finalItem families first first
]

{ #category : #public }
JEForestParser >> parse: words [
	"returns a parse forest"

	| chart syntaxForest |
	chart := self evaluate: words.
	syntaxForest := chart last
		like: (grammar startRule dotAtEnd startedAt: chart first)
		ifFound: [ :found | self newForestFrom: found ]
		ifNone: [ JEFailure failedAtLast: chart last ].
	^ JEParseForest given: syntaxForest of: grammar
]

{ #category : #'private operations' }
JEForestParser >> scan: item with: word at: column [
	item
		addFamilyWith: 
			(column 
				addTerminalItem: (item symbolAtDot match: word startedAt: item end))
		to: (column moveDotForward: item)
]
