tests
testAsString
	self
		assert: (JETerminal charset: ($a to: $z)) asString
		equals:
			(String
				streamContents: [ :s | 
					s
						print: (String withAll: ($a to: $z));
						nextPutAll: 'charset' ])