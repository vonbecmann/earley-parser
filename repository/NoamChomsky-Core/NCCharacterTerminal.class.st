"
a character as a terminal
"
Class {
	#name : #NCCharacterTerminal,
	#superclass : #NCTerminal,
	#instVars : [
		'character'
	],
	#category : #'NoamChomsky-Core'
}

{ #category : #'instance creation' }
NCCharacterTerminal class >> character: aCharacter [
	^ self basicNew initializeCharacter: aCharacter
]

{ #category : #comparing }
NCCharacterTerminal >> = anObject [
	^ self class = anObject class and: [ character = anObject character ]
]

{ #category : #accessing }
NCCharacterTerminal >> character [
	^ character
]

{ #category : #comparing }
NCCharacterTerminal >> hash [
	^ (self class hash + character hash) hashMultiply
]

{ #category : #initialization }
NCCharacterTerminal >> initializeCharacter: aCharacter [
	self initialize.
	character := aCharacter
]

{ #category : #comparing }
NCCharacterTerminal >> matches: aCharacter [
	^ character = aCharacter
]

{ #category : #printing }
NCCharacterTerminal >> printOn: aStream [
	character printOn: aStream
]
