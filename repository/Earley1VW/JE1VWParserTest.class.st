Class {
	#name : #JE1VWParserTest,
	#superclass : #TestCase,
	#instVars : [
		'parser',
		'rules'
	],
	#category : 'Earley1VW-Tests'
}

{ #category : #running }
JE1VWParserTest >> setUp [
	parser := JE1VWParser new.
	rules := nil
	
]

{ #category : #'tests - parsing' }
JE1VWParserTest >> testParseAll [
	rules := parser parse: 'one level vw grammar: rule list.
rule list: rule.
rule list: rule list, layout, rule.
rule: notion, colon symbol, layout, alternative option, dot symbol.
alternative option: alternative.
alternative option: .
alternative: notion.
alternative: alternative, comma symbol, layout, notion.
notion: small syntactic mark plus, ((space and small syntactic mark) plus) option.
small syntactic mark plus: small syntactic mark symbol.
small syntactic mark plus: small syntactic mark plus, small syntactic mark symbol.
((space and small syntactic mark) plus) option: (space and small syntactic mark) plus.
((space and small syntactic mark) plus) option: .
(space and small syntactic mark) plus: space plus, small syntactic mark plus.
(space and small syntactic mark) plus: (space and small syntactic mark) plus, space plus, small syntactic mark plus.
space plus: space symbol.
space plus: space plus, space symbol.
layout: .
layout: separator plus.
separator plus: separator symbol.
separator plus: separator plus, separator symbol.'.

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
]

{ #category : #'tests - parsing' }
JE1VWParserTest >> testParseAll02 [
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
]

{ #category : #'tests - parsing' }
JE1VWParserTest >> testParseEpsilonRule01 [
	rules := parser parse: 'expression:.'.
	self assertCollection: rules equals: #(#('expression' #()))
]

{ #category : #'tests - parsing' }
JE1VWParserTest >> testParseEpsilonRule02 [
	rules := parser parse: 'expression: .'.
	self assertCollection: rules equals: #(#('expression' #()))
]

{ #category : #'tests - parsing' }
JE1VWParserTest >> testParseRule01 [
	rules := parser parse: 'expression:term.'.
	self assertCollection: rules equals: #(#('expression' #('term')))
]

{ #category : #'tests - parsing' }
JE1VWParserTest >> testParseRule02 [
	rules := parser parse: 'expression: expression, plus  symbol, term.'.
	self assertCollection: rules equals: #(#('expression' #('expression' 'plus symbol' 'term')))
]

{ #category : #'tests - parsing' }
JE1VWParserTest >> testParseRule03 [
	rules := parser parse: 'expression: expression, less  than  symbol, term.'.
	self assertCollection: rules equals: #(#('expression' #('expression' 'less than symbol' 'term')))
]

{ #category : #'tests - parsing' }
JE1VWParserTest >> testParseRule04 [
	rules := parser parse: 'expression:expression,greater than symbol,term.'.
	self assertCollection: rules equals: #(#('expression' #('expression' 'greater than symbol' 'term')))
]

{ #category : #'tests - parsing' }
JE1VWParserTest >> testParseRule05 [
	rules := parser parse: 'rule: rulename, assignment, expression.'.
	self assertCollection: rules equals: #(#('rule' #('rulename' 'assignment' 'expression')))
]

{ #category : #'tests - parsing' }
JE1VWParserTest >> testParseRule06 [
	rules := parser parse: 'expression: expression, plus symbol, term;.'.
	self 
		assertCollection: rules 
		equals: #(	#('expression' #('expression' 'plus symbol' 'term'))
						#('expression' #()))
]

{ #category : #'tests - parsing' }
JE1VWParserTest >> testParseRule07 [
	rules := parser parse: 
'expression: 
	expression, plus symbol, term;
	    .'.
	self 
		assertCollection: rules 
		equals: #(	#('expression' #('expression' 'plus symbol' 'term'))
						#('expression' #()))
]

{ #category : #'tests - parsing' }
JE1VWParserTest >> testParseRule08 [
	rules := parser parse: 
'expression: 
	expression, plus symbol, term;
	    .
term:
	product;.'.
	self 
		assertCollection: rules 
		equals: #(	#('expression' #('expression' 'plus symbol' 'term'))
						#('expression' #())
						#('term' #('product'))
						#('term' #()))
]

{ #category : #'tests - parsing' }
JE1VWParserTest >> testParseRule09 [
	rules := parser parse: 
'expression: 
	term;
	expression, plus symbol, term.
term: 
	product;
	term, star symbol, product.
product: a symbol.'.
	self 
		assertCollection: rules 
		equals: #(	#('expression' #('term'))
						#('expression' #('expression' 'plus symbol' 'term'))
						#('term' #('product'))
						#('term' #('term' 'star symbol' 'product'))						
						#('product' #('a symbol')))
]
