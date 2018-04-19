"
a nonterminal.
	name: like 'E'.
	
example:
JENonterminal named: 'E'
"
Class {
	#name : #JENonterminal,
	#superclass : #JESymbol,
	#instVars : [
		'name'
	],
	#category : 'EarleyParser-Core-Implementation'
}

{ #category : #'instance creation' }
JENonterminal class >> named: aNameString [
	^ self basicNew initializeName: aNameString
]

{ #category : #'instance creation' }
JENonterminal class >> start [
	"start nonterminal only used by the algorithm."

	^ self named: 'START'
]

{ #category : #comparing }
JENonterminal >> = anObject [
	^ self class == anObject class and: [ name == anObject named ]
]

{ #category : #comparing }
JENonterminal >> hash [
	^ (self class hash + name hash) hashMultiply
]

{ #category : #initialization }
JENonterminal >> initializeName: aNameString [
	self initialize.
	name := aNameString asSymbol 
]

{ #category : #testing }
JENonterminal >> isNonterminal [
	^ true
]

{ #category : #testing }
JENonterminal >> isTerminal [
	^ false
]

{ #category : #accessing }
JENonterminal >> named [
	^ name
]

{ #category : #printing }
JENonterminal >> printOn: aStream [
	"name"

	aStream nextPutAll: name
]