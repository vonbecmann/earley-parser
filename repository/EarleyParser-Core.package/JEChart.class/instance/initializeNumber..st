initialization
initializeNumber: anInteger
	self initialize.
	number := anInteger.
	itemsByChart := (1 to: number) collect: [ :i | JELinkedList new ]