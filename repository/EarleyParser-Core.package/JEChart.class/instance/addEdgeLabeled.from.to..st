adding
addEdgeLabeled: aJESymbol from: anItem to: anotherItem
	(edges at: anItem ifAbsentPut: [ JELinkedList new ])
		add: (JEDirectedEdge labeled: aJESymbol from: anItem to: anotherItem)