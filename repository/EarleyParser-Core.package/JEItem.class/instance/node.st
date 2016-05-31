parsing
node
	node
		ifNil: [ 
			node := JEPackedNode labeled: self rule asDefined model: (JEHypernode model: self).
			self isEpsilon
				ifTrue: [ node addFamily: JEFamily empty ] ].
	^ node