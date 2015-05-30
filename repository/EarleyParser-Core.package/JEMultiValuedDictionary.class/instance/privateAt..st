private
privateAt: key
	^ dictionary at: key ifAbsentPut: [ collectionClass new ]