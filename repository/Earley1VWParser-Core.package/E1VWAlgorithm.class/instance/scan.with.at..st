private operations
scan: item with: word at: chart
	"scan: add a new item with the dot move forward, over the recently scan terminal.
	If a is the next input symbol
	then
		For every state in S(k) of the form (X -> alpha *a beta, j), 
			add (X -> alpha a *beta, j) to S(k+1).
	 Optimized fo efficiency. "

	self addFamilyWith: item word: word to: (chart add: item)