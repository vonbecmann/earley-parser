public
accepts: words
	^ [ 
	[ 
	| charts |
	charts := self basicAccepts: words.
	charts last includes: (self startRule dotAtEnd startedAt: charts first) ]
		ensure: [ builder reset ] ]
		on: JEFailure
		do: [ :ex | false ]