a rule of the given grammar used by the algorithm. (it has many optimizations) .
	
	head ::= body.

head or left hand-side. head is a nonterminal.

body or right hand-side.
	body is a collection of symbols (terminals and nonterminals)
	body could be empty when you have a empty or epsilon rule. (A ::= epsilon).
	is an array for performance  reasons.
	
they should be unique objects, because the algorithm compare rules by identity.
in the same way nonterminals should be unique.

