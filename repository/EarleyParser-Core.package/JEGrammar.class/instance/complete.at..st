private
complete: item at: chart
	"complete: 
	For every state in S(k) of the form (X -> y *, j), 
	find states in S(j) of the form (Y -> a * X b, i) and 
	add (Y -> a X * b, i) to S(k)."

	chart addAll: (item collectPredictionItemsUsing: [ :anItem | anItem moveDotForward ])