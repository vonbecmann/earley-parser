tests
testAsString
	| builder tree |
	builder := ESTreeBuilder new.
	builder root: 'A'.
	tree := builder build.
	self assert: tree asString equals: 'ESTree((''A''))'