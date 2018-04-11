"
an ordered pair of objects.

(first, second)

first - an object.
second - an object.

In mathematics, an ordered pair (a, b) is a pair of mathematical objects. The order in which the objects appear in the pair is significant: the ordered pair (a, b) is different from the ordered pair (b, a) unless a = b.
Let ( a1 , b1 )  and ( a2 , b2 )  be ordered pairs. Then the characteristic (or defining) property of the ordered pair is:

    ( a1 , b1 ) = ( a2 , b2 ) if and only if a1 = a2  and  b1 = b2 .

"
Class {
	#name : #JEOrderedPair,
	#superclass : #Object,
	#instVars : [
		'first',
		'second'
	],
	#category : 'EarleyParser-Core-Implementation'
}

{ #category : #'instance creation' }
JEOrderedPair class >> empty [
	^ self new
]

{ #category : #'instance creation' }
JEOrderedPair class >> first: firstObject [
	^ self new
		first: firstObject;
		yourself
]

{ #category : #'instance creation' }
JEOrderedPair class >> first: firstObject second: secondObject [
	^ self new
		first: firstObject;
		second: secondObject;
		yourself
]

{ #category : #'instance creation' }
JEOrderedPair class >> second: secondObject [
	^ self new
		second: secondObject;
		yourself
]

{ #category : #comparing }
JEOrderedPair >> = aPair [
	self == aPair
		ifTrue: [ ^ true ].
	self class == aPair class
		ifFalse: [ ^ false ].
	^ first = aPair first and: [ second = aPair second ]
]

{ #category : #accessing }
JEOrderedPair >> first [
	^ first
]

{ #category : #accessing }
JEOrderedPair >> first: anObject [
	first := anObject
]

{ #category : #comparing }
JEOrderedPair >> hash [
	^ (first hash + second hash) hashMultiply
]

{ #category : #printing }
JEOrderedPair >> printOn: aStream [
	aStream
		nextPut: $(;
		print: first;
		nextPutAll: ', ';
		print: second;
		nextPut: $)
]

{ #category : #accessing }
JEOrderedPair >> second [
	^ second
]

{ #category : #accessing }
JEOrderedPair >> second: anObject [
	second := anObject
]
