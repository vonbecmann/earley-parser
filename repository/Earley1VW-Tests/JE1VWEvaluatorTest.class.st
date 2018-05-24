Class {
	#name : #JE1VWEvaluatorTest,
	#superclass : #TestCase,
	#instVars : [
		'evaluator'
	],
	#category : #'Earley1VW-Tests'
}

{ #category : #asserting }
JE1VWEvaluatorTest >> assertThatEvaluates: aString equals: expected [
	self 
		assert: (evaluator evaluate: aString) 
		equals: expected
]

{ #category : #asserting }
JE1VWEvaluatorTest >> assertThatEvaluates: aString startingAt: aNonterminalNamed equals: expected [
	self 
		assert: (evaluator evaluate: aString startingAt: aNonterminalNamed) 
		equals: expected
]

{ #category : #initialization }
JE1VWEvaluatorTest >> setUp [
	evaluator := JE1VWParser oneLevelVWEvaluator
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
		assertThatEvaluates: 'left part list' 
		startingAt: 'notion' 
		equals: (NCNonterminal named: 'left part list')
]

{ #category : #'tests - notion' }
JE1VWEvaluatorTest >> testEvaluatesNotion02 [
	self 
		assertThatEvaluates: 'left part' 
		startingAt: 'notion' 
		equals: (NCNonterminal named: 'left part')
]

{ #category : #'tests - notion' }
JE1VWEvaluatorTest >> testEvaluatesNotion03 [
	self 
		assertThatEvaluates: 'letter' 
		startingAt: 'notion' 
		equals: (NCNonterminal named: 'letter')
]

{ #category : #'tests - rule' }
JE1VWEvaluatorTest >> testEvaluatesRule01 [
	self
		assertThatEvaluates: 'expression:term.'
		startingAt: 'rule'
		equals:
			{(NCProductionRule 
					headNamed: 'expression'
					body: {(NCNonterminal named: 'term')})}
]

{ #category : #'tests - rule' }
JE1VWEvaluatorTest >> testEvaluatesRule02 [
	self 
		assertThatEvaluates: 'expression:expression,plus symbol,term.'
		startingAt: 'rule' 
		equals: 
			{	(NCProductionRule
					headNamed: 'expression'
					body: {	(NCNonterminal named: 'expression').
								(NCNonterminal named: 'plus symbol').
								(NCNonterminal named: 'term')})}
]

{ #category : #'tests - rule' }
JE1VWEvaluatorTest >> testEvaluatesRule03 [
	self 
		assertThatEvaluates: 'expression:.' 
		startingAt: 'rule' 
		equals: {(NCProductionRule headNamed: 'expression' body: {})}
]

{ #category : #'tests - rule' }
JE1VWEvaluatorTest >> testEvaluatesRule04 [
	self
		assertThatEvaluates: 'expression: term; .'
		startingAt: 'rule'
		equals:
			{	(NCProductionRule 
					headNamed: 'expression'
					body: {(NCNonterminal named: 'term')}).
				(NCProductionRule headNamed: 'expression' body: {})}
]

{ #category : #'tests - rule' }
JE1VWEvaluatorTest >> testEvaluatesRule05 [
	self 
		assertThatEvaluates: 'expression: .' 
		startingAt: 'rule' 
		equals: {(NCProductionRule headNamed: 'expression' body: {})}
]

{ #category : #'tests - rule' }
JE1VWEvaluatorTest >> testEvaluatesRule06 [
	self 
		assertThatEvaluates: 'expression: expression, plus symbol, term;.'
		startingAt: 'rule' 
		equals: 
			{	(NCProductionRule
					headNamed: 'expression'
					body: {	(NCNonterminal named: 'expression').
								(NCNonterminal named: 'plus symbol').
								(NCNonterminal named: 'term')}).
				(NCProductionRule headNamed: 'expression' body: {})}
]

{ #category : #'tests - rule' }
JE1VWEvaluatorTest >> testEvaluatesRule07 [
	self 
		assertThatEvaluates:
'expression: 
	expression, plus symbol, term;
		.'
		startingAt: 'rule' 
		equals: 
			{	(NCProductionRule
					headNamed: 'expression'
					body: {	(NCNonterminal named: 'expression').
								(NCNonterminal named: 'plus symbol').
								(NCNonterminal named: 'term')}).
				(NCProductionRule headNamed: 'expression' body: {})}
]

{ #category : #'tests - rule' }
JE1VWEvaluatorTest >> testEvaluatesRule08 [
	self 
		assertThatEvaluates: 'expression: expression, less  than  symbol, term.'
		startingAt: 'rule' 
		equals: 
			{	(NCProductionRule
					headNamed: 'expression'
					body: {	(NCNonterminal named: 'expression').
								(NCNonterminal named: 'less than symbol').
								(NCNonterminal named: 'term')}) }
]

{ #category : #'tests - rule' }
JE1VWEvaluatorTest >> testEvaluatesRule09 [
	self 
		assertThatEvaluates: 'expression:expression,greater than symbol,term.'
		startingAt: 'rule' 
		equals: 
			{	(NCProductionRule
					headNamed: 'expression'
					body: {	(NCNonterminal named: 'expression').
								(NCNonterminal named: 'greater than symbol').
								(NCNonterminal named: 'term')}) }
]
