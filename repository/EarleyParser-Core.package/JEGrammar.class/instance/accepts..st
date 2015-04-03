public
accepts: words
	| charts |
	charts := self basicAccepts: words.
	^ charts last includes: (self startRule dotAtEnd startedAt: charts first)