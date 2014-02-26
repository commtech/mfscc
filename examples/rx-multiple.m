fscc = mfscc();
p = fscc.connect(0);

status = fscc.get_rx_multiple(p)

fscc.enable_rx_multiple(p);
fscc.disable_rx_multiple(p);

fscc.disconnect(p);