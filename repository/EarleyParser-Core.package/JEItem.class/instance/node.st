parsing
node
	^ node ifNil: [ node := JEPackedNode model: self ] ifNotNil: [ node ]