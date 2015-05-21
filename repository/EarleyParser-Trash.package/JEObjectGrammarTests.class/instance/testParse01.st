tests
testParse01
	| forest |
	forest := grammar parse: #(#add 'add' 1 $.).
	self deny: forest isEmpty.
	self assert: forest size equals: 13