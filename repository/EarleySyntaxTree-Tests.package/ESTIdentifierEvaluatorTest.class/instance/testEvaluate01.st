tests
testEvaluate01
	self 
		assert: (evaluator evaluate: 'word_symbol') 
		equals: 'word_symbol'