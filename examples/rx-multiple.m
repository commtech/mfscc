fscc = mfscc()
p = fscc.connect(0);
status = fscc.get_rx_multiple(p)
fscc.set_rx_multiple(p, 1);
fscc.set_rx_multiple(p, 0);
fscc.disconnect(p);