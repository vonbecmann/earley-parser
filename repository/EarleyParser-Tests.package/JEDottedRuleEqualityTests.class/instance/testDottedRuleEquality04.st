tests
testDottedRuleEquality04
	| one another rule anotherRule |
	rule := JERule
		head: (JENonterminal named: 'T')
		body:
			{(JENonterminal named: 'F').
			(JETerminal character: $.)}.
	anotherRule := JERule
		head: (JENonterminal named: 'T')
		body:
			{(JENonterminal named: 'F').
			(JETerminal character: $.)}.
	one := rule dotAt: 2.
	another := anotherRule dotAt: 2.
	self deny: one = another.
	self deny: one hash = another hash.
	self deny: another = one.
	self deny: another hash = one hash.
	self deny: one == another