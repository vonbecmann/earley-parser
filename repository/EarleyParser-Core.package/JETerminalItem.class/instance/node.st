parsing
node
	node
		ifNil: [ 
			node := JEPackedNode labeled: word model: (JEHypernode model: self).
			node addFamily: JELinkedList new ].
	^ node