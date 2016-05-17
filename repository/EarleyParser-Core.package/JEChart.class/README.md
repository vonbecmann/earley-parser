a set of items implemented with a LinkedList

Nonterminals are unique, that's by they are use as a key in the dictionaries.

predictionItemsByNonterminal - items with the symbol at dot is a nonterminal, so they are involve in the predictionItemsByNonterminal of new items. 

finalItemsByNonterminal - items with the dot at the end, that were completed in this chart, so they are needed in the completion during the prediction of a nonterminal. It is used when you have epsilon rules.

itemsByChart - items by start chart. useful for testing if a item already exists.


