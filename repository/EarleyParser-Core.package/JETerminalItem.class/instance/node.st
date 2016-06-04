parsing
node
	node
		ifNil: [ 
			node := JEPackedNode model: (JEHypernode model: self).
			node addFamily: JEFamily empty ].
	^ node