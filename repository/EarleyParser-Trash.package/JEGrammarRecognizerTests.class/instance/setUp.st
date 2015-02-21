running
setUp
	recognizer := JERecognizer
		on:
{
(JENonterminal for: #Syntax) body: {(JENonterminal for: #Rule)}.
(JENonterminal for: #Syntax) body: {(JENonterminal for: #Rule). (JENonterminal for: #Syntax)}.

(JENonterminal for: #Rule) body: {(JENonterminal for: #Rulename). (JENonterminal for: #Assign). (JENonterminal for: #Expression). (JETerminal for: #'.')}.

(JENonterminal for: #Rulename) body: {(JEAnySymbolTerminal new)}.

(JENonterminal for: #Assign) body:	{(JETerminal for: #':'). (JETerminal for: #=)}.

(JENonterminal for: #Expression) body: {(JENonterminal for: #Term). (JENonterminal for: #Expression).}.		
(JENonterminal for: #Expression) body: {(JENonterminal for: #Term).}.

(JENonterminal for: #Term) body: {(JENonterminal for: #Rulename).}.
(JENonterminal for: #Term) body: {(JENonterminal for: #Literal).}.			
	
(JENonterminal for: #Literal) body: {(JELiteralTerminal new).}.			
				
}