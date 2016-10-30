tests
testAsStringFamilyWithTwoChildren
	self
		assert: (JEFamily with: firstPackedNode with: secondPackedNode) asString
		equals: '(([A: ·. @ [1, 2]]), ([B: ·. @ [2, 3]]))'