Extension { #name : #NCTerminal }

{ #category : #'*NoamChomsky-Regex' }
NCTerminal class >> rxCharSet: aCharSetRegex [
	"a character set regular expression defines a terminal"

	^ JERxCharacterSetTerminal rxCharSet: aCharSetRegex
]
