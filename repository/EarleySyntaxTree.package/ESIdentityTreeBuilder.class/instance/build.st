accessing
build
	| tree |
	tree := ESTree rootNode: rootNode.
	self reset.
	^ tree