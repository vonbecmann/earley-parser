tests
testEvaluateSynthesizedAttribute01
	| attribute |
	tree := grammar parseTree: 'word_symbol'.
	attribute := tree
		evaluateSynthesizedAttribute:
			{('identifier' -> 1
				-> [ :nodes | 
					String
						streamContents: [ :s | 
							s
								nextPut: nodes first;
								nextPutAll: nodes second ] ]).
			('word symbol star' -> 1
				-> [ :nodes | 
					String
						streamContents: [ :s | 
							s
								nextPut: nodes first;
								nextPutAll: nodes second ] ]).
			('word symbol star' -> 2 -> [ String empty ])}.
	self assert: attribute equals: 'word_symbol'