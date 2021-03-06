Class {
	#name : #JEEpsilonGrammarTests,
	#superclass : #JERecognizeGrammarTest,
	#category : #'EarleyParser-Tests-Grammar'
}

{ #category : #running }
JEEpsilonGrammarTests >> setUp [
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
JEEpsilonGrammarTests >> testAccepts1A [
	self assert: (grammar accepts: 'a')
]

{ #category : #tests }
JEEpsilonGrammarTests >> testAcceptsEpsilon [
	self assert: (grammar accepts: '')
]
