"
implements the Jay Earley Algorithm.
look-ahead will not be considered

"
Class {
	#name : #JEAlgorithm,
	#superclass : #Object,
	#instVars : [
		'grammar'
	],
	#category : #'EarleyParser-Core-Implementation'
}

{ #category : #'instance creation' }
JEAlgorithm class >> given: aGrammar [
	^ self basicNew initializeGrammar: aGrammar
]

{ #category : #'private operations' }
JEAlgorithm >> complete: item [
	"
	Complete:
		For every state in S(k) of the form (X -> y *, j),
		find states in S(j) of the form (Y -> a * X b, i) and
			add (Y -> a X * b, i) to S(k).
	Optimized for efficiency.
	"

	self subclassResponsibility
]

{ #category : #'private template' }
JEAlgorithm >> evaluate: words [
	| n chart |
	n := words size + 1.
	chart := {(JEColumn numberOneWith: grammar startRule dotAtBeginning)}
		, ((2 to: n) collect: [ :index | JEColumn number: index ]).
	1 to: n do: [ :i |
		| column |
		column := chart at: i.
		column
			ifEmpty: [ ^ JEFailure failedAt: (chart at: i - 1) got: (words at: i - 1) ].
		column
			processItems: [ :item |
				item isFinal
					ifTrue: [ self complete: item ]
					ifFalse: [ item symbolAtDot isTerminal
							ifTrue: [ (i < n and: [ item symbolAtDot matches: (words at: i) ])
									ifTrue: [ self scan: item with: (words at: i) at: (chart at: i + 1) ] ]
							ifFalse: [ self predict: item ] ] ] ].
	^ chart
]

{ #category : #initialization }
JEAlgorithm >> initializeGrammar: aGrammar [
	self initialize.
	grammar := aGrammar
]

{ #category : #'private operations' }
JEAlgorithm >> predict: item [
	"
	Prediction:
		For every state in S(k) of the form (X -> a * Y b, j),
		add (Y -> * y, k) to S(k)
 	 		for every production in the grammar with Y on the left-hand side (Y -> y).

	i.e. add all respective predicted items for the given collection of dotted rules

	Complete Again:
		For every state in S(k) of the form (X -> a * Y b, j),
		For every state in S(k) of the form (Y -> y *, k),
			Complete (Y -> y *, k) in S(k).

	i.e. when predicting an nonterminal Y in item set k
			if there's a completed item with head Y (created in k) in the item set k
			then
				complete that completed item again in item set k,
				because we may missed to complete a newly created item.
	"
	" OPTIMIZED for efficiency. uses do: rather than collect: "

	(grammar alternativesOf: item symbolAtDot)
		do: [ :dottedRule | item end addDottedRule: dottedRule ].
	item finalItemsWithHeadIsSymbolAtDotDo: [ :again | self complete: again ]
]

{ #category : #'private operations' }
JEAlgorithm >> scan: item with: word at: column [
	"scan: add a new item with the dot move forward, over the recently scan terminal.
	If a is the next input symbol
	then
		For every state in S(k) of the form (X -> alpha *a beta, j),
			add (X -> alpha a *beta, j) to S(k+1).
	 Optimized fo efficiency. "

	self subclassResponsibility
]
