example
BNF
	" my own BNF "

	^ [ 
	| rule rulename identifier letter assignment expression term literal colon comma |
	rule := JENonterminal named: 'rule'.
	rulename := JENonterminal named: 'rulename'.
	identifier := JENonterminal named: 'identifier'.
	letter := JENonterminal named: 'letter'.
	assignment := JENonterminal named: 'assignment'.
	expression := JENonterminal named: 'expression'.
	term := JENonterminal named: 'term'.
	literal := JENonterminal named: 'literal'.
	colon := JETerminal character: $:.
	comma := JETerminal character: $,.
	JEGrammar
		basedOn:
			{
(rule is: rulename, assignment, expression).

(rulename is: identifier).

(identifier is: letter).
(identifier is: letter, identifier).

(letter is: (JETerminal charset: '[a-zA-Z]')).
(assignment 
	is: colon, colon, (JETerminal character: $=)).

(expression is: term).
(expression is: term, comma, expression).

(term is: rulename).
(term is: literal).

(literal
	is: 
		(JETerminal character: $"), 
		(JETerminal charset: '[\w\d+-/\\*~=@,%|&?!<>]'),
		(JETerminal character: $"))} ]	value