public
accepts: words
	^ [ | charts |
	charts := self basicAccepts: words.
	charts last includes: (grammar startRule dotAtEnd startedAt: charts first) ]
		on: JEFailure
		do: [ :ex | false ]