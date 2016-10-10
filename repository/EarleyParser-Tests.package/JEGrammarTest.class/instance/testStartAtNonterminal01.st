tests
testStartAtNonterminal01
	| grammarStartingAtB |
	grammar := JEGrammar
		basedOn:
			{
			((JENonterminal named: 'A') is: (JENonterminal named: 'B')).
			((JENonterminal named: 'A') is_epsilon).
			((JENonterminal named: 'B') is_epsilon).
			}.
	self assert: grammar rulesSize equals: 4.
	grammarStartingAtB := grammar startAt: 'B'.
	self assert: grammarStartingAtB rulesSize equals: 4.
	self assert: grammarStartingAtB startRule body first equals: (JENonterminal named: 'B')