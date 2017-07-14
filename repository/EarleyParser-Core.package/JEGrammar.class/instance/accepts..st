public
accepts: words
	"answer if the grammar accepts the given words"

	^ (JERecognizer given: self) accepts: words