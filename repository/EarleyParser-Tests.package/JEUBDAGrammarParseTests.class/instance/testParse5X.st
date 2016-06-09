tests
testParse5X
	forest := grammar parse: 'xxxxx'.
	self assert: forest isAmbiguous