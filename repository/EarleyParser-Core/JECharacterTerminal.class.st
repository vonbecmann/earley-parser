"
a character as a terminal
"
Class {
	#name : #JECharacterTerminal,
	#superclass : #JETerminal,
	#instVars : [
		'character'
	],
	#category : 'EarleyParser-Core-Public'
}

{ #category : #'instance creation' }
JECharacterTerminal class >> character: aCharacter [
	^ self basicNew initializeCharacter: aCharacter
]

{ #category : #comparing }
JECharacterTerminal >> = anObject [
	^ self class = anObject class and: [ character = anObject character ]
]

{ #category : #accessing }
JECharacterTerminal >> character [
	^ character
]

{ #category : #comparing }
JECharacterTerminal >> hash [
	^ (self class hash + character hash) hashMultiply
]

{ #category : #initialization }
JECharacterTerminal >> initializeCharacter: aCharacter [
	self initialize.
	character := aCharacter
]

{ #category : #comparing }
JECharacterTerminal >> matches: aCharacter [
	^ character = aCharacter
]

{ #category : #printing }
JECharacterTerminal >> printOn: aStream [
	character printOn: aStream
]
