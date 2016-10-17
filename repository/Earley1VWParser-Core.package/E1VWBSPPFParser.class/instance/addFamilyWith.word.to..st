private operations
addFamilyWith: previousItem word: word to: nextItem
	"Optimize for efficiency.
	 previous item is predicted because it was generated from scanning a representation rule
	"

	| terminal |
	terminal := nextItem endChart 
			addTerminalItem: 
				(JETerminalItem 
					given: previousItem symbolAtDot 
					word: word 
					startedAt: previousItem endChart).
	nextItem addFamily: (JEFamily with: terminal node)