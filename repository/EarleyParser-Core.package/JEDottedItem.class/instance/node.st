parsing
node
	node ifNil: [ node := JEPackedNode model: self ].
	^ node