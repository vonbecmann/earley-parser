accessing
build
	| tree |
	edges keysAndValuesDo: [ :key :values | key children: values ].
	tree := ESTree rootNode: rootNode.
	self reset.
	^ tree