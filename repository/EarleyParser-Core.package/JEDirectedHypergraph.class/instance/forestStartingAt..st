public
forestStartingAt: aNode
	| forest stack |
	forest := OrderedCollection new.
	stack := JEStack new.
	stack push: aNode.
	self forest: forest stack: stack.
	^ forest