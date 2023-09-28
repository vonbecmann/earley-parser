Class {
	#name : #JEGrammarTest,
	#superclass : #TestCase,
	#instVars : [
		'grammar'
	],
	#category : #'EarleyParser-Tests-Public'
}

{ #category : #'tests - accessing' }
JEGrammarTest >> testDuplicateNonterminals01 [
	grammar := JEGrammar
						productionRules: #(#('A' #()) #('A' #('letter x symbol')))
						representations: {('letter x symbol' -> (NCTerminal character: $x))}.
	self assert: grammar nonterminalsSize equals: 2.
	self
		assertCollection: grammar nonterminals
		hasSameElements:
				{(NCNonterminal named: 'A').
				(NCNonterminal named: 'letter x symbol')}
]

{ #category : #'tests - accessing' }
JEGrammarTest >> testDuplicateNonterminals02 [
	grammar := JEGrammar
						productionRules: #(#('A' #('letter x symbol')) #('A' #('A')))
						representations: {('letter x symbol' -> (NCTerminal character: $x))}.
	self assert: grammar nonterminalsSize equals: 2.
	self
		assertCollection: grammar nonterminals
		hasSameElements:
				{(NCNonterminal named: 'A').
				(NCNonterminal named: 'letter x symbol')}
]

{ #category : #'tests - accessing' }
JEGrammarTest >> testDuplicateRules01 [
	grammar := JEGrammar
						productionRules: #(#('A' #('letter x symbol')) #('A' #('letter x symbol')))
						representations: {('letter x symbol' -> (NCTerminal character: $x))}.
	self assert: grammar rulesSize equals: 2
]

{ #category : #'tests - accessing' }
JEGrammarTest >> testDuplicateRules02 [
	grammar := JEGrammar
						productionRules: #(#('A' #('A')) #('A' #('A')) #('A' #('letter x symbol')) #('A' #('letter x symbol')))
						representations: {('letter x symbol' -> (NCTerminal character: $x))}.
	self assert: grammar rulesSize equals: 3
]

{ #category : #'tests - accessing' }
JEGrammarTest >> testDuplicateRules03 [
	grammar := JEGrammar
						productionRules: #(#('A' #('letter x symbol')) #('A' #('letter x symbol')))
						representations: {	('letter x symbol' -> (NCTerminal character: $x)).
												('letter y symbol' -> (NCTerminal character: $y)).
												('letter y symbol' -> (NCTerminal character: $y))}.
	self assert: grammar rulesSize equals: 3.
	self
		assertCollection: grammar terminals
		hasSameElements: {(NCTerminal character: $x).(NCTerminal character: $y)}
]

{ #category : #tests }
JEGrammarTest >> testEmptyRules01 [
	self
		should: [ JEGrammar productionRules: #() representations: #() ]
		raise: AssertionFailure
		withExceptionDo: [ :ex | self assert: ex messageText equals: 'The collection of production rules cannot be empty.' ]
]

{ #category : #tests }
JEGrammarTest >> testEmptyRules02 [
	self
		should: [ JEGrammar productionRules: #(#('A' ())) representations: #() ]
		raise: AssertionFailure
		withExceptionDo: [ :ex | self assert: ex messageText equals: 'The collection of representation rules cannot be empty.' ]
]

{ #category : #'tests - accessing' }
JEGrammarTest >> testNonterminals [
	grammar := JEGrammar
						productionRules: #(#('A' #()) #('A' #('letter x symbol')))
						representations: {('letter x symbol' -> (NCTerminal character: $x))}.
	self assert: grammar nonterminalsSize equals: 2.
	self
		assertCollection: grammar nonterminals
		hasSameElements:
				{(NCNonterminal named: 'A').
				(NCNonterminal named: 'letter x symbol')}
]

{ #category : #'tests - accessing' }
JEGrammarTest >> testProductionRules [
	grammar := JEGrammar
		productionRules: #(#('A' #()) #('A' #('letter x symbol')))
		representations: {('letter x symbol' -> (NCTerminal character: $x))}.
	self
		assertCollection: grammar productionRules
		hasSameElements:
			{(NCProductionRule headNamed: 'A' body: {}).
			(NCProductionRule headNamed: 'A' body: {(NCNonterminal named: 'letter x symbol')}).
			(NCProductionRule headNamed: 'letter x symbol' body: {(NCTerminal character: $x)})}
]

{ #category : #tests }
JEGrammarTest >> testRuleAtNonterminal01 [
	grammar := JEGrammar
						productionRules: #(#('A' #('A')) #('A' #()) #('A' #('letter x symbol')))
						representations: {('letter x symbol' -> (NCTerminal character: $x))}.

	self assert: grammar rulesSize equals: 4.
	self
		assert: (grammar ruleAt: 'A'->1)
		equals: (NCProductionRule headNamed: 'A' body: {(NCNonterminal named: 'A')}).
	self
		assert: (grammar ruleAt: 'A'->2)
		equals: (NCProductionRule headNamed: 'A' body: {}).
	self
		assert: (grammar ruleAt: 'A'->3)
		equals: (NCProductionRule headNamed: 'A' body: {(NCNonterminal named: 'letter x symbol')}).
	self
		assert: (grammar ruleAt: 'letter x symbol'->1)
		equals: (NCProductionRule headNamed: 'letter x symbol' body: {(NCTerminal character: $x)})
]

{ #category : #tests }
JEGrammarTest >> testRuleAtNonterminal02 [
	grammar := JEGrammar
						productionRules: #(#('A' #('A')) #('A' #()) #('A' #('letter x symbol')))
						representations: {('letter x symbol' -> (NCTerminal character: $x))}.
	self assert: grammar rulesSize equals: 4.
	self
		should: [ grammar ruleAt: 'X' -> 1 ]
		raise: Error
		withExceptionDo: [ :ex | self assert: ex messageText equals: 'Unknown Nonterminal X' ]
]

{ #category : #tests }
JEGrammarTest >> testRuleAtNonterminal03 [
	grammar := JEGrammar
						productionRules: #(#('A' #('A')) #('A' #()) #('A' #('letter x symbol')))
						representations: {('letter x symbol' -> (NCTerminal character: $x))}.
	self assert: grammar rulesSize equals: 4.
	self
		should: [ grammar ruleAt: 'A'->4 ]
		raise: Error
		withExceptionDo: [ :ex | self assert: ex messageText equals: 'Unknown rule''s definition at index 4 for Nonterminal A' ]
]

{ #category : #tests }
JEGrammarTest >> testStartAtNonterminal01 [
	| subgrammarStartingAtB |
	grammar := JEGrammar
						productionRules: #(#('A' #('B')) #('A' #()) #('A' #('letter x symbol')) #('B' #()))
						representations: {('letter x symbol' -> (NCTerminal character: $x))}.

	self assert: grammar rulesSize equals: 5.
	subgrammarStartingAtB := grammar startAt: 'B'.
	self assert: subgrammarStartingAtB rulesSize equals: 5.
	self assert: subgrammarStartingAtB startRule body first equals: (NCNonterminal named: 'B')
]

{ #category : #tests }
JEGrammarTest >> testStartAtNonterminal02 [
	grammar := JEGrammar
						productionRules: #(#('A' #('B')) #('A' #()) #('A' #('letter x symbol')) #('B' #()))
						representations: {('letter x symbol' -> (NCTerminal character: $x))}.

	self assert: grammar rulesSize equals: 5.
	self
		should: [ grammar startAt: 'Z' ]
		raise: Error
		withExceptionDo: [ :ex | self assert: ex messageText equals: 'Unknown Nonterminal Z' ]
]

{ #category : #'tests - accessing' }
JEGrammarTest >> testStartSymbol [
	grammar := JEGrammar
						productionRules: #(#('A' #()) #('A' #('letter x symbol')))
						representations: {('letter x symbol' -> (NCTerminal character: $x))}.

	self assert: grammar startSymbol equals: (NCNonterminal named: 'A')
]

{ #category : #'tests - accessing' }
JEGrammarTest >> testTerminals [
	grammar := JEGrammar
						productionRules: #(#('A' #()) #('A' #('letter x symbol')))
						representations: {('letter x symbol' -> (NCTerminal character: $x))}.
	self
		assertCollection: grammar terminals
		hasSameElements: {(NCTerminal character: $x)}
]

{ #category : #tests }
JEGrammarTest >> testUnknownNonterminal01 [
	self
		should: [
			grammar := JEGrammar
				productionRules: #(#('A' #('B')) #('A' #('letter x symbol')))
				representations: {('letter x symbol' -> (NCTerminal character: $x))} ]
		raise: Error
		withExceptionDo: [ :ex | self assert: ex messageText equals: 'Unknown Nonterminal B' ]
]
