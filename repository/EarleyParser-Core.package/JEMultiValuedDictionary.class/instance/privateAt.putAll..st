private
privateAt: key putAll: aCollection
	(dictionary at: key ifAbsentPut: [ collectionClass new ]) addAll: aCollection