tests
testAsString
	self
		assert: (JECharacterSetTerminal charSet: ($a to: $z)) asString
		equals:
			(String
				streamContents: [ :s | 
					s
						print: (String withAll: ($a to: $z));
						nextPutAll: 'CharSet' ])