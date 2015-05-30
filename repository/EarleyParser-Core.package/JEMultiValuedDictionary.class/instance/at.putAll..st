accessing
at: key putAll: aCollection 
	aCollection do: [ :each | self at: key put: each ].
	^ aCollection 