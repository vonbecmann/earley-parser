as yet unclassified
BNF
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
	body: { (JETerminal character: $<). identifier. (JETerminal character: $>) }).

(identifier body: { letter. }).
(identifier body: { letter. identifier }).	
	
(letter body: { JERegexTerminal regex: '[a-zA-Z]'. }).

(assignment	
	body: 	{	(JETerminal character: $:).
				(JETerminal character: $:).
				(JETerminal character: $=) }).

(expression body: { term }).
(expression body: { term. expression }).

(term body: { rulename }).
(term body: { literal }).

(literal 
	body: { 	(JETerminal character: $"). 
				(JERegexTerminal regex: '[\w\d+-/\\*~=@,%|&?!<>]').
				(JETerminal character: $") })
	
	 } ] value