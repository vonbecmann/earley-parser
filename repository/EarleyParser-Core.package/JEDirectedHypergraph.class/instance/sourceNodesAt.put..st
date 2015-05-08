private
sourceNodesAt: targetNode put: sourceNodes
	(sourceNodesByTarget at: targetNode ifAbsentPut: [ JELinkedList new ]) add: sourceNodes