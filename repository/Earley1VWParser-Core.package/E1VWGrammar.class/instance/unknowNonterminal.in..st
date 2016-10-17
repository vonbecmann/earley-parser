private
unknowNonterminal: symbol in: rule
	^ Error signal: 'Unknown Nonterminal ' , symbol asString , ' in ' , rule asString