"
a terminal.
Terminal symbols are literal symbols which may appear in the outputs of the production rules of a formal grammar and which cannot be changed using the rules of the grammar.
"
Class {
	#name : #JETerminal,
	#superclass : #JESymbol,
	#category : #'NoamChomsky-Core'
}

{ #category : #'instance creation' }
JETerminal class >> charSet: aCharacterCollection [
	" a set of characters define a terminal"

	^ JECharacterSetTerminal of: aCharacterCollection
]

{ #category : #'instance creation' }
JETerminal class >> charSetComplement: aCharacterCollection [
	" the complement of a character set defines a terminal "

	^ JECharacterSetComplementTerminal of: aCharacterCollection
]

{ #category : #'instance creation' }
JETerminal class >> character: aCharacter [
	" a character defines a terminal "

	^ JECharacterTerminal character: aCharacter
]

{ #category : #testing }
JETerminal >> isNonterminal [
	^ false
]

{ #category : #testing }
JETerminal >> isTerminal [
	^ true
]

{ #category : #comparing }
JETerminal >> matches: aCharacter [
	self subclassResponsibility
]
