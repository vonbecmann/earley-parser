parsing
node
	node
		ifNil: [ 
			node := JEPackedNode model: (JEHypernode model: self).
			self isEpsilon
				ifTrue: [ node addFamily: JEFamily empty ] ].
	^ node