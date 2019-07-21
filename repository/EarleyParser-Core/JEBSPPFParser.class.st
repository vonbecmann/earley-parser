"
Jay Earley Algorithm as a Parser.
returns a 
Binary Shared Packed Parse Forest (BSPPF)
	with its root is the final item.
	

"
Class {
	#name : #JEBSPPFParser,
	#superclass : #JEAlgorithm,
	#category : #'EarleyParser-Core-Implementation'
}

{ #category : #'private operations' }
JEBSPPFParser >> complete: item [
	item
		predictionItemsWithSymbolAtDotIsHeadDo: [ :previous | 
			previous addFamilyWith: item to: (item end moveDotForward: previous) ]
]

{ #category : #'private operations' }
JEBSPPFParser >> newForestFrom: finalItem [
	"remove the START symbol from the forest, so the root is the first nonterminal of the grammar"

	self
		assert: [ finalItem familiesSize = 1 ];
		assert: [ finalItem families first size = 1 ].
	^ JEBSPPForest root: finalItem families first first
]

{ #category : #public }
JEBSPPFParser >> parse: words [
	"returns a Binary Shared Packed Parse Forest"

	| chart |
	chart := self evaluate: words.
	^ chart last
		like: (grammar startRule dotAtEnd startedAt: chart first)
		ifFound: [ :found | self newForestFrom: found ]
		ifNone: [ JEFailure failedAtLast: chart last ]
]

{ #category : #'private operations' }
JEBSPPFParser >> scan: item with: word at: column [
	item
		addFamilyWith: 
			(column 
				addTerminalItem: (item symbolAtDot match: word startedAt: item end))
		to: (column moveDotForward: item)
]
