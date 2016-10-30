tests
testAsStringFamilyWithOneChild
	self assert: (JEFamily with: firstPackedNode) asString equals: '(([A: ·. @ [1, 2]]))'