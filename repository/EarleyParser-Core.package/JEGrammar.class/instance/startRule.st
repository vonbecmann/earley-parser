private
startRule
	^ (JENonterminal named: #Start) body: {(rules first head)}