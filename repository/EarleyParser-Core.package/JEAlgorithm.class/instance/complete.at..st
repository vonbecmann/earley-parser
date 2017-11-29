private operations
complete: item at: column
	"
	Complete:
		For every state in S(k) of the form (X -> y *, j), 
		find states in S(j) of the form (Y -> a * X b, i) and 
			add (Y -> a X * b, i) to S(k).
	Optimized for efficiency.
	"

	self subclassResponsibility