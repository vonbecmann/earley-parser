tests
testAcceptsTwoRules
	self assert: (recognizer accepts: #(E := T . E := E + T.))