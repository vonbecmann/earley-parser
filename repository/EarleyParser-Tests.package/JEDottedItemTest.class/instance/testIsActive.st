tests
testIsActive
	item := (rule dotAt: 2) startedAt: first.
	self assert: item isActive.
	
	item := (rule dotAt: 3) startedAt: first.
	self assert: item isActive.