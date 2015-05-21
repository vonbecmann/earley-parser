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
		basedOn: {

(rule	body: { rulename. assignment. expression }).

(rulename 
	body: { identifier. }).

(identifier body: { letter. }).
(identifier body: { letter. identifier }).	
	
(letter body: { JETerminal regex: '[a-zA-Z]'. }).

(assignment	
	body: 	{	(JETerminal character: $:).
				(JETerminal character: $:).
				(JETerminal character: $=) }).

(expression body: { term }).
(expression body: { term. (JETerminal character: $,). expression }).

(term body: { rulename }).
(term body: { literal }).

(literal 
	body: { 	(JETerminal character: $"). 
				(JETerminal regex: '[\w\d+-/\\*~=@,%|&?!<>]').
				(JETerminal character: $") })
	
	 } ] value