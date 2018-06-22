"
Dick Grune, Jacobs
Parsing Techniques, 2008

"
Class {
	#name : #JEEpsilonGrammar3Tests,
	#superclass : #JERecognizeGrammarTest,
	#category : #'EarleyParser-Tests-Grammar'
}

{ #category : #running }
JEEpsilonGrammar3Tests >> setUp [
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
JEEpsilonGrammar3Tests >> testAccepts02 [
	self assert: (grammar accepts: 'aa/a')
]

{ #category : #tests }
JEEpsilonGrammar3Tests >> testAcceptsAA [
	self assert: (grammar accepts: 'aa')
]
