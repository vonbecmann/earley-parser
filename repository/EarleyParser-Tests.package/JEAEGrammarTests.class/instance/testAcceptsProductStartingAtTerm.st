tests
testAcceptsProductStartingAtTerm
	self assert: ((grammar startAt: 'T') accepts: 'a')