private
privateAt: key put: anObject
	(dictionary at: key ifAbsentPut: [ collectionClass new ]) add: anObject