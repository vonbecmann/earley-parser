accessing
identifier
	^ JEGrammar
		productionRules:
			#(('identifier' ('letter symbol' 'word symbol star')) 
			  ('word symbol star' ('word symbol' 'word symbol star')) 
			  ('word symbol star' ()))
		representations:
			{('letter symbol' -> (JETerminal charSet: ($a to: $z) , ($A to: $Z))).
			 ('word symbol' -> (JETerminal charSet: ($a to: $z) , ($A to: $Z) , ($0 to: $9) , '_'))}