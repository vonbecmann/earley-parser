private
pointersAt: anItem put: pointer
	(pointers at: anItem ifAbsentPut: [ JELinkedList new ]) add: pointer