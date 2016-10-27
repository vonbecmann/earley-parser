tests
testEvaluateSynthesizedAttribute01
	| attribute |
	tree := grammar parseTree: '101'.
	attribute := tree
		evaluateSynthesizedAttribute:
			{(('bit sequence' -> 2) -> [ :nodes | nodes first << 1 bitOr: nodes second ]).
			(('one symbol' -> 1) -> [ :node | 1 ]).
			(('zero symbol' -> 1) -> [ :node | 0 ])}.
	self assert: attribute equals: 5