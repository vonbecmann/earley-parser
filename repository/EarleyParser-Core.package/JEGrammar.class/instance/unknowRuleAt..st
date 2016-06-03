private
unknowRuleAt: keyPair
	^ Error
		signal:
			(String
				streamContents: [ :s | 
					s
						nextPutAll: 'Unknown rule''s definition at index ';
						print: keyPair second;
						nextPutAll: ' for Nonterminal ';
						print: keyPair first ])