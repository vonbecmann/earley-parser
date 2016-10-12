grammar
VWG1
	" one level Van Wijngaarden Grammar (1VWG).
A 1VWG is a 4-tuple
	G = <S, T, E, P>, where

S = alphabet, a finite nonempty set of small syntactic marks, which does not contain the delimiters #($: $, $; $. $:)	.
T = symbols, a finite subset of (S)+.
E = initial notion belongs to (S)+.
P = productions, a finite subset of (((S+) - T), ((S*)*)).

Notation
x: y1, y2, ..., yn.
	 "

	|	vwg
		rule_list rule 
		notion 
		small_syntactic_mark_plus
		space_and_small_syntactic_mark_plus_option 
		space_and_small_syntactic_mark_plus 
		space_plus 
		alternative_option alternative
		member 
		terminal literal_character
		empty
		small_syntactic_mark_symbol space_symbol comma_symbol colon_symbol dot_symbol dollar_symbol typeable_character_symbol |

	vwg := JENonterminal named: 'vwg'.
	rule_list := JENonterminal named: 'rule list'.
	rule := JENonterminal named: 'rule'.
	notion := JENonterminal named: 'notion'.
	small_syntactic_mark_plus := JENonterminal named: 'small syntactic mark plus'.
	space_and_small_syntactic_mark_plus_option := JENonterminal named: 'space and small syntactic mark plus option'.
	space_and_small_syntactic_mark_plus := JENonterminal named: 'space and small syntactic mark plus'.
	space_plus := JENonterminal named: 'space plus'.
	
	alternative_option := JENonterminal named: 'alternative option'.
	alternative := JENonterminal named: 'alternative'.

	member := JENonterminal named: 'member'.
	terminal := JENonterminal named: 'terminal'.
	literal_character := JENonterminal named: 'literal character'.

	" Representation Rules "
	empty := JENonterminal named: 'empty'.
	small_syntactic_mark_symbol := JENonterminal named: 'small syntactic mark symbol'.
	space_symbol := JENonterminal named: 'space symbol'.
	comma_symbol := JENonterminal named: 'comma symbol'.
	colon_symbol := JENonterminal named: 'colon symbol'.
	dot_symbol := JENonterminal named: 'dot symbol'.
	dollar_symbol := JENonterminal named: 'dollar symbol'.
	typeable_character_symbol := JENonterminal named: 'typeable character symbol'.
	^ JEGrammar
		basedOn:
			{
			(vwg is: rule_list).
			
			(rule_list is: rule). (rule_list is: rule_list, rule). 
			(rule is: notion, colon_symbol, alternative_option, dot_symbol).
			
			(alternative_option is: alternative). (alternative_option is: empty).
			
			(alternative is: member).
			(alternative is: member, comma_symbol, alternative).

			(notion is: small_syntactic_mark_plus, space_and_small_syntactic_mark_plus_option).
	
			(small_syntactic_mark_plus is: small_syntactic_mark_symbol).
			(small_syntactic_mark_plus is: small_syntactic_mark_symbol, small_syntactic_mark_plus). 
			
			(space_and_small_syntactic_mark_plus_option is: space_and_small_syntactic_mark_plus). 
			(space_and_small_syntactic_mark_plus_option is: empty).

			(space_and_small_syntactic_mark_plus is: space_plus, small_syntactic_mark_plus).
			(space_and_small_syntactic_mark_plus is: space_plus, small_syntactic_mark_plus, space_and_small_syntactic_mark_plus).
			
			(space_plus is: space_symbol). 
			(space_plus is: space_symbol, space_plus). 

			(member is: notion).
			(member is: terminal).
			(terminal is: literal_character).
			(literal_character is: dollar_symbol, typeable_character_symbol).
			
			" Representation Rules "
			(empty is_epsilon).
			(small_syntactic_mark_symbol is: (JETerminal charSet: (($a to: $z), '()'))).
			(space_symbol is: (JETerminal character: Character space)).
			(comma_symbol is: (JETerminal character: $,)).
			(colon_symbol is: (JETerminal character: $:)).
			(dot_symbol is: (JETerminal character: $.)).
			(dollar_symbol is: (JETerminal character: $$)).
			(typeable_character_symbol 
				is: (JETerminal charSet: '!""#$%&''()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~')).
			} 