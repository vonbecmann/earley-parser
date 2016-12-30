tests
testStartAtNonterminal02
	grammar := JEGrammar
		basedOn:
			{(JENonterminal named: 'A') -> {(JENonterminal named: 'B')}.
			 (JENonterminal named: 'A') -> {}.
			 (JENonterminal named: 'B') -> {}}.

	self assert: grammar rulesSize equals: 4.
	self 
		should: [ grammar startAt: 'Z' ] 
		raise: Error 
		withExceptionDo: [ :ex | self assert: ex messageText equals: 'Unknown Nonterminal Z' ]