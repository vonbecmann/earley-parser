tests
testStartAtNonterminal01
	| grammarStartingAtB |
	grammar := JEGrammar
		basedOn:
			{ (JENonterminal named: 'A') -> {(JENonterminal named: 'B')}.
			  (JENonterminal named: 'A') -> {}.
			  (JENonterminal named: 'B') -> {}}.
	self assert: grammar rulesSize equals: 4.
	grammarStartingAtB := grammar startAt: 'B'.
	self assert: grammarStartingAtB rulesSize equals: 4.
	self assert: grammarStartingAtB startRule body first equals: (JENonterminal named: 'B')