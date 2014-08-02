tests
testParseGrammar
	| spec grammar |
	spec := 
	   #((E (T)) 
		(E (E + T)) 
		(T (P)) 
		(T (T * P)) 
		(P (a))).
	grammar := parser parseGrammarFrom: spec.
	self assert: 3 equals: grammar terminals size.
	self assert: 3 equals: grammar nonterminals size.
	self assert: 5 equals: grammar rules size