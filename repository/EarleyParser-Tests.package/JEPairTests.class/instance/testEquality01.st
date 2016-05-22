tests
testEquality01
	| one another |
	one := another := JEPair first: 'A' second: 1.
	self assert: one equals: another.
	self assert: one hash equals: another hash.
	self assert: another equals: one.
	self assert: another hash equals: one hash.
	self assert: one == another