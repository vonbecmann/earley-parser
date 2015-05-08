running
setUp
	grammar := [ 
	| Rule Rulename Letter Assignment Expression Term Literal |
	Rule := JENonterminal named: #Rule.
	Rulename := JENonterminal named: #Rulename.
	Letter := JENonterminal named: #Letter.
	Assignment := JENonterminal named: #Assignment.
	Expression := JENonterminal named: #Expression.
	Term := JENonterminal named: #Term.
	Literal := JENonterminal named: #Literal.
	JEGrammar
		basedOn: {
(Rule	body: { Rulename. Assignment. Expression }).

(Rulename 
	body: { (JETerminal character: $<). Letter. (JETerminal character: $>) }).
	
(Letter body: {JERegexTerminal regex: '[A-Z]'.}).

(Assignment	
	body: 	{ (JETerminal character: $:). (JETerminal character: $:). (JETerminal character: $=) }).

(Expression body: { Term }).
(Expression body: { Term. Expression }).

(Term body: { Rulename }).
(Term body: { Literal }).

(Literal body: { (JERegexTerminal regex: '[\w\d+-/\\*~=@,%|&?!]') }) } ] value