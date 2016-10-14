tests - literal character
testAcceptsLiteralCharacter01
	"| typeableCharacters |
	typeableCharacters := '!""#$%&''()*+,-./' , ($0 to: $9) , ':;<=>?@' , ($A to: $Z) , '[\]^_`', ($a to: $z), '{|}~'.
	typeableCharacters 
		do: 
			[ :each | 
				self 
					assertGrammarAccepts: (String with: $$ with: each) 
					startingAt: 'literal character' ]"