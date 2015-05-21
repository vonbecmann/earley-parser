tests
testParse01
	| forest |
	forest := grammar parse: #(#add 'add' 1 $. true false nil).
	self deny: forest isEmpty.
	self assert: forest size equals: 22