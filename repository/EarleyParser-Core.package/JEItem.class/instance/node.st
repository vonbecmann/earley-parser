parsing
node
	^ node ifNil: [ node := JEHypernode model: self ] ifNotNil: [ node ]