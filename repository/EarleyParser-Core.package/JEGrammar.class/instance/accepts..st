public
accepts: words
	| charts |
	charts := self basicAccepts: words.
	^ charts last includes: (JEItem rule: self startRule dotAtEnd chart: charts first)