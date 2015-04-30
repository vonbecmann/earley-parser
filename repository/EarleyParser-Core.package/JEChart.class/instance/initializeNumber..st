initialization
initializeNumber: anInteger
	self initialize.
	number := anInteger.
	itemsByChart := Array new: number.
	1 to: number do: [ :i | itemsByChart at: i put: JELinkedList new ]