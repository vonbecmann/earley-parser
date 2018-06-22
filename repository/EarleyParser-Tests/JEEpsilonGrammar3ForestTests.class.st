Class {
	#name : #JEEpsilonGrammar3ForestTests,
	#superclass : #JEParseGrammarTest,
	#category : #'EarleyParser-Tests-Parsing'
}

{ #category : #running }
JEEpsilonGrammar3ForestTests >> setUp [
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
JEEpsilonGrammar3ForestTests >> testParse02 [
	
	forest := grammar parse: 'aa/a'.
	
	self deny: forest isAmbiguous.
	self assert: forest numberOfTrees equals: 1
]
