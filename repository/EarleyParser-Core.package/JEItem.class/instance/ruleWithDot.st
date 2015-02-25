printing
ruleWithDot
	^ String streamContents: [ :stream | rule printOn: stream withDotAt: dotIndex ]