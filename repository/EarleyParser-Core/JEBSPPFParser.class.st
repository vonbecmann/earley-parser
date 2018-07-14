"
Jay Earley Algorithm as a Parser.
returns a 
Binary Shared Packed Parse Forest (BSPPF)
	with its root is the final item.
	

"
Class {
	#name : #JEBSPPFParser,
	#superclass : #JEAlgorithm,
	#category : 'EarleyParser-Core-Parsing'
}

{ #category : #'private operations' }
JEBSPPFParser >> buildForestFrom: finalItem [
	"remove the START symbol from the forest, so the root is the first nonterminal of the grammar"

	| startNode startFamily |
	startNode := finalItem node.
	self assert: [ startNode children size = 1 ].
	startFamily := startNode children first.
	self assert: [ startFamily children size = 1 ].
	^ JEBSPPForest root: startFamily first
]

{ #category : #'private operations' }
JEBSPPFParser >> complete: item [
	item
		predictionItemsWithSymbolAtDotIsHeadDo:
			[ :previous | (item end moveDotForward: previous) addFamily: (previous newFamilyWith: item) ]
]

{ #category : #public }
JEBSPPFParser >> parse: words [
	"returns a Binary Shared Packed Parse Forest"

	| chart finalItem |
	chart := self evaluate: words.
	finalItem := grammar startRule dotAtEnd startedAt: chart first.
	^ (chart last includes: finalItem)
			ifTrue: [ self buildForestFrom: (chart last like: finalItem) ]
			ifFalse: [ JEFailure failedAtLast: chart last ]
]

{ #category : #'private operations' }
JEBSPPFParser >> scan: item with: word at: column [
	| terminal |
	terminal := column addTerminalItem: (JETerminalItem given: item symbolAtDot word: word startedAt: item end).
	(column moveDotForward: item) addFamilyWith: item and: terminal
]
