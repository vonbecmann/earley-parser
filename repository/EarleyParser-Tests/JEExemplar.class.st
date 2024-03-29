"
some typical grammar examples 
"
Class {
	#name : #JEExemplar,
	#superclass : #Object,
	#category : #'EarleyParser-Tests-Grammar'
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
			{('plus symbol' -> (NCTerminal character: $+)).
			('star symbol' -> (NCTerminal character: $*)).
			('letter a symbol' -> (NCTerminal character: $a))}
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
		representations: {('letter a symbol' -> (NCTerminal character: $a))}
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
		representations: {('letter x symbol' -> (NCTerminal character: $x))}
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
		representations: {('letter a symbol' -> (NCTerminal character: $a))}
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
			{('letter a symbol' -> (NCTerminal character: $a)).
			('letter b symbol' -> (NCTerminal character: $b)).
			('letter e symbol' -> (NCTerminal character: $e)).
			('letter d symbol' -> (NCTerminal character: $d))}
]

{ #category : #'instance creation' }
JEExemplar class >> LR [
	"page 71"

	^ JEGrammar
		productionRules: #(#('A' #('letter x symbol')) #('A' #('A' 'letter x symbol')))
		representations: {('letter x symbol' -> (NCTerminal character: $x))}
]

{ #category : #'instance creation' }
JEExemplar class >> PAL [
	"pallindrome grammar. page 65"

	^ JEGrammar
		productionRules:
			#(	#('A' #('letter x symbol'))
				#('A' #('letter x symbol' 'A' 'letter x symbol')))
		representations: {('letter x symbol' -> (NCTerminal character: $x))}
]

{ #category : #'instance creation' }
JEExemplar class >> RL [
	"	page 63.
	 	sentences: a^n a^m b^n (m >= 0, n >= 1)"

	^ JEGrammar
		productionRules:
			#(	#('R' #('A'))
				#('R' #('letter a symbol' 'R' 'letter b symbol'))
				#('A' #('letter a symbol'))
				#('A' #('A' 'letter a symbol')))
		representations:
			{	('letter a symbol' -> (NCTerminal character: $a)).
				('letter b symbol' -> (NCTerminal character: $b))}
]

{ #category : #'instance creation' }
JEExemplar class >> RR [
	"RR is LR(1), but there is not bound on the size of charts, so it is not BS(1). page 48"

	^ JEGrammar
		productionRules: #(#('A' #('letter x symbol')) #('A' #('letter x symbol' 'A')))
		representations: {('letter x symbol' -> (NCTerminal character: $x))}
]

{ #category : #'instance creation' }
JEExemplar class >> UBDA [
	"unbounded direct ambiguity. page 42.
	 It has unbounded direct ambiguity and no saving grace"

	^ JEGrammar
		productionRules: #(#('A' #('letter x symbol')) #('A' #('A' 'A')))
		representations: {('letter x symbol' -> (NCTerminal character: $x))}
]

{ #category : #'instance creation' }
JEExemplar class >> identifier [
	^ JEGrammar
		productionRules:
			#(	#('identifier' #('letter symbol' 'word symbol star'))
				#('word symbol star' #('word symbol' 'word symbol star'))
				#('word symbol star' #()))
		representations:
			{('letter symbol' -> (NCTerminal charSet: ($a to: $z) , ($A to: $Z))).
			('word symbol' -> (NCTerminal charSet: ($a to: $z) , ($A to: $Z) , ($0 to: $9) , '_'))}
]
