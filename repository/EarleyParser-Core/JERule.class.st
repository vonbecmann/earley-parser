"
a rule of the given grammar used by the algorithm. (it has many optimizations) .
	
	head ::= body.

head or left hand-side. head is a nonterminal.

body or right hand-side.
	body is a collection of symbols (terminals and nonterminals)
	body could be empty when you have a empty or epsilon rule. (A ::= epsilon).
	is an array for performance  reasons.
	
dottedRules - its associated dotted rules. a dotted rule for each position on the body.
	
they should be unique objects, because the algorithm compare rules by identity.
in the same way nonterminals should be unique.


"
Class {
	#name : 'JERule',
	#superclass : 'Object',
	#instVars : [
		'head',
		'body',
		'dottedRules'
	],
	#category : 'EarleyParser-Core-Implementation',
	#package : 'EarleyParser-Core',
	#tag : 'Implementation'
}

{ #category : 'instance creation' }
JERule class >> head: aNonterminal body: aCollection [
	^ self basicNew initializeHead: aNonterminal body: aCollection
]

{ #category : 'comparing' }
JERule >> = aRule [
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

{ #category : 'accessing' }
JERule >> body [
	^ body
]

{ #category : 'instance creation' }
JERule >> dotAt: index [
	"a dotted rule of myself with dot at index"

	^ dottedRules at: index
]

{ #category : 'instance creation' }
JERule >> dotAtBeginning [
	"a dotted rule of myself with dot at the beginning"

	^ dottedRules first
]

{ #category : 'instance creation' }
JERule >> dotAtEnd [
	"a dotted rule of myself with dot at the end"

	^ dottedRules last
]

{ #category : 'comparing' }
JERule >> hash [
	| hash |
	hash := (self class hash + head hash) hashMultiply.
	body do: [ :each | hash := (hash + each hash) hashMultiply ].
	^ hash
]

{ #category : 'accessing' }
JERule >> head [
	^ head
]

{ #category : 'initialization' }
JERule >> initializeHead: aNonterminal body: aCollection [
	head := aNonterminal.
	body := aCollection asArray.
	dottedRules := (1 to: body size + 1) collect: [ :index | JEDottedRule given: self withDotAt: index ].
	dottedRules reversed
		inject: nil
		into: [ :nextDottedRule :each |
			each
				next: nextDottedRule;
				yourself ]
]

{ #category : 'testing' }
JERule >> isEpsilon [
	"am i an epsilon(empty) rule?"

	^ body isEmpty
]

{ #category : 'testing' }
JERule >> isRepresentation [
	"am i a representation rule?"

	^ body size = 1 and: [ body first isTerminal ]
]

{ #category : 'printing' }
JERule >> printOn: aStream [
	"head: body.
	 head: . "

	head printOn: aStream.
	aStream nextPutAll: ': '.
	body
		do: [ :each | each printOn: aStream ]
		separatedBy: [ aStream nextPutAll: ', ' ].
	aStream nextPut: $.
]
