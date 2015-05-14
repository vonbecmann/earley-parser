instance creation
this: word matches: terminal between: startChart and: endChart
	"this word matches a terminal between start and end"

	^ self basicNew
		initializeWord: word
		terminal: terminal
		start: startChart
		end: endChart