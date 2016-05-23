tests
testOneLetter
	self assert: (grammar accepts: 'a').
	self assert: (grammar accepts: 'A')