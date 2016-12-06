tests - parsing
testParseAll02
	rules := parser parse: 'one level vw grammar: rule list.
rule list: 
	rule;
	rule list, layout, rule.
rule: notion, colon symbol, layout, alternative option, dot symbol.
alternative option: 
	alternative; .
alternative: 
	notion;
	alternative, comma symbol, layout, notion.
notion: small syntactic mark plus, ((space and small syntactic mark) plus) option.
small syntactic mark plus: 
	small syntactic mark symbol;
	small syntactic mark plus, small syntactic mark symbol.
((space and small syntactic mark) plus) option: 
	(space and small syntactic mark) plus; .
(space and small syntactic mark) plus: 
	space plus, small syntactic mark plus;
	(space and small syntactic mark) plus, space plus, small syntactic mark plus.
space plus:
	space symbol;
	space plus, space symbol.
layout: ; separator plus.
separator plus: 
	separator symbol;
	separator plus, separator symbol.'.

	self 
		assertCollection: rules 
		equals: #(
#('one level vw grammar' #('rule list'))

#('rule list' #('rule')) 
#('rule list' #('rule list' 'layout' 'rule'))

#('rule' #('notion' 'colon symbol' 'layout' 'alternative option' 'dot symbol'))

#('alternative option' #('alternative')) #('alternative option' #())

#('alternative' #('notion'))
#('alternative' #('alternative' 'comma symbol' 'layout' 'notion'))

#('notion' #('small syntactic mark plus' '((space and small syntactic mark) plus) option'))

#('small syntactic mark plus' #('small syntactic mark symbol'))
#('small syntactic mark plus' #('small syntactic mark plus' 'small syntactic mark symbol'))

#('((space and small syntactic mark) plus) option' #('(space and small syntactic mark) plus'))
#('((space and small syntactic mark) plus) option' #())

#('(space and small syntactic mark) plus' 
		#('space plus' 'small syntactic mark plus'))
#('(space and small syntactic mark) plus' 
		#('(space and small syntactic mark) plus' 'space plus' 'small syntactic mark plus'))

#('space plus' #('space symbol'))
#('space plus' #('space plus' 'space symbol'))

#('layout' #())
#('layout' #('separator plus'))
#('separator plus' #('separator symbol'))
#('separator plus' #('separator plus' 'separator symbol'))
)