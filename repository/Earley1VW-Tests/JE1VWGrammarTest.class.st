"
a grammar to parse one level vw grammar's rules.
production rules and representation rules.


"
Class {
	#name : #JE1VWGrammarTest,
	#superclass : #TestCase,
	#instVars : [
		'grammar',
		'tree',
		'rule',
		'notion',
		'ruleList'
	],
	#category : #'Earley1VW-Tests'
}

{ #category : #private }
JE1VWGrammarTest >> assertGrammarAt: aGrammar accepts: words [
	self
		assert: (aGrammar accepts: words)
		description:
			(String
				streamContents: [ :s | 
					s
						print: aGrammar;
						nextPutAll: ' doesn''t accept ';
						nextPutAll: words ])
]

{ #category : #running }
JE1VWGrammarTest >> setUp [
	grammar := JE1VWParser oneLevelVWGrammar.
	rule := grammar startAt: 'rule'.
	notion := grammar startAt: 'notion'.
	ruleList := grammar startAt: 'rule list'.
	tree := nil
]

{ #category : #running }
JE1VWGrammarTest >> tearDown [
	grammar := tree := rule := notion := ruleList := nil.
	super tearDown
]

{ #category : #'tests - notion' }
JE1VWGrammarTest >> testAcceptsNotion01 [
	self assertGrammarAt: notion accepts: 'left part list'
]

{ #category : #'tests - notion' }
JE1VWGrammarTest >> testAcceptsNotion02 [
	self assertGrammarAt: notion accepts: 'left part'
]

{ #category : #'tests - notion' }
JE1VWGrammarTest >> testAcceptsNotion03 [
	self assertGrammarAt: notion accepts: 'letter'
]

{ #category : #'tests - rule' }
JE1VWGrammarTest >> testAcceptsRule01 [
	self assertGrammarAt: rule accepts: 'expression:term.'
]

{ #category : #'tests - rule' }
JE1VWGrammarTest >> testAcceptsRule02 [
	self
		assertGrammarAt: rule
		accepts: 'expression:expression,plus symbol,term.'
]

{ #category : #'tests - rule' }
JE1VWGrammarTest >> testAcceptsRule03 [
	self assertGrammarAt: rule accepts: 'expression:.'
]

{ #category : #'tests - rule' }
JE1VWGrammarTest >> testAcceptsRule04 [
	self assertGrammarAt: rule accepts: 'expression: term.'
]

{ #category : #'tests - rule' }
JE1VWGrammarTest >> testAcceptsRule05 [
	self
		assertGrammarAt: rule
		accepts: 'expression: expression, plus symbol, term.'
]

{ #category : #'tests - rule' }
JE1VWGrammarTest >> testAcceptsRule06 [
	self assertGrammarAt: rule accepts: 'expression: .'
]

{ #category : #'tests - rule' }
JE1VWGrammarTest >> testAcceptsRule07 [
	self
		assertGrammarAt: rule
		accepts: 'expression: expression, plus symbol, term;.'
]

{ #category : #'tests - rule' }
JE1VWGrammarTest >> testAcceptsRule08 [
	self
		assertGrammarAt: rule
		accepts: 
'expression: 
	expression, plus symbol, term;
	.'
]

{ #category : #'tests - rule list' }
JE1VWGrammarTest >> testAcceptsRuleList01 [
	self
		assertGrammarAt: ruleList 
		accepts: 'expression:term.expression:expression,plus symbol,term.'
]

{ #category : #'tests - rule list' }
JE1VWGrammarTest >> testAcceptsRuleList02 [
	self
		assertGrammarAt: ruleList 
		accepts:
			'expression:term.expression:expression,plus symbol,term.term:product.term:term,star symbol,product.product:letter a symbol.'
]

{ #category : #'tests - rule list' }
JE1VWGrammarTest >> testAcceptsRuleList03 [
	self
		assertGrammarAt: ruleList 
		accepts:
'expression:term.
expression:expression,plus symbol,term.
term:product.
term:term,star symbol,product.
product:letter a symbol.'
]

{ #category : #'tests - rule list' }
JE1VWGrammarTest >> testAcceptsRuleList04 [
	self
		assertGrammarAt: ruleList 
		accepts:
'expression:
	term;
	expression, plus symbol, term.
term:
	product;
	term, star symbol, product.
product: letter a symbol.'
]

{ #category : #'tests - derivation' }
JE1VWGrammarTest >> testLeftmostDerivation01 [
	tree := grammar parseTree: 'e:t.'.
	self
		assertCollection: tree leftmostDerivation
		equals:
			(grammar
				rulesAtAll: {
					('one level vw grammar' -> 1).
					('rule list' -> 1).
					('rule' -> 1).
					('notion' -> 1).
					('small syntactic mark plus' -> 1).
					('small syntactic mark symbol' -> 1).
					('((space and small syntactic mark) plus) option' -> 2).
					('colon symbol' -> 1).
					('layout' -> 1).
					('alternatives' -> 1).					
					('alternative option' -> 1).
					('alternative' -> 1).
					('notion' -> 1).
					('small syntactic mark plus' -> 1).
					('small syntactic mark symbol' -> 1).
					('((space and small syntactic mark) plus) option' -> 2).
					('dot symbol' -> 1).
					})
]

{ #category : #'tests - rule' }
JE1VWGrammarTest >> testParseEpsilonRule01 [
	tree := rule parseTree: 'exp:.'.
	self deny: tree isNil.
	self
		assertCollection: tree leftmostDerivation
		hasSameElements:
			(grammar
				rulesAtAll:
					{('rule' -> 1).
					('notion' -> 1).
					('small syntactic mark plus' -> 2).
					('small syntactic mark plus' -> 2).
					('small syntactic mark plus' -> 1).
					('small syntactic mark symbol' -> 1).
					('small syntactic mark symbol' -> 1).
					('small syntactic mark symbol' -> 1).
					('((space and small syntactic mark) plus) option' -> 2).
					('colon symbol' -> 1).
					('layout' -> 1).
					('alternatives' -> 1).
					('alternative option' -> 2).
					('dot symbol' -> 1)})
]

{ #category : #'tests - rule' }
JE1VWGrammarTest >> testParseRule01 [
	tree := rule parseTree: 'exp:term.'.
	self deny: tree isNil.
	self
		assertCollection: tree leftmostDerivation
		hasSameElements:
			(grammar
				rulesAtAll:
					{('rule' -> 1).
					('notion' -> 1).
					('small syntactic mark plus' -> 2).
					('small syntactic mark plus' -> 2).
					('small syntactic mark plus' -> 1).
					('small syntactic mark symbol' -> 1).
					('small syntactic mark symbol' -> 1).
					('small syntactic mark symbol' -> 1).
					('((space and small syntactic mark) plus) option' -> 2).
					('colon symbol' -> 1).
					('alternatives' -> 1).
					('alternative option' -> 1).
					('alternative' -> 1).
					('layout' -> 1).
					('notion' -> 1).
					('small syntactic mark plus' -> 2).
					('small syntactic mark plus' -> 2).
					('small syntactic mark plus' -> 2).
					('small syntactic mark plus' -> 1).
					('small syntactic mark symbol' -> 1).
					('small syntactic mark symbol' -> 1).
					('small syntactic mark symbol' -> 1).
					('small syntactic mark symbol' -> 1).
					('((space and small syntactic mark) plus) option' -> 2).
					('dot symbol' -> 1)})
]

{ #category : #'tests - rule' }
JE1VWGrammarTest >> testParseRule02 [
	tree := rule parseTree: 'e:e,plus symbol,t.'.
	self deny: tree isNil.
	self
		assertCollection: tree leftmostDerivation
		hasSameElements:
			(grammar
				rulesAtAll:
					{('rule' -> 1).
					('notion' -> 1).
					('small syntactic mark plus' -> 2).
					('small syntactic mark symbol' -> 1).
					('((space and small syntactic mark) plus) option' -> 2).
					('colon symbol' -> 1).
					('alternatives' -> 1).
					('alternative option' -> 1).
					('alternative' -> 2).
					('alternative' -> 2).
					('alternative' -> 1).
					('layout' -> 1).
					('notion' -> 1).
					('small syntactic mark plus' -> 1).
					('small syntactic mark symbol' -> 1).
					('((space and small syntactic mark) plus) option' -> 2).
					('comma symbol' -> 1).
					('layout' -> 1).
					('notion' -> 1).
					('small syntactic mark plus' -> 2).
					('small syntactic mark plus' -> 2).
					('small syntactic mark plus' -> 2).
					('small syntactic mark plus' -> 1).
					('small syntactic mark symbol' -> 1).
					('small syntactic mark symbol' -> 1).
					('small syntactic mark symbol' -> 1).
					('small syntactic mark symbol' -> 1).
					('((space and small syntactic mark) plus) option' -> 1).
					('(space and small syntactic mark) plus' -> 1).
					('space plus' -> 1).
					('space symbol' -> 1).
					('small syntactic mark plus' -> 2).
					('small syntactic mark plus' -> 2).
					('small syntactic mark plus' -> 2).
					('small syntactic mark plus' -> 2).
					('small syntactic mark plus' -> 2).
					('small syntactic mark plus' -> 1).
					('small syntactic mark symbol' -> 1).
					('small syntactic mark symbol' -> 1).
					('small syntactic mark symbol' -> 1).
					('small syntactic mark symbol' -> 1).
					('small syntactic mark symbol' -> 1).
					('small syntactic mark symbol' -> 1).
					('comma symbol' -> 1).
					('layout' -> 1).
					('notion' -> 1).
					('small syntactic mark plus' -> 1).
					('small syntactic mark symbol' -> 1).
					('((space and small syntactic mark) plus) option' -> 2).
					('dot symbol' -> 1)})
]

{ #category : #'tests - rule' }
JE1VWGrammarTest >> testParseRule03 [
	tree := rule parseTree: 'e:e,plus symbol,t;.'.
	self deny: tree isNil.
	self
		assertCollection: tree leftmostDerivation
		hasSameElements:
			(grammar
				rulesAtAll:
					{('rule' -> 1).
					('notion' -> 1).
					('small syntactic mark plus' -> 2).
					('small syntactic mark symbol' -> 1).
					('((space and small syntactic mark) plus) option' -> 2).
					('colon symbol' -> 1).
					('alternatives' -> 2).
					('alternatives' -> 1).
					('alternative option' -> 1).
					('alternative' -> 2).
					('alternative' -> 2).
					('alternative' -> 1).
					('layout' -> 1).
					('notion' -> 1).
					('small syntactic mark plus' -> 1).
					('small syntactic mark symbol' -> 1).
					('((space and small syntactic mark) plus) option' -> 2).
					('comma symbol' -> 1).
					('layout' -> 1).
					('notion' -> 1).
					('small syntactic mark plus' -> 2).
					('small syntactic mark plus' -> 2).
					('small syntactic mark plus' -> 2).
					('small syntactic mark plus' -> 1).
					('small syntactic mark symbol' -> 1).
					('small syntactic mark symbol' -> 1).
					('small syntactic mark symbol' -> 1).
					('small syntactic mark symbol' -> 1).
					('((space and small syntactic mark) plus) option' -> 1).
					('(space and small syntactic mark) plus' -> 1).
					('space plus' -> 1).
					('space symbol' -> 1).
					('small syntactic mark plus' -> 2).
					('small syntactic mark plus' -> 2).
					('small syntactic mark plus' -> 2).
					('small syntactic mark plus' -> 2).
					('small syntactic mark plus' -> 2).
					('small syntactic mark plus' -> 1).
					('small syntactic mark symbol' -> 1).
					('small syntactic mark symbol' -> 1).
					('small syntactic mark symbol' -> 1).
					('small syntactic mark symbol' -> 1).
					('small syntactic mark symbol' -> 1).
					('small syntactic mark symbol' -> 1).
					('comma symbol' -> 1).
					('layout' -> 1).
					('notion' -> 1).
					('small syntactic mark plus' -> 1).
					('small syntactic mark symbol' -> 1).
					('((space and small syntactic mark) plus) option' -> 2).
					('semicolon symbol' -> 1).
					('alternative option' -> 2).
					('dot symbol' -> 1)})
]
