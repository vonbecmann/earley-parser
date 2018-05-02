"
examples
"
Class {
	#name : #ESTExemplar,
	#superclass : #Object,
	#category : 'EarleySyntaxTree-Tests-Grammar'
}

{ #category : #accessing }
ESTExemplar class >> binaryNumber [
	^ JEGrammar
		productionRules:
			#(	#('binary number' #('bit sequence')) 
				#('bit sequence' #('bit')) 
				#('bit sequence' #('bit sequence' 'bit')) 
				#('bit' #('one symbol')) 
				#('bit' #('zero symbol')))
		representations:
			{('one symbol' -> (JETerminal character: $1)).
			('zero symbol' -> (JETerminal character: $0))}
]

{ #category : #accessing }
ESTExemplar class >> identifier [
	^ JEGrammar
		productionRules:
			#(('identifier' ('letter symbol' 'word symbol star')) 
			  ('word symbol star' ('word symbol' 'word symbol star')) 
			  ('word symbol star' ()))
		representations:
			{('letter symbol' -> (JETerminal charSet: ($a to: $z) , ($A to: $Z))).
			 ('word symbol' -> (JETerminal charSet: ($a to: $z) , ($A to: $Z) , ($0 to: $9) , '_'))}
]
