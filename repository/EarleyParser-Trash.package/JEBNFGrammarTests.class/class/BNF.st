example
BNF
	" my own BNF "

	^ [ 
	| rule rulename identifier letter assignment expression term literal |
	rule := JENonterminal named: 'rule'.
	rulename := JENonterminal named: 'rulename'.
	identifier := JENonterminal named: 'identifier'.
	letter := JENonterminal named: 'letter'.
	assignment := JENonterminal named: 'assignment'.
	expression := JENonterminal named: 'expression'.
	term := JENonterminal named: 'term'.
	literal := JENonterminal named: 'literal'.
	JEGrammar
		basedOn:
			{
(rule is: rulename, assignment, expression).

(rulename is: identifier).

(identifier is: letter).
(identifier is: letter, identifier).

(letter is: (JETerminal regex: '[a-zA-Z]')).
(assignment 
	is: 
		(JETerminal character: $:), 
		(JETerminal character: $:), 
		(JETerminal character: $=)).

(expression is: term).
(expression is: term, (JETerminal character: $,), expression).

(term is: rulename).
(term is: literal).

(literal
	is: 
		(JETerminal character: $"), 
		(JETerminal regex: '[\w\d+-/\\*~=@,%|&?!<>]'),
		(JETerminal character: $"))} ]	value