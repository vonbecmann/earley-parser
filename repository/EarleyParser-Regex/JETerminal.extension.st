Extension { #name : #JETerminal }

{ #category : #'*EarleyParser-Regex' }
JETerminal class >> rxCharSet: aCharSetRegex [
	"a character set regular expression defines a terminal"

	^ JERxCharacterSetTerminal rxCharSet: aCharSetRegex
]
