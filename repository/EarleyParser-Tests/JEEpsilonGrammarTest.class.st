Class {
	#name : #JEEpsilonGrammarTest,
	#superclass : #JERecognizeGrammarTest,
	#category : #'EarleyParser-Tests-Grammar'
}

{ #category : #running }
JEEpsilonGrammarTest >> setUp [
	super setUp.
	grammar := 
		JEGrammar
			productionRules: 
				#(	#(S #(A B A B))
			  		#(A #(E))
			  		#(B #(E))
			  		#(E #()))
			representations: {('A' -> (NCTerminal character: $a))}.
]

{ #category : #tests }
JEEpsilonGrammarTest >> testAccepts1A [
	self assert: (grammar accepts: 'a')
]

{ #category : #tests }
JEEpsilonGrammarTest >> testAcceptsEpsilon [
	self assert: (grammar accepts: '')
]
