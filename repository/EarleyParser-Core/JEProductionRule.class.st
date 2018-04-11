"
a production rule of the grammar defined by the user.

head: body.

head is a nonterminal.
body is list of symbols. (terminal or nonterminal)

"
Class {
	#name : #JEProductionRule,
	#superclass : #Object,
	#instVars : [
		'head',
		'body'
	],
	#category : 'EarleyParser-Core-Public'
}

{ #category : #'instance creation' }
JEProductionRule class >> head: aNonterminal body: aSymbolArray [
	self assert: aNonterminal isNonterminal.
	^ self basicNew initializeHead: aNonterminal body: aSymbolArray
]

{ #category : #comparing }
JEProductionRule >> = aRule [
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
JEProductionRule >> body [
	^ body
]

{ #category : #comparing }
JEProductionRule >> hash [
	| hash |
	hash := ((self class hash + head hash) hashMultiply + body size hash) hashMultiply.
	body do: [ :each | hash := (hash + each hash) hashMultiply ].
	^ hash
]

{ #category : #accessing }
JEProductionRule >> head [
	^ head
]

{ #category : #initialization }
JEProductionRule >> initializeHead: aNonterminal body: aSymbolArray [
	self initialize.
	head := aNonterminal.
	body := aSymbolArray
]

{ #category : #printing }
JEProductionRule >> printOn: aStream [
	"head: body.
	 head: . "

	head printOn: aStream.
	aStream nextPutAll: ': '.
	body do: [ :each | each printOn: aStream ] separatedBy: [ aStream nextPutAll: ', ' ].
	aStream nextPut: $.
]
