tests
testAsString
	| tree |
	tree := ESTree rootNode: (ESTreeNode model: 'A').
	self assert: tree asString equals: 'ESTree((''A''))'