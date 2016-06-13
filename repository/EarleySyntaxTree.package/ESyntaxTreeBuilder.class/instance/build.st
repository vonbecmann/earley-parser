accessing
build
	| tree |
	tree := ESyntaxTree rootNode: rootNode.
	self reset.
	^ tree