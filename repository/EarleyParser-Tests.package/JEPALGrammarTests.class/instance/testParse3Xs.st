tests
testParse3Xs
	
	forest := grammar parse: 'xxx'.

	self deny: forest isAmbiguous.
	self 
		assertCollection: (grammar rulesAtAll: {('A'->2).('A'->1)})
	 	equals: forest leftmostDerivation.