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

{ #category : #printing }
ESTExemplar class >> printLinesOfCode [
	<script>
	| earleySyntaxTree message |
	earleySyntaxTree := 'EarleySyntaxTree'.
	message := String
		streamContents: [ :s | 
			s
				nextPutAll: earleySyntaxTree;
				nextPutAll: '''s linesOfCode = ';
				nextPutAll: (RPackage organizer packageNamed: earleySyntaxTree) linesOfCode asString ].
	GrowlMorph openWithLabel: 'Lines of Code' contents: message.
	Transcript
		cr;
		nextPutAll: message;
		cr;
		flush
]
