"
a symbol of the grammar
"
Class {
	#name : #JESymbol,
	#superclass : #Object,
	#category : 'EarleyParser-Core-Public'
}

{ #category : #testing }
JESymbol >> isNonterminal [
	self subclassResponsibility
]

{ #category : #testing }
JESymbol >> isTerminal [
	self subclassResponsibility
]
