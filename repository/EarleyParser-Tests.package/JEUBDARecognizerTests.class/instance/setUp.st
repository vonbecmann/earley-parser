running
setUp
	recognizer := JERecognizer
		on: 
{
	((JENonterminal for: #A) body: {(JETerminal for: #x)}).
	((JENonterminal for: #A) body: {(JENonterminal for: #A). (JENonterminal for: #A)}).
}