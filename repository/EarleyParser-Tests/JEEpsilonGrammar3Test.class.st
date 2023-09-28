"
Dick Grune, Jacobs
Parsing Techniques, 2008

"
Class {
	#name : #JEEpsilonGrammar3Test,
	#superclass : #JERecognizeGrammarTest,
	#category : #'EarleyParser-Tests-Grammar'
}

{ #category : #running }
JEEpsilonGrammar3Test >> setUp [
	super setUp.
	grammar := JEGrammar
		productionRules:
			#(	#(E #(E Q F))
				#(E #(F))
				#(Q #()))
		representations:
			{	('F' -> (NCTerminal character: $a)).
				('Q' -> (NCTerminal character: $*)).
				('Q' -> (NCTerminal character: $/))}
]

{ #category : #tests }
JEEpsilonGrammar3Test >> testAccepts02 [
	self assert: (grammar accepts: 'aa/a')
]

{ #category : #tests }
JEEpsilonGrammar3Test >> testAcceptsAA [
	self assert: (grammar accepts: 'aa')
]
