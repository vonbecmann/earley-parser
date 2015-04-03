public
accepts: words
	| charts |
	charts := self basicAccepts: words.
	^ charts last includes: (JEItem given: self startRule dotAtEnd startedAt: charts first)