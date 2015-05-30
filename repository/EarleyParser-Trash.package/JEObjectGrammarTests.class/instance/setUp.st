running
setUp
	grammar := [ 
	| rule addSymbol addString one dot |
	addSymbol := JEObjectTerminal object: #add.
	addString := JEObjectTerminal object: 'add'.
	one := JEObjectTerminal object: 1.
	dot := JEObjectTerminal object: $..
	rule := JENonterminal named: 'rule'.
	JEGrammar
		basedOn:
			{
(rule
		body:
			addSymbol,
			addString,
			one,
			dot,
			(JEObjectTerminal true),
			(JEObjectTerminal false),
			(JEObjectTerminal nil))} ] value