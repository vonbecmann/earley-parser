"
a nonterminal.
	name: like 'E'.
Nonterminal symbols are those symbols which can be replaced.
They may also be called simply syntactic variables.

example:
JENonterminal named: 'E'
"
Class {
	#name : #JENonterminal,
	#superclass : #NCSymbol,
	#instVars : [
		'name'
	],
	#category : #'NoamChomsky-Core'
}

{ #category : #'instance creation' }
JENonterminal class >> named: aNameString [
	^ self basicNew initializeName: aNameString
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
