private
sourceNodesAt: targetNode
	^ sourceNodesByTarget at: targetNode ifAbsent: [ JELinkedList new ]