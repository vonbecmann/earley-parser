tests
testAsStringFamilyWithTwoMembers
	self
		assert: (JEFamily with: aPackedItem with: anotherPackedItem) asString
		equals: '([A = ·. @ [1, 2]], [B = ·. @ [2, 3]])'