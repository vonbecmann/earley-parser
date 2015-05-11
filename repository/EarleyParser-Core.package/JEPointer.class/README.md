a directed edge labeled with a symbol (terminal or nonterminal)
from an item to another item.

it could be a reduction

	reduction <A>	from: 	[<Start> ::= <A>* @ [1 ,4]]
					to:		[<A> ::= <A><A>* @ [1 ,4]]
or a predecessor 

	predecessor <A> 	from: 	[<Start> ::= <A>* @ [1 ,4]]
					to: 		[<Start> ::= *<A> @ [1 ,1]]

	predecessor {x} 	from: 	[<A> ::= {x}* @ [3 ,4]]
					to: 		[<A> ::= *{x} @ [3 ,3]]

	predecessor <A> 	from:	[<A> ::= <A><A>* @ [1 ,4]]
					to:		[<A> ::= <A>*<A> @ [1 ,3]]


						