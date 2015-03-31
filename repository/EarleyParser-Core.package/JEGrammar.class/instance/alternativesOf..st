private
alternativesOf: aNonterminal
	^ alternatives 
		at: aNonterminal 
		ifAbsent: [ self error: 'no alternatives for ' , aNonterminal asString ]