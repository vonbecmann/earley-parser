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

	|	rules 
		small_syntactic_mark_symbol 
		space_symbol 
		comma_symbol 
		colon_symbol 
		dot_symbol 
		dollar_symbol 
		typeable_character_symbol |
	
	rules := #(
#('vwg' #('rule list'))

#('rule list' #('rule')) 
#('rule list' #('rule list' 'rule'))

#('rule' #('notion' 'colon symbol' 'alternative option' 'dot symbol'))

#('alternative option' #('alternative')) #('alternative option' #('empty'))

#('alternative' #('member'))
#('alternative' #('member' 'comma symbol' 'alternative'))

#('notion' #('small syntactic mark plus' 'space and small syntactic mark plus option'))
#('small syntactic mark plus' #('small syntactic mark symbol'))
#('small syntactic mark plus' #('small syntactic mark symbol' 'small syntactic mark plus'))
#('space and small syntactic mark plus option' #('space and small syntactic mark plus'))
#('space and small syntactic mark plus option' #('empty'))
#('space and small syntactic mark plus' #('space plus' 'small syntactic mark plus'))
#('space and small syntactic mark plus' #('space plus' 'small syntactic mark plus' 'space and small syntactic mark plus'))
#('space plus' #('space symbol'))
#('space plus' #('space symbol' 'space plus'))

#('member' #('notion'))
#('member' #('terminal'))

#('terminal' #('literal character'))
#('literal character' #('dollar symbol' 'typeable character symbol'))
#('empty' #())) collect: [:each |
	JEProductionRule 
		head: (JENonterminal named: each first)
		body: (each second collect: [:nonterminalNamed | (JENonterminal named: nonterminalNamed)])
	].

	" Representation Rules "
	small_syntactic_mark_symbol := JENonterminal named: 'small syntactic mark symbol'.
	space_symbol := JENonterminal named: 'space symbol'.
	comma_symbol := JENonterminal named: 'comma symbol'.
	colon_symbol := JENonterminal named: 'colon symbol'.
	dot_symbol := JENonterminal named: 'dot symbol'.
	dollar_symbol := JENonterminal named: 'dollar symbol'.
	typeable_character_symbol := JENonterminal named: 'typeable character symbol'.
	^ JEGrammar
		basedOn:
			" Production Rules "
			rules,
			{
			" Representation Rules "
			(small_syntactic_mark_symbol is: (JETerminal charSet: ($a to: $z) , '()')).
			(space_symbol is: (JETerminal character: Character space)).
			(comma_symbol is: (JETerminal character: $,)).
			(colon_symbol is: (JETerminal character: $:)).
			(dot_symbol is: (JETerminal character: $.)).
			(dollar_symbol is: (JETerminal character: $$)).
			(typeable_character_symbol
				is: (JETerminal charSet: '!""#$%&''()*+,-./', ($0 to: $9), ':;<=>?@', ($A to: $Z), '[\]^_`', ($a to: $z), '{|}~'))}