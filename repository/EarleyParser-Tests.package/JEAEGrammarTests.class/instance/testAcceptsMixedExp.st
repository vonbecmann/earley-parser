tests
testAcceptsMixedExp
	self assert: (grammar accepts: 'a+a*a+a*a')