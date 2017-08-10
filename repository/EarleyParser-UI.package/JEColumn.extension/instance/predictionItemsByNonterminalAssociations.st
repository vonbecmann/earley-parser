*EarleyParser-UI
predictionItemsByNonterminalAssociations
	^ Array
		streamContents: [ :s | 
			predictionItemsByNonterminal
				associationsDo:
					[ :assoc | 
						assoc value 
							do: [ :each | s nextPut: (Association key: assoc key value: each) ] ] ]