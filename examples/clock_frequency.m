fscc = mfscc();
p = fscc.connect(0);

% 18.432 MHz
fscc.set_clock_frequency(p, 18432000);

fscc.disconnect(p);