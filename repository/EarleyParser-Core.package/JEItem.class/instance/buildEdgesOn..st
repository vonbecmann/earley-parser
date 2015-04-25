hypergraph
buildEdgesOn: builder
	edges
		do: [ :edge | 
			edge buildEdgesOn: builder.
			edge to buildEdgesOn: builder ]