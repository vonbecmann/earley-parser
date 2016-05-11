accessing
atPosition: anInteger with: charts
	^ self new
		position: anInteger;
		charts: charts;
		signal