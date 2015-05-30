accessing
at: key
	^ dictionary at: key ifAbsentPut: [ collectionClass new ]