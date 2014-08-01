tests
testX
	| spec terminals nonterminals alphabet rules |
	spec := #(
		(E (T)) 
		(E (E + T)) 
		(T (P)) 
		(T (T * P)) 
		(P (a))).
	nonterminals := Set new.
	terminals := Set new.
	spec do: [ :each | nonterminals add: (JENonterminal for: each first) ].
	spec
		do: [ :each | 
			each second
				do: [ :another | 
					(nonterminals includes: (JENonterminal for: another))
						ifFalse: [ terminals add: (JETerminal for: another) ] ] ].
	alphabet := (nonterminals , terminals) asDictionary.
	rules := spec
		collect: [ :each | 
			| left right |
			left := alphabet at: each first.
			right := each second collect: [ :another | alphabet at: another ].
			JERule left: left right: right ].
	rules