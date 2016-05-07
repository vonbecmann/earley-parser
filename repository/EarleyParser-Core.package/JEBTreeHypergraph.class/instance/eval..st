private
eval: exp
	exp class = JELinkedList
		ifTrue: [ 
			exp size = 2
				ifTrue: [ 
					exp first = #sum
						ifTrue: [ ^ (exp second collect: [ :each | self eval: each ]) sum ].
					exp first = #product
						ifTrue: [ ^ (exp second collect: [ :each | self eval: each ]) product ] ]
				ifFalse: [ ^ self eval: exp first ] ]
		ifFalse: [ ^ exp ]