public
accepts: words
	"it returns 
		the charts
		true or false, if it accepts the words
		a message, if theres a failure"

	^ [ 
	| charts |
	charts := self basicAccepts: words.
	Dictionary
		newFrom:
			{('charts' -> charts).
			('accepts' -> (charts last includes: (grammar startRule dotAtEnd startedAt: charts first)))} ]
		on: JEFailure
		do: [ :ex | 
			Dictionary
				newFrom:
					{('charts' -> ex charts).
					('accepts' -> false).
					('message' -> ex messageText)} ]