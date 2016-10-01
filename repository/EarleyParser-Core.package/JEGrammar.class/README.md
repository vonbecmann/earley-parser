a context free grammar.

nonterminals - is a set of nonterminals. they should be unique.
terminals - is a set of terminals. they should be unique.
rules - is a set of rules. they should be unique.

startSymbol - a nonterminal named START  used by the algorithm.
	the given grammar is augmented with this nonterminal.
startRule - the first rule to initialize the algorithm.
	START : first nonterminal.
		
alternatives - is a set of rules that you can access by a pair (nonterminal, index).
predictedAlternatives - is a set of predicted dotted rules that you can access by nonterminal. 
	 they are obtain from the given rules.



