tests
testStartAtNonterminal02
	grammar := JEGrammar
		basedOn:
			{((JENonterminal named: 'A') is: (JENonterminal named: 'B')).
			(JENonterminal named: 'A') is_epsilon.
			(JENonterminal named: 'B') is_epsilon}.

	self assert: grammar rulesSize equals: 4.
	self 
		should: [ grammar startAt: 'Z' ] 
		raise: Error 
		withExceptionDo: [ :ex | self assert: ex messageText equals: 'Unknown Nonterminal Z' ]