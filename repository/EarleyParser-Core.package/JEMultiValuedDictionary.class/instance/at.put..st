accessing
at: key put: anObject
	^ (dictionary at: key ifAbsentPut: [ collectionClass new ]) add: anObject