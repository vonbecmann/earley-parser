a pointer labeled with a symbol (terminal or nonterminal)
from an item back to a previous item,
and possibly down to a child item (when you reduce a rule)

it could be a reduction
	label:		<A> 	
	from:		[<Start> ::= <A>* @ [1 ,4]]
	back to:		[<Start> ::= *<A> @ [1 ,1]]
	down to: 	[<A> ::= <A><A>* @ [1 ,4]]
	
or a predecessor 
	label: 		{x} 	
	from: 		[<A> ::= {x}* @ [3 ,4]]
	back to:		[<A> ::= *{x} @ [3 ,3]]
	down to:   	none 
                         
          to <---label---item
				    |
				down 
								
						