public
accepts: words
	| charts |
	charts := self basicAccepts: words.
	builder reset.
	^ charts last includes: (self startRule dotAtEnd startedAt: charts first)