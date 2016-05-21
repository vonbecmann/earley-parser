running
setUp
	super setUp.
	epsilonRule := JERule head: (JENonterminal named: 'T') body: #()