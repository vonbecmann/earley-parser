tests
testIsActive
	item := (rule dotAt: 2) startedAt: first.
	self assert: item isActive.
	self deny: item isPredicted.
	self deny: item isFinal.
		
	item := (rule dotAt: 3) startedAt: first.
	self assert: item isActive.
	self deny: item isPredicted.
	self deny: item isFinal