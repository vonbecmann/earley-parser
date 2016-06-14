tests
testAsString
	| builder tree |
	builder := ESIdentityTreeBuilder new.
	builder root: 'A'.
	tree := builder build.
	self assert: tree asString equals: 'ESTree((''A''))'