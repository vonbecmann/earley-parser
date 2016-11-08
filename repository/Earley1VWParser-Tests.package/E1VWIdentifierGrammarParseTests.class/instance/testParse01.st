tests
testParse01
	tree := grammar parse: 'word_symbol'.
	self deny: tree isAmbiguous 