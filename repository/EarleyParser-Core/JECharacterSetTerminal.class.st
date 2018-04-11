"
A set of characters define a terminal.

charSet - a character set of a given character collection.

"
Class {
	#name : #JECharacterSetTerminal,
	#superclass : #JETerminal,
	#instVars : [
		'charSet'
	],
	#category : 'EarleyParser-Core-Public'
}

{ #category : #'instance creation' }
JECharacterSetTerminal class >> of: aCharacterCollection [
	^ self basicNew initializeCharSet: aCharacterCollection
]

{ #category : #comparing }
JECharacterSetTerminal >> = anObject [
	^ self class = anObject class and: [ charSet = anObject charSet ]
]

{ #category : #accessing }
JECharacterSetTerminal >> charSet [
	^ charSet
]

{ #category : #comparing }
JECharacterSetTerminal >> hash [
	^ (self class hash + charSet hash) hashMultiply
]

{ #category : #initialization }
JECharacterSetTerminal >> initializeCharSet: aCharacterCollection [
	self initialize.
	charSet := CharacterSet newFrom: aCharacterCollection
]

{ #category : #comparing }
JECharacterSetTerminal >> matches: aCharacter [
	^ charSet includes: aCharacter
]

{ #category : #printing }
JECharacterSetTerminal >> printOn: aStream [
	aStream
		print: charSet asString;
		nextPutAll: 'CharSet'
]
