"
the character set defined by a regular expression.
Using The Regular Expression Matcher, Vassili Bykov.  

For example
	self rxCharSet: '[\w]'.
 recognize any word constituent character (same as [a-zA-Z0-9_])

"
Class {
	#name : #NCRxCharacterSetTerminal,
	#superclass : #NCTerminal,
	#instVars : [
		'matcher',
		'charSetRegex'
	],
	#category : #'NoamChomsky-Regex-Public'
}

{ #category : #'instance creation' }
NCRxCharacterSetTerminal class >> rxCharSet: aCharSetRegex [
	"a character set regular expression that defines a character set terminal"

	^ self basicNew initializeCharSetRegex: aCharSetRegex
]

{ #category : #comparing }
NCRxCharacterSetTerminal >> = anObject [
	^ self class = anObject class and: [ charSetRegex = anObject charSetRegex ]
]

{ #category : #accessing }
NCRxCharacterSetTerminal >> charSetRegex [
	^ charSetRegex
]

{ #category : #comparing }
NCRxCharacterSetTerminal >> hash [
	^ (self class hash + charSetRegex hash) hashMultiply
]

{ #category : #initialization }
NCRxCharacterSetTerminal >> initializeCharSetRegex: aCharSetRegexString [ 
	self initialize.
	charSetRegex := aCharSetRegexString.
	matcher := aCharSetRegexString asRegex 
]

{ #category : #comparing }
NCRxCharacterSetTerminal >> matches: aCharacter [
	^ matcher matches: (String with: aCharacter)
]

{ #category : #printing }
NCRxCharacterSetTerminal >> printOn: aStream [
	aStream
		print: charSetRegex;
		nextPutAll: 'RxCharSet'
]
