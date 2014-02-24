fscc = mfscc();
p = fscc.connect(0);
fscc.set_clock_frequency(p, 18432000);
fscc.disconnect(p);