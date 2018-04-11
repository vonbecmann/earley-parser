"
a dotted rule stands for a rule with the dot indicating how much has already been found and how much is still predicted.
a dotted rule is final if the dot is at the end.
a dotted rule is predicted if the dot is at the beginning.

they are unique objects due to performance reasons.
once a dotted rule is instantianted cannot be changed.

rule - an instance of JERule.
dotIndex - indicates where's the dot in the rule, ie how much has been done.
symbolAtDot - what symbol is at the right side of the dot.
                                nil if it is final(completed).
next - the next dotted rule (myself with the dot move forward)




"
Class {
	#name : #JEDottedRule,
	#superclass : #Object,
	#instVars : [
		'rule',
		'dotIndex',
		'symbolAtDot',
		'final',
		'active',
		'predicted',
		'epsilon',
		'next'
	],
	#category : 'EarleyParser-Core-Implementation'
}

{ #category : #'instance creation' }
JEDottedRule class >> given: aRule withDotAt: index [
	^ self basicNew initializeRule: aRule dotAt: index
]

{ #category : #comparing }
JEDottedRule >> = aDottedRule [
	self == aDottedRule
		ifTrue: [ ^ true ].
	self class == aDottedRule class
		ifFalse: [ ^ false ].
	^ dotIndex == aDottedRule dotIndex and: [ rule == aDottedRule rule ]
]

{ #category : #accessing }
JEDottedRule >> body [
	^ rule body
]

{ #category : #accessing }
JEDottedRule >> dotIndex [
	^ dotIndex
]

{ #category : #comparing }
JEDottedRule >> hash [
	^ (rule identityHash + dotIndex hash) hashMultiply
]

{ #category : #accessing }
JEDottedRule >> head [
	^ rule head
]

{ #category : #initialization }
JEDottedRule >> initializeRule: aRule dotAt: index [
	self initialize.
	rule := aRule.
	dotIndex := index.
	final := rule body size < dotIndex.
	predicted := dotIndex = 1 and: [ final not ].
	active := final not and: [ predicted not ].
	epsilon := rule isEpsilon.
	symbolAtDot := final
		ifTrue: [ nil ]
		ifFalse: [ rule body at: dotIndex ]
]

{ #category : #testing }
JEDottedRule >> isActive [
	"when dot is in the middle of the rule"

	^ active
]

{ #category : #testing }
JEDottedRule >> isEpsilon [
	^ epsilon
]

{ #category : #testing }
JEDottedRule >> isFinal [
	"when dot is at the end of the rule"

	^ final
]

{ #category : #testing }
JEDottedRule >> isPredicted [
	"when dot is at the beginning of the rule"

	^ predicted
]

{ #category : #accessing }
JEDottedRule >> moveDotForward [
	"a dotted rule of myself with dot move forward"

	^ next
]

{ #category : #initialization }
JEDottedRule >> next: aDottedRule [
	next := aDottedRule
]

{ #category : #printing }
JEDottedRule >> printOn: aStream [
	"head: body with dot.
	 head: ·. "

	| middleDot |
	middleDot := Character value: 183.
	rule head printOn: aStream.
	aStream nextPutAll: ': '.
	rule body
		withIndexDo: [ :each :index | 
			index = 1
				ifFalse: [ aStream nextPutAll: ', ' ].
			index = self dotIndex
				ifTrue: [ aStream nextPut: middleDot ].
			each printOn: aStream ].
	self isFinal
		ifTrue: [ aStream nextPut: middleDot ].
	aStream nextPut: $.
]

{ #category : #accessing }
JEDottedRule >> rule [
	^ rule
]

{ #category : #accessing }
JEDottedRule >> startedAt: column [
	"an item of myself that started at the given column"

	^ JEDottedItem given: self startedAt: column
]

{ #category : #accessing }
JEDottedRule >> startedAt: firstColumn andEndedAt: secondColumn [
	"an item of myself that started and ended at the given columns"

	^ JEDottedItem given: self startedAt: firstColumn andEndedAt: secondColumn
]

{ #category : #accessing }
JEDottedRule >> symbolAtDot [
	^ symbolAtDot
]
