tests
testAcceptsMixedExp
	self assert: (recognizer accepts: #(a + a * a + a * a))