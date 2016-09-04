tests
testBuild04
	| tree |
	builder addNode: 'A' withChildren: {'B'}.
	builder root: 'A'.
	tree := builder build.
	self assert: tree root equals: 'A'.
	self assertCollection: #('A' #(#('B' #()))) hasSameElements: tree asArrayRepresentation