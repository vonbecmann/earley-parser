initialization
initializeNumber: anInteger
	self initialize.
	number := anInteger.
	itemsByChart := Array new: number withAll: JELinkedList new