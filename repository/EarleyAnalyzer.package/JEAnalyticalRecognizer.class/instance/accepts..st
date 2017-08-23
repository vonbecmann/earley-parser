public
accepts: words
	"it returns some stats"

	^ [ | chart |
	chart := self basicAccepts: words.
	OrderedDictionary
		newFrom:
			{('chart' -> chart).
			('accepts'
				-> (chart last includes: (grammar startRule dotAtEnd startedAt: chart first))).
			('chart stats'
				->
					(OrderedDictionary
						newFrom:
							{('each column size' -> (chart collect: [ :each | each size ])).
							('total item count' -> (chart collect: [ :each | each size ]) sum)})).
			('columnt stats'
				->
					(OrderedDictionary
						newFrom:
							{('moveDotForward send count' -> moveDotForwardCount).
							('add send count' -> addCount).
							('total message send count' -> (moveDotForwardCount + addCount))})).
			('complete count' -> completeCount).
			('predict count' -> predictCount).
			('scan count' -> scanCount).
			('total operation count' -> (completeCount + predictCount + scanCount)).
			('words size' -> (words size))} ]
		on: JEFailure
		do: [ :ex | 
			Dictionary
				newFrom:
					{('expected symbols' -> ex expectedSymbols).
					('position' -> ex position).
					('accepts' -> false).
					('message' -> ex messageText)} ]