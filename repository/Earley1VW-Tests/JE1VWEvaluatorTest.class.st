Class {
	#name : #JE1VWEvaluatorTest,
	#superclass : #JE1VWGrammarTest,
	#instVars : [
		'evaluator'
	],
	#category : #'Earley1VW-Tests'
}

{ #category : #asserting }
JE1VWEvaluatorTest >> assertGrammarAt: subgrammar evaluates: aString equals: expected [
	self 
		assert: (evaluator evaluateTree: (subgrammar parseTree: aString)) 
		equals: expected
]

{ #category : #asserting }
JE1VWEvaluatorTest >> assertThatEvaluates: aString equals: expected [
	self 
		assert: (evaluator evaluate: aString) 
		equals: expected
]

{ #category : #running }
JE1VWEvaluatorTest >> setUp [
	super setUp.
	evaluator := JE1VWParser oneLevelVWEvaluator
]

{ #category : #running }
JE1VWEvaluatorTest >> tearDown [
	evaluator := nil.
	super tearDown
]

{ #category : #tests }
JE1VWEvaluatorTest >> testEvaluates01 [
	self
		assertThatEvaluates: 'expression:term.'
		equals:
			{(NCProductionRule 
				headNamed: 'expression' 
				body: {(NCNonterminal named: 'term')})}
]

{ #category : #tests }
JE1VWEvaluatorTest >> testEvaluates02 [
	self 
		assertThatEvaluates: 'expression: expression, plus  symbol, term.'
		equals: 
			{	(NCProductionRule
					headNamed: 'expression'
					body: {	(NCNonterminal named: 'expression').
								(NCNonterminal named: 'plus symbol').
								(NCNonterminal named: 'term')})}
]

{ #category : #tests }
JE1VWEvaluatorTest >> testEvaluates03 [
	self 
		assertThatEvaluates: 'expression:.' 
		equals: {(NCProductionRule headNamed: 'expression' body: {})}
]

{ #category : #tests }
JE1VWEvaluatorTest >> testEvaluates04 [
	self 
		assertThatEvaluates: 'expression:  .' 
		equals: {(NCProductionRule headNamed: 'expression' body: {})}
]

{ #category : #tests }
JE1VWEvaluatorTest >> testEvaluates05 [
	self 
		assertThatEvaluates: 
'expression: 
	expression, plus symbol, term;
	    .
term:
	product;.'
		equals: 
			{	(NCProductionRule
					headNamed: 'expression'
					body: {	(NCNonterminal named: 'expression').
								(NCNonterminal named: 'plus symbol').
								(NCNonterminal named: 'term')}).
				(NCProductionRule headNamed: 'expression' body: {}).
				(NCProductionRule 
					headNamed: 'term'
					body: {(NCNonterminal named: 'product')}).
				(NCProductionRule headNamed: 'term' body: {})}
]

{ #category : #tests }
JE1VWEvaluatorTest >> testEvaluates06 [
	self 
		assertThatEvaluates: 
'expression: 
	term;
	expression, plus symbol, term.
term: 
	product;
	term, star symbol, product.
product: a symbol.'
		equals: 
			{	(NCProductionRule
					headNamed: 'expression'
					body: {(NCNonterminal named: 'term')}).	
				(NCProductionRule
					headNamed: 'expression'
					body: {	(NCNonterminal named: 'expression').
								(NCNonterminal named: 'plus symbol').
								(NCNonterminal named: 'term')}).
				(NCProductionRule 
					headNamed: 'term'
					body: {(NCNonterminal named: 'product')}).
				(NCProductionRule 
					headNamed: 'term'
					body: {	(NCNonterminal named: 'term').
								(NCNonterminal named: 'star symbol').
								(NCNonterminal named: 'product')}).
				(NCProductionRule 
					headNamed: 'product'
					body: {(NCNonterminal named: 'a symbol')})}
]

{ #category : #'tests - notion' }
JE1VWEvaluatorTest >> testEvaluatesNotion01 [
	self
		assertGrammarAt: notion
		evaluates: 'left part list'
		equals: (NCNonterminal named: 'left part list')
]

{ #category : #'tests - notion' }
JE1VWEvaluatorTest >> testEvaluatesNotion02 [
	self
		assertGrammarAt: notion
		evaluates: 'left part'
		equals: (NCNonterminal named: 'left part')
]

{ #category : #'tests - notion' }
JE1VWEvaluatorTest >> testEvaluatesNotion03 [
	self
		assertGrammarAt: notion
		evaluates: 'letter'
		equals: (NCNonterminal named: 'letter')
]

{ #category : #'tests - rule' }
JE1VWEvaluatorTest >> testEvaluatesRule01 [
	self
		assertGrammarAt: rule
		evaluates: 'expression:term.'
		equals:
			{(NCProductionRule
				headNamed: 'expression'
				body: {(NCNonterminal named: 'term')})}
]

{ #category : #'tests - rule' }
JE1VWEvaluatorTest >> testEvaluatesRule02 [
	self
		assertGrammarAt: rule
		evaluates: 'expression:expression,plus symbol,term.'
		equals:
			{(NCProductionRule
				headNamed: 'expression'
				body:
					{(NCNonterminal named: 'expression').
					(NCNonterminal named: 'plus symbol').
					(NCNonterminal named: 'term')})}
]

{ #category : #'tests - rule' }
JE1VWEvaluatorTest >> testEvaluatesRule03 [
	self
		assertGrammarAt: rule
		evaluates: 'expression:.'
		equals: {(NCProductionRule headNamed: 'expression' body: {})}
]

{ #category : #'tests - rule' }
JE1VWEvaluatorTest >> testEvaluatesRule04 [
	self
		assertGrammarAt: rule
		evaluates: 'expression: term; .'
		equals:
			{(NCProductionRule
				headNamed: 'expression'
				body: {(NCNonterminal named: 'term')}).
			(NCProductionRule headNamed: 'expression' body: {})}
]

{ #category : #'tests - rule' }
JE1VWEvaluatorTest >> testEvaluatesRule05 [
	self
		assertGrammarAt: rule
		evaluates: 'expression: .'
		equals: {(NCProductionRule headNamed: 'expression' body: {})}
]

{ #category : #'tests - rule' }
JE1VWEvaluatorTest >> testEvaluatesRule06 [
	self
		assertGrammarAt: rule
		evaluates: 'expression: expression, plus symbol, term;.'
		equals:
			{(NCProductionRule
				headNamed: 'expression'
				body:
					{(NCNonterminal named: 'expression').
					(NCNonterminal named: 'plus symbol').
					(NCNonterminal named: 'term')}).
			(NCProductionRule headNamed: 'expression' body: {})}
]

{ #category : #'tests - rule' }
JE1VWEvaluatorTest >> testEvaluatesRule07 [
	self
		assertGrammarAt: rule
		evaluates:
			'expression: 
	expression, plus symbol, term;
		.'
		equals:
			{(NCProductionRule
				headNamed: 'expression'
				body:
					{(NCNonterminal named: 'expression').
					(NCNonterminal named: 'plus symbol').
					(NCNonterminal named: 'term')}).
			(NCProductionRule headNamed: 'expression' body: {})}
]

{ #category : #'tests - rule' }
JE1VWEvaluatorTest >> testEvaluatesRule08 [
	self
		assertGrammarAt: rule
		evaluates: 'expression: expression, less  than  symbol, term.'
		equals:
			{(NCProductionRule
				headNamed: 'expression'
				body:
					{(NCNonterminal named: 'expression').
					(NCNonterminal named: 'less than symbol').
					(NCNonterminal named: 'term')})}
]

{ #category : #'tests - rule' }
JE1VWEvaluatorTest >> testEvaluatesRule09 [
	self
		assertGrammarAt: rule
		evaluates: 'expression:expression,greater than symbol,term.'
		equals:
			{(NCProductionRule
				headNamed: 'expression'
				body:
					{(NCNonterminal named: 'expression').
					(NCNonterminal named: 'greater than symbol').
					(NCNonterminal named: 'term')})}
]
