"
A set of characters define a terminal.

charSet - a character set of a given character collection.

"
Class {
	#name : #NCCharacterSetTerminal,
	#superclass : #NCTerminal,
	#instVars : [
		'charSet'
	],
	#category : #'NoamChomsky-Core'
}

{ #category : #'instance creation' }
NCCharacterSetTerminal class >> of: aCharacterCollection [
	^ self basicNew initializeCharSet: aCharacterCollection
]

{ #category : #comparing }
NCCharacterSetTerminal >> = anObject [
	^ self class = anObject class and: [ charSet = anObject charSet ]
]

{ #category : #accessing }
NCCharacterSetTerminal >> charSet [
	^ charSet
]

{ #category : #comparing }
NCCharacterSetTerminal >> hash [
	^ (self class hash + charSet hash) hashMultiply
]

{ #category : #initialization }
NCCharacterSetTerminal >> initializeCharSet: aCharacterCollection [
	self initialize.
	charSet := CharacterSet newFrom: aCharacterCollection
]

{ #category : #comparing }
NCCharacterSetTerminal >> matches: aCharacter [
	^ charSet includes: aCharacter
]

{ #category : #printing }
NCCharacterSetTerminal >> printOn: aStream [
	aStream
		print: charSet asString;
		nextPutAll: 'CharSet'
]
