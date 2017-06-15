tests
testAsString
	self
		assert: (JECharacterSetComplementTerminal of: ($a to: $z)) asString
		equals:
			(String
				streamContents: [ :s | 
					s
						print: (String withAll: ($a to: $z));
						nextPutAll: 'CharSetComplement' ])