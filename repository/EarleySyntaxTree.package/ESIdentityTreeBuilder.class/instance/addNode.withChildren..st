adding
addNode: anObject withChildren: aCollection
	| newNode |
	newNode := self addNode: anObject.
	edges at: newNode putAll: (aCollection collect: [ :each | self addNode: each ])