"
the complement of  a character set defines a terminal.



"
Class {
	#name : #NCCharacterSetComplementTerminal,
	#superclass : #NCCharacterSetTerminal,
	#category : #'NoamChomsky-Core'
}

{ #category : #comparing }
NCCharacterSetComplementTerminal >> matches: aCharacter [
	^ (charSet includes: aCharacter) not
]

{ #category : #printing }
NCCharacterSetComplementTerminal >> printOn: aStream [
	aStream
		print: charSet asString;
		nextPutAll: 'CharSetComplement'
]
