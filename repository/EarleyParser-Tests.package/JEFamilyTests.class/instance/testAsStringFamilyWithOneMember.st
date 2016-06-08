tests
testAsStringFamilyWithOneMember
	self assert: (JEFamily with: aPackedItem) asString equals: '([A = ·. @ [1, 2]])'