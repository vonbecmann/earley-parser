printing
printLinesOfCode
	<script>
	| earleyParserCore |
	earleyParserCore := 'EarleyParser-Core'.
	Transcript
		cr;
		nextPutAll: earleyParserCore;
		nextPutAll: '''s linesOfCode = ';
		nextPutAll: (RPackage organizer packageNamed: earleyParserCore) linesOfCode asString;
		cr;
		flush