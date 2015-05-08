running
setUp
	grammar := [ 
	| Rule Rulename Assignment Expression Term Literal |
	Rule := JENonterminal named: 'Rule'.
	Rulename := JENonterminal named: 'Rulename'.
	Assignment := JENonterminal named: 'Assignment'.
	Expression := JENonterminal named: 'Expression'.
	Term := JENonterminal named: #Term.
	Literal := JENonterminal named: #Literal.
	JEGrammar
		basedOn: {
(Rule	body: { Rulename. Assignment. Expression }).

(Rulename 
	body: { (JETerminal character: $<). (JETerminal character: $A). (JETerminal character: $>) }).

(Assignment	
	body: 	{ (JETerminal character: $:). (JETerminal character: $:). (JETerminal character: $=) }).

(Expression body: { Term }).
(Expression body: { Term. Expression }).

(Term body: { Rulename }).
(Term body: { Literal }).

(Literal body: { (JELiteralTerminal new) }) } ] value