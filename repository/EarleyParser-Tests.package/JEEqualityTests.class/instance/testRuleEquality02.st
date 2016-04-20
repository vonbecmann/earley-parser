tests
testRuleEquality02
	| one another |
	one := (JENonterminal named: 'T') is_epsilon.
	another := (JENonterminal named: 'T') is_epsilon.
	self assert: one = another.
	self assert: one hash = another hash.
	self assert: another = one.
	self assert: another hash = one hash