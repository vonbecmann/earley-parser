"
the complement of  a character set defines a terminal.



"
Class {
	#name : #JECharacterSetComplementTerminal,
	#superclass : #JECharacterSetTerminal,
	#category : 'EarleyParser-Core-Public'
}

{ #category : #comparing }
JECharacterSetComplementTerminal >> matches: aCharacter [
	^ (charSet includes: aCharacter) not
]

{ #category : #printing }
JECharacterSetComplementTerminal >> printOn: aStream [
	aStream
		print: charSet asString;
		nextPutAll: 'CharSetComplement'
]
