tests
testExample2
	| forest |
	grammar := [ 
	| S b |
	S := JENonterminal named: 'S'.
	b := JETerminal character: $b.
	JEGrammar
		basedOn:
			{(S is: S , S).
			(S is: b)} ] value.
	self assert: (grammar accepts: 'bbb').
	forest := grammar parse: 'bbb'.
	self deny: forest isEmpty