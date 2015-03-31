running
setUp
	grammar := JEGrammar
		on: 
{
	((JENonterminal for: #A) body: {(JETerminal for: #x)}).
	((JENonterminal for: #A) body: {(JETerminal for: #x).(JENonterminal for: #A).(JETerminal for: #x)}).
}