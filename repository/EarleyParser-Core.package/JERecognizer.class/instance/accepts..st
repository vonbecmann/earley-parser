public
accepts: words
	^ [ 
	| chart |
	chart := self basicAccepts: words.
	chart last includes: (grammar startRule dotAtEnd startedAt: chart first) ]
		on: JEFailure
		do: [ :ex | false ]