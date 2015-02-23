running
setUp
	recognizer := JERecognizer
		on: 
{
	((JENonterminal for: #A) body: {(JETerminal for: #x)}).
	((JENonterminal for: #A) body: {(JETerminal for: #x).(JENonterminal for: #A).(JETerminal for: #x)}).
}