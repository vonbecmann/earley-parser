parsing
node
	^ node
		ifNil: [ node := JEPackedNode labeled: self rule asDefined model: (JEHypernode model: self) ]
		ifNotNil: [ node ]