"
a nonterminal.
	name: like 'E'.
Nonterminal symbols are those symbols which can be replaced.
They may also be called simply syntactic variables.

example:
NCNonterminal named: 'E'
"
Class {
	#name : #NCNonterminal,
	#superclass : #NCSymbol,
	#instVars : [
		'name'
	],
	#category : #'NoamChomsky-Core'
}

{ #category : #'instance creation' }
NCNonterminal class >> named: aNameString [
	^ self basicNew initializeName: aNameString
]

{ #category : #comparing }
NCNonterminal >> = anObject [
	self == anObject
		ifTrue: [ ^ true ].
	^ self class == anObject class and: [ name == anObject named ]
]

{ #category : #comparing }
NCNonterminal >> hash [
	^ (self class hash + name hash) hashMultiply
]

{ #category : #initialization }
NCNonterminal >> initializeName: aNameString [
	self initialize.
	name := aNameString asSymbol 
]

{ #category : #testing }
NCNonterminal >> isNonterminal [
	^ true
]

{ #category : #testing }
NCNonterminal >> isTerminal [
	^ false
]

{ #category : #accessing }
NCNonterminal >> named [
	^ name
]

{ #category : #printing }
NCNonterminal >> printOn: aStream [
	"name"

	aStream nextPutAll: name
]
