"
a identity ordered pair.

 < a1 , b1 > = < a2 , b2 > if and only if a1 == a2  and  b1 == b2 .
"
Class {
	#name : #JEIdentityOrderedPair,
	#superclass : #JEOrderedPair,
	#category : 'EarleyParser-Core-Implementation'
}

{ #category : #comparing }
JEIdentityOrderedPair >> = aPair [
	self == aPair
		ifTrue: [ ^ true ].
	self class == aPair class
		ifFalse: [ ^ false ].
	^ first == aPair first and: [ second == aPair second ]
]

{ #category : #comparing }
JEIdentityOrderedPair >> hash [
	^ (first identityHash + second identityHash) hashMultiply
]

{ #category : #printing }
JEIdentityOrderedPair >> printOn: aStream [
	aStream
		nextPut: $<;
		print: first;
		nextPutAll: ', ';
		print: second;
		nextPut: $>
]
