tests
testIsPredicted
	item := (rule dotAt: 1) startedAt: first.

	self assert: item isPredicted