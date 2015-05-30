printing
printLinesOfCode
	<script>
	| earleyParserCore message |
	earleyParserCore := 'EarleyParser-Core'.
	message := String
		streamContents: [ :s | 
			s
				nextPutAll: earleyParserCore;
				nextPutAll: '''s linesOfCode = ';
				nextPutAll: (RPackage organizer packageNamed: earleyParserCore) linesOfCode asString ].
	GrowlMorph openWithLabel: 'Lines of Code' contents: message.
	Transcript
		cr;
		nextPutAll: message;
		cr;
		flush