tests
testBuild03
	| tree |
	builder root: 'A'.
	tree := builder build.
	self assert: tree root equals: 'A'.
	self assertCollection: #('A' #()) hasSameElements: tree asArrayRepresentation