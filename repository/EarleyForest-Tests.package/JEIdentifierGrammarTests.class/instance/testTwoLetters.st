tests
testTwoLetters
	self assert: (grammar accepts: 'a_').
	self assert: (grammar accepts: 'a2').
	self assert: (grammar accepts: 'A_').
	self assert: (grammar accepts: 'A3')