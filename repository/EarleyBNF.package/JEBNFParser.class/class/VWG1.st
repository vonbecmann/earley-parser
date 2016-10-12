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

	^ [ | 
		vwg
		rule_list 
		rule 
		notion 
		small_syntactic_mark_plus
		space_and_small_syntactic_mark_plus_option 
		space_and_small_syntactic_mark_plus 
		space_plus 
		terminal terminal_character
		member_list member comma_and_member_star
		empty
		small_syntactic_mark_symbol space_symbol comma_symbol colon_symbol dot_symbol dollar_symbol |
	vwg := JENonterminal named: 'vwg'.
	rule_list := JENonterminal named: 'rule list'.
	rule := JENonterminal named: 'rule'.
	notion := JENonterminal named: 'notion'.
	small_syntactic_mark_plus := JENonterminal named: 'small syntactic mark plus'.
	space_and_small_syntactic_mark_plus_option := JENonterminal named: 'space and small syntactic mark plus option'.
	space_and_small_syntactic_mark_plus := JENonterminal named: 'space and small syntactic mark plus'.
	space_plus := JENonterminal named: 'space plus'.
	
	terminal := JENonterminal named: 'terminal'.
	terminal_character := JENonterminal named: 'terminal character'.
	member_list := JENonterminal named: 'member list'.
	member := JENonterminal named: 'member'.
	comma_and_member_star := JENonterminal named: 'comma and member star'.
	
	" Representation Rules "
	empty := JENonterminal named: 'empty'.
	small_syntactic_mark_symbol := JENonterminal named: 'small syntactic mark symbol'.
	space_symbol := JENonterminal named: 'space symbol'.
	comma_symbol := JENonterminal named: 'comma symbol'.
	colon_symbol := JENonterminal named: 'colon symbol'.
	dot_symbol := JENonterminal named: 'dot symbol'.
	dollar_symbol := JENonterminal named: 'dollar symbol'.
	JEGrammar
		basedOn:
			{
			(vwg is: rule_list).
			
			(rule_list is: rule). (rule_list is: rule_list, rule). 
			(rule is: notion, colon_symbol, member_list, dot_symbol).
			
			(member_list is: empty).
			(member_list is: member, comma_and_member_star).
			(comma_and_member_star is: comma_symbol, member, comma_and_member_star).
			(comma_and_member_star is: empty).

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
			(terminal is: terminal_character).
			(terminal_character is: dollar_symbol, (JETerminal rxCharSet: '[\w\d+-/\\*~=@,%|$&?!<>_-]')).
			
			" Representation Rules "
			(empty is_epsilon).
			(small_syntactic_mark_symbol is: (JETerminal charSet: (($a to: $z), '()'))).
			(space_symbol is: (JETerminal character: Character space)).
			(comma_symbol is: (JETerminal character: $,)).
			(colon_symbol is: (JETerminal character: $:)).
			(dot_symbol is: (JETerminal character: $.)).
			(dollar_symbol is: (JETerminal character: $$)).
			} ]
		value