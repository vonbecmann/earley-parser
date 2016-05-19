private
unknowRuleAt: nonterminal at: index
	^ Error signal: 'Unknown rule''s definition at index ' , index asString , ' for Nonterminal ' , nonterminal asString