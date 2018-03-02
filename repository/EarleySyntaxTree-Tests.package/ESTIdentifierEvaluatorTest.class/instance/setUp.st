initialization
setUp

	evaluator := 
	ESSingleSynthesizedAttributeEvaluator 
		grammar: 	ESTExemplar identifier
		actions: 
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
			('word symbol star' -> 2 -> [ String empty ])}