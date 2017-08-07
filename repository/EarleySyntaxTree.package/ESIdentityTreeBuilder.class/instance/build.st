accessing
build
	| tree |
	edges keysDo: [ :key | key children: (edges at: key) ].
	tree := ESTree rootNode: rootNode.
	self reset.
	^ tree