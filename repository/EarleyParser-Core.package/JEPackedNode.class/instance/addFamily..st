accessing
addFamily: aFamily
	familiesByKey
		jeAt: aFamily key
		ifAbsentPut: 
			[ 	aFamily parent: self.
				families := families copyWith: aFamily.
				true ]