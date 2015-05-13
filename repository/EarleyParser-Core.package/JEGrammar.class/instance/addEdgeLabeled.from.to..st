private
addEdgeLabeled: anObject from: fromItem to: previousItem 
	"builder
		gatherTargetNodeLabeled:
			(fromItem isFinal
				ifTrue: [ fromItem head ]
				ifFalse: [ fromItem rule ])
		from: fromItem startChart
		to: fromItem endChart."
	builder
		gatherTargetNodeLabeled: fromItem 
		from: fromItem startChart
		to: fromItem endChart.
	builder 
		gatherSourceNodeLabeled: anObject 
		from: previousItem endChart 
		to: fromItem endChart.
	previousItem isPredicted
		ifFalse: [ 
			builder 
				gatherSourceNodeLabeled: previousItem  
				from: previousItem startChart 
				to: previousItem endChart ].
	builder addEdge