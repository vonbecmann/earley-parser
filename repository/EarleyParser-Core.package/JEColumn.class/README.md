a column of items at the given position in the chart.

acts as a set of items.

Nonterminals are unique, that's why they are use as a key in the dictionaries.

number - a position in the chart.

items - a queue of items to be processed in order.

predictionItemsByNonterminal - items with the symbol at dot is a nonterminal, so they are involve in the prediction of new items. 

finalItemsByNonterminal - items with the dot at the end, that were completed in this chart, so they are needed in the completion during the prediction of a nonterminal. It is used when you have epsilon rules.

itemsByKey - items by key. useful for testing if a item already exists.



