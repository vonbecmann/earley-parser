tests
testParse4X
	forest := grammar parse: 'xxxx'.
	self assert: forest isAmbiguous