"
Dick Grune, Jacobs
Parsing Techniques, 2008

"
Class {
	#name : #JEEpsilonGrammar3Tests,
	#superclass : #TestCase,
	#instVars : [
		'grammar'
	],
	#category : 'EarleyParser-Tests-Grammar'
}

{ #category : #running }
JEEpsilonGrammar3Tests >> setUp [
	grammar := JEGrammar
		productionRules: 
			#(	#(E #(E Q F)) 
				#(E #(F)) 
				#(Q #()))
		representations:
			{	('F' -> (JETerminal character: $a)).
				('Q' -> (JETerminal character: $*)).
				('Q' -> (JETerminal character: $/))}
]

{ #category : #tests }
JEEpsilonGrammar3Tests >> testAccepts02 [
	self assert: (grammar accepts: 'aa/a')
]

{ #category : #tests }
JEEpsilonGrammar3Tests >> testAcceptsAA [
	self assert: (grammar accepts: 'aa')
]
