running
setUp
	evaluator := ESSingleSynthesizedAttributeEvaluator
		grammar: ESTExemplar binaryNumber
		actions:
			{('bit sequence' -> 2 -> [ :nodes | nodes first << 1 bitOr: nodes second ]).
			('one symbol' -> 1 -> [ :node | 1 ]).
			('zero symbol' -> 1 -> [ :node | 0 ])}