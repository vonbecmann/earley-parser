tests
testBuild01
	| tree |
	builder addNode: 'A' withChildren: {'B' . 'C'}.
	builder root: 'A'.
	tree := builder build.
	self assert: tree root equals: 'A'.
	self assertCollection: #('A' #(#('B' #()) #('C' #()))) hasSameElements: tree asArrayRepresentation