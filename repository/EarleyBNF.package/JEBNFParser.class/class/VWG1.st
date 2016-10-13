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

	| rules |

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
#('empty' #())).

	^ JEGrammar
		productionRules: rules 
		representations: 
			{ "Terminal Notion to Representation List"
			('small syntactic mark symbol' -> (JETerminal charSet: ($a to: $z) , '()')).
			('space symbol' -> (JETerminal character: Character space)).
			('comma symbol' -> (JETerminal character: $,)).
			('colon symbol' -> (JETerminal character: $:)).
			('dot symbol' -> (JETerminal character: $.)).
			('dollar symbol' -> (JETerminal character: $$)).
			('typeable character symbol'
				-> (JETerminal charSet: '!""#$%&''()*+,-./', ($0 to: $9), ':;<=>?@', ($A to: $Z), '[\]^_`', ($a to: $z), '{|}~'))}