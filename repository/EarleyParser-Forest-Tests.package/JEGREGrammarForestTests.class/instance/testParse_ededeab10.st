tests
testParse_ededeab10
	"ededeab^10"

	| forest |
	forest := grammar parse: 'ededeabbbbbbbbbb'.

	self assert: forest isAmbiguous.
	self assert: forest numberOfTrees equals: 2.
	self assert: forest size equals: 106