"
the character set defined by a regular expression.
Using The Regular Expression Matcher, Vassili Bykov.  

For example
	self rxCharSet: '[\w]'.
 recognize any word constituent character (same as [a-zA-Z0-9_])

"
Class {
	#name : #JERxCharacterSetTerminal,
	#superclass : #JETerminal,
	#instVars : [
		'matcher',
		'charSetRegex'
	],
	#category : #'NoamChomsky-Regex-Public'
}

{ #category : #'instance creation' }
JERxCharacterSetTerminal class >> rxCharSet: aCharSetRegex [
	"a character set regular expression that defines a character set terminal"

	^ self basicNew initializeCharSetRegex: aCharSetRegex
]

{ #category : #comparing }
JERxCharacterSetTerminal >> = anObject [
	^ self class = anObject class and: [ charSetRegex = anObject charSetRegex ]
]

{ #category : #accessing }
JERxCharacterSetTerminal >> charSetRegex [
	^ charSetRegex
]

{ #category : #comparing }
JERxCharacterSetTerminal >> hash [
	^ (self class hash + charSetRegex hash) hashMultiply
]

{ #category : #initialization }
JERxCharacterSetTerminal >> initializeCharSetRegex: aCharSetRegexString [ 
	self initialize.
	charSetRegex := aCharSetRegexString.
	matcher := aCharSetRegexString asRegex 
]

{ #category : #comparing }
JERxCharacterSetTerminal >> matches: aCharacter [
	^ matcher matches: (String with: aCharacter)
]

{ #category : #printing }
JERxCharacterSetTerminal >> printOn: aStream [
	aStream
		print: charSetRegex;
		nextPutAll: 'RxCharSet'
]
