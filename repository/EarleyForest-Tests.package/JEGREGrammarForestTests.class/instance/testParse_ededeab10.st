tests
testParse_ededeab10
	"ededeab^10"

	| forest |
	forest := grammar parseForest: 'ededeabbbbbbbbbb'.

	self assert: forest isAmbiguous.
	self assert: forest numberOfTrees equals: 2.
	self assert: forest size equals: 90