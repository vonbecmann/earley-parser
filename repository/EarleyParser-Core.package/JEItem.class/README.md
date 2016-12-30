an Earley item or state. like a LR(0) item. 

start chart: where the recognition started.
end chart: the chart that contains this item or nil. but an item always belongs to a chart.

key : a composed key useful to know if this item already exists in a chart.

node : a packed parse node of myself, only used during parsing that's why it is lazy initialized.





