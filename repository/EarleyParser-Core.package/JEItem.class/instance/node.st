parsing
node
	^ node ifNil: [ node := JEPackedNode model: (JEHypernode model: self) ] ifNotNil: [ node ]