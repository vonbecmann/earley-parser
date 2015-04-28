public
forestStartingAt: aNode
	| forest stack |
	forest := OrderedCollection new.
	stack := Stack new.
	stack push: aNode.
	self forest: forest stack: stack.
	^ forest