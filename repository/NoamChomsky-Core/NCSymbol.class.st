"
a symbol of the grammar
"
Class {
	#name : #NCSymbol,
	#superclass : #Object,
	#category : #'NoamChomsky-Core'
}

{ #category : #testing }
NCSymbol >> isNonterminal [
	self subclassResponsibility
]

{ #category : #testing }
NCSymbol >> isTerminal [
	self subclassResponsibility
]

{ #category : #printing }
NCSymbol >> printString [
	^ String streamContents: [ :stream | self printOn: stream ]
]
