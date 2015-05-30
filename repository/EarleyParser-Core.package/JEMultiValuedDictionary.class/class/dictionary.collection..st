instance creation
dictionary: aDictionaryClass collection: aCollectionClass
	^ self 
		basicNew 
			initializeDictionary: aDictionaryClass new 
			collectionClass: aCollectionClass