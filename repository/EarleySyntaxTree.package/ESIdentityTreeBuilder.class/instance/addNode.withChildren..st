adding
addNode: anObject withChildren: aCollection
	| newNode |
	newNode := self addNode: anObject.
	newNode addChildren: (aCollection collect: [ :each | self addNode: each ])