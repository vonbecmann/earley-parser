*EarleyParser-UI
finalItemsByNonterminalAssociations
	^ Array
		streamContents: [ :s | 
			finalItemsByNonterminal
				associationsDo:
					[ :assoc | 
						assoc value 
							do: [ :each | s nextPut: (Association key: assoc key value: each) ] ] ]