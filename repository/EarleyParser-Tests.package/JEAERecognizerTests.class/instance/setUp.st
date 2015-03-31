running
setUp
	recognizer := JEGrammar 
		on: {
((JENonterminal for: #E) body: {(JENonterminal for: #T)}).
((JENonterminal for: #E) body: {(JENonterminal for: #E). (JETerminal for: #+).(JENonterminal for: #T)}).
((JENonterminal for: #T) body: {(JENonterminal for: #P)}).
((JENonterminal for: #T) body: {(JENonterminal for: #T). (JETerminal for: #*). (JENonterminal for: #P)}).
((JENonterminal for: #P) body: {(JETerminal for: #a)})
}