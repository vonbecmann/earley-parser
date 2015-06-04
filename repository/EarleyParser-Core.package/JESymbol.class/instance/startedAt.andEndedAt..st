converting
startedAt: startPosition andEndedAt: endPosition
	"a syntax node of myself that started and ended at the given positions"

	^ JESyntaxNode value: self start: startPosition end: endPosition