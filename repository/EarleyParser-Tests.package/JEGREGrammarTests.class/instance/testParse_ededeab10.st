tests
testParse_ededeab10
	"ededeab^10"

	| forest |
	forest := grammar parse: 'ededeabbbbbbbbbb'.
	self deny: forest isEmpty.
	self assert: forest size equals: 122