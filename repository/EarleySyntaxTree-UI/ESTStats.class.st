"
print lines of code in the transcript
"
Class {
	#name : #ESTStats,
	#superclass : #Object,
	#category : #'EarleySyntaxTree-UI'
}

{ #category : #printing }
ESTStats class >> printLinesOfCode [
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
