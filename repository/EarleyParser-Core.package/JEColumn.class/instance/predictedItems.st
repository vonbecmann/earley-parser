accessing
predictedItems
	^ Array
		streamContents: [ :s | 
			itemsByKey
				associationsDo:
					[ :assoc | 
						assoc value 
							select: [ :each | each isPredicted ] 
							thenDo: [ :each | s nextPut: each ] ] ]