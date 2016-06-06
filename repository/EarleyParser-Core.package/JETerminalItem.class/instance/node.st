parsing
node
	node
		ifNil: [ 
			node := JEPackedNode model: self.
			node addFamily: JEFamily empty ].
	^ node