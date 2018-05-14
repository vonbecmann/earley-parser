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
	rules := parser parse: 
'one level vw grammar: rule list.
rule list: 
	rule;
	rule list, layout, rule.
rule: notion, colon symbol, layout, alternatives, dot symbol.
alternatives: 
	alternative option;
	alternatives, semicolon symbol, layout, alternative option.
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
layout: .
layout: separator plus.
separator plus: separator symbol.
separator plus: separator plus, separator symbol.'.

	self 
		assertCollection: rules 
		equals: 
(JE1VWParser oneLevelVWGrammar productionRules reject: [ :each | each isRepresentation ])
]
