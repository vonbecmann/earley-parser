accessing
activeItems
	^ Array
		streamContents: [ :s | 
			itemsByKey
				associationsDo:
					[ :assoc | 
						assoc value 
							select: [ :each | each isActive ] 
							thenDo: [ :each | s nextPut: each ] ] ]