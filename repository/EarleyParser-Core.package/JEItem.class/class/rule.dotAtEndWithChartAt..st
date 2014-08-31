instance creation
rule: aRule dotAtEndWithChartAt: aChart
	^ self rule: aRule dotAt: aRule body size + 1 chartAt: aChart