parsing
node
	node
		ifNil: [ 
			node := JEPackedNode model: self.
			self isEpsilon
				ifTrue: [ node addFamily: JEFamily empty ] ].
	^ node