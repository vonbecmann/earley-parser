running
setUp
	grammar := [ 
	|rule symbol string number char|
	symbol := JEObjectTerminal object: #add.
	string := JEObjectTerminal object: 'add'.
	number := JEObjectTerminal object: 1.
	char := JEObjectTerminal object: $..
	rule := JENonterminal named: 'rule'.
	JEGrammar basedOn: { 
		rule body: { symbol. string. number. char.}.
	} ] value.