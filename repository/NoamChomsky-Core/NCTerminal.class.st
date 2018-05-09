"
a terminal.
Terminal symbols are literal symbols which may appear in the outputs of the production rules of a formal grammar and which cannot be changed using the rules of the grammar.
"
Class {
	#name : #NCTerminal,
	#superclass : #NCSymbol,
	#category : #'NoamChomsky-Core'
}

{ #category : #'instance creation' }
NCTerminal class >> charSet: aCharacterCollection [
	" a set of characters define a terminal"

	^ JECharacterSetTerminal of: aCharacterCollection
]

{ #category : #'instance creation' }
NCTerminal class >> charSetComplement: aCharacterCollection [
	" the complement of a character set defines a terminal "

	^ JECharacterSetComplementTerminal of: aCharacterCollection
]

{ #category : #'instance creation' }
NCTerminal class >> character: aCharacter [
	" a character defines a terminal "

	^ NCCharacterTerminal character: aCharacter
]

{ #category : #testing }
NCTerminal >> isNonterminal [
	^ false
]

{ #category : #testing }
NCTerminal >> isTerminal [
	^ true
]

{ #category : #comparing }
NCTerminal >> matches: aCharacter [
	self subclassResponsibility
]
