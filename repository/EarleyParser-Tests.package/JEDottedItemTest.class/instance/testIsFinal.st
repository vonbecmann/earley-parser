tests
testIsFinal
	item := (rule dotAt: 4) startedAt: first.

	self assert: item isFinal.
	self deny: item isPredicted.
	self deny: item isActive.
	