"
some typical grammar examples 
"
Class {
	#name : #JEExemplar,
	#superclass : #Object,
	#category : 'EarleyParser-Tests-Grammar'
}

{ #category : #'instance creation' }
JEExemplar class >> AE [
	"Arithmetic Expressions. page 15"

	^ JEGrammar
		productionRules:
			#(#('E' #('T')) 
			  #('E' #('E' 'plus symbol' 'T')) 
			  #('T' #('P')) 
			  #('T' #('T' 'star symbol' 'P')) 
			  #('P' #('letter a symbol')))
		representations:
			{('plus symbol' -> (JETerminal character: $+)).
			('star symbol' -> (JETerminal character: $*)).
			('letter a symbol' -> (JETerminal character: $a))}
]

{ #category : #'instance creation' }
JEExemplar class >> AyHo [
	"
	Practical Earley Parsing
	John Aycock
	R. Nigel Horspool
	page 2, figure 2
	"

	^ JEGrammar
		productionRules:
			#(	#('S' #('A' 'A' 'A' 'A')) 
				#('A' #('E')) 
				#('A' #('letter a symbol')) 
				#('E' #()))
		representations: {('letter a symbol' -> (JETerminal character: $a))}
]

{ #category : #'instance creation' }
JEExemplar class >> BK [
	"has unbounded ambiguity, yet it is a time n grammar. page 39.
	Tomita's An Efficient Context-free Parsing Algorithm For Natural Languages. 
	page 762. figure 23: Grammar G1."

	^ JEGrammar
		productionRules:
			#(	#('K' #()) 
				#('K' #('K' 'J')) 
				#('J' #('F')) 
				#('J' #('I')) 
				#('F' #('letter x symbol')) 
				#('I' #('letter x symbol')))
		representations: {('letter x symbol' -> (JETerminal character: $x))}
]

{ #category : #'instance creation' }
JEExemplar class >> BP [
	"has unbounded direct ambiguity, it's time is n ^ 2. page 40."

	^ JEGrammar
		productionRules:
			#(	#('P' #('M' 'N')) 
				#('M' #()) 
				#('M' #('M' 'letter a symbol')) 
				#('N' #()) 
				#('N' #('N' 'letter a symbol')))
		representations: {('letter a symbol' -> (JETerminal character: $a))}
]

{ #category : #'instance creation' }
JEExemplar class >> GRE [
	^ JEGrammar
		productionRules:
			#(	#('X' #('letter a symbol')) 
				#('X' #('X' 'letter b symbol')) 
				#('X' #('Y' 'letter a symbol')) 
				#('Y' #('letter e symbol')) 
				#('Y' #('Y' 'letter d symbol' 'Y')))
		representations:
			{('letter a symbol' -> (JETerminal character: $a)).
			('letter b symbol' -> (JETerminal character: $b)).
			('letter e symbol' -> (JETerminal character: $e)).
			('letter d symbol' -> (JETerminal character: $d))}
]

{ #category : #'instance creation' }
JEExemplar class >> PAL [
	"pallindrome grammar. page 65"

	^ JEGrammar
		productionRules:
			#(	#('A' #('letter x symbol')) 
				#('A' #('letter x symbol' 'A' 'letter x symbol')))
		representations: {('letter x symbol' -> (JETerminal character: $x))}
]

{ #category : #'instance creation' }
JEExemplar class >> RR [
	"RR is LR(1), but there is not bound on the size of charts, so it is not BS(1). page 48"

	^ JEGrammar
		productionRules: #(#('A' #('letter x symbol')) #('A' #('letter x symbol' 'A')))
		representations: {('letter x symbol' -> (JETerminal character: $x))}
]

{ #category : #'instance creation' }
JEExemplar class >> UBDA [
	"unbounded direct ambiguity. page 42.
	 It has unbounded direct ambiguity and no saving grace"

	^ JEGrammar
		productionRules: #(#('A' #('letter x symbol')) #('A' #('A' 'A')))
		representations: {('letter x symbol' -> (JETerminal character: $x))}
]
