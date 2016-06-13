tests
testBuild02
	| tree |
	builder addNode: 'A' withChildren: {'B' . 'E'}.
	builder addNode: 'B' withChildren: {'C' . 'D'}.
	builder addNode: 'E' withChildren: {'F' . 'G'}.
	builder root: 'A'.
	tree := builder build.
	self assert: tree root equals: 'A'