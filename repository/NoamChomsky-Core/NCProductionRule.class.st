"
a production rule of the grammar.
a production rule that specify which symbols may replace which other symbols, these rules may be used to generate strings, or to parse them.

Each such rule has a head, or left hand side, which consists of the string that may be replaced, and a body, or right hand side, which consists of a string that may replace it. Rules are often written in the form

head: body.

head is a nonterminal.
body is list of symbols. (terminal or nonterminal)

"
Class {
	#name : #NCProductionRule,
	#superclass : #Object,
	#instVars : [
		'head',
		'body'
	],
	#category : #'NoamChomsky-Core'
}

{ #category : #'instance creation' }
NCProductionRule class >> head: aNonterminal body: aSymbolArray [
	self assert: aNonterminal isNonterminal.
	^ self basicNew initializeHead: aNonterminal body: aSymbolArray
]

{ #category : #comparing }
NCProductionRule >> = aRule [
	self == aRule 
		ifTrue: [ ^ true ].
	self class == aRule class
		ifFalse: [ ^ false ].
	head = aRule head
		ifFalse: [ ^ false ].
	body size == aRule body size
		ifFalse: [ ^ false ].
	body
		with: aRule body
		do: [ :first :second | 
			first = second
				ifFalse: [ ^ false ] ].
	^ true
]

{ #category : #accessing }
NCProductionRule >> body [
	^ body
]

{ #category : #comparing }
NCProductionRule >> hash [
	| hash |
	hash := (self class hash + head hash) hashMultiply.
	body do: [ :each | hash := (hash + each hash) hashMultiply ].
	^ hash
]

{ #category : #accessing }
NCProductionRule >> head [
	^ head
]

{ #category : #initialization }
NCProductionRule >> initializeHead: aNonterminal body: aSymbolArray [
	self initialize.
	head := aNonterminal.
	body := aSymbolArray
]

{ #category : #printing }
NCProductionRule >> printOn: aStream [
	"head: body.
	 head: . "

	head printOn: aStream.
	aStream nextPutAll: ': '.
	body do: [ :each | each printOn: aStream ] separatedBy: [ aStream nextPutAll: ', ' ].
	aStream nextPut: $.
]
