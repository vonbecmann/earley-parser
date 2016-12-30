initialize-release
release
	model := nil.
	families
		ifNotNil: 
			[	families do: [ :family | family release ].
				families := nil ].
	familiesByKey := nil.
	super release