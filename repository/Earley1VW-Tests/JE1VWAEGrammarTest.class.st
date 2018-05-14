Class {
	#name : #JE1VWAEGrammarTest,
	#superclass : #TestCase,
	#instVars : [
		'grammar'
	],
	#category : 'Earley1VW-Tests'
}

{ #category : #tests }
JE1VWAEGrammarTest >> testAcceptsMixedExp [
	grammar := JEGrammar
		e1vw:
'expression:
	term;
	expression, plus symbol, term.
term:
	product;
	term, star symbol, product.
product: a symbol.'
		representations:
			{('plus symbol' -> (NCTerminal character: $+)).
			('star symbol' -> (NCTerminal character: $*)).
			('a symbol' -> (NCTerminal character: $a))}.
	self assert: (grammar accepts: 'a+a*a+a*a')
]

{ #category : #tests }
JE1VWAEGrammarTest >> testInstanceCreation [
	grammar := JEGrammar
		e1vw:
'expression:
	term;
	expression, plus symbol, term.
term:
	product;
	term, star symbol, product.
product: a symbol.'
		representations:
			{('plus symbol' -> (NCTerminal character: $+)).
			('star symbol' -> (NCTerminal character: $*)).
			('a symbol' -> (NCTerminal character: $a))}.
			
	self assert: grammar rulesSize equals: 8.
	self assert: grammar nonterminalsSize equals: 6.
]

{ #category : #tests }
JE1VWAEGrammarTest >> testInstanceCreation02 [
	self
		should: [ 
			JEGrammar
				e1vw:
'expression:
	term;
	expression, plus symbol, term.
term:
	product;
	term, star symbol, product.
product: a symbol.'
				representations: {} ]
		raise: Error
]

{ #category : #tests }
JE1VWAEGrammarTest >> testInstanceCreation03 [
	self 
		should: [ 
JEGrammar
	e1vw:
'expression:
	term;
	expression, plus symbol, term.
term:
	product;
	term, power symbol, product.
product: a symbol.'
	representations:
		{('plus symbol' -> (NCTerminal character: $+)).
		('star symbol' -> (NCTerminal character: $*)).
		('a symbol' -> (NCTerminal character: $a))} ]
		raise: Error
			
	
]
