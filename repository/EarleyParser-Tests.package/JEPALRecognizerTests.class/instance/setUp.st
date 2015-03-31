running
setUp
	recognizer := JEGrammar
		on: 
{
	((JENonterminal for: #A) body: {(JETerminal for: #x)}).
	((JENonterminal for: #A) body: {(JETerminal for: #x).(JENonterminal for: #A).(JETerminal for: #x)}).
}