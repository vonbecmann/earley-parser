tests
testRuleEquality02
	| one another |
	one := (JENonterminal named: 'T') bodyEmpty.
	another := (JENonterminal named: 'T') bodyEmpty.
	self assert: one = another.
	self assert: one hash = another hash.
	self assert: another = one.
	self assert: another hash = one hash