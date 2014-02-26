fscc = mfscc();
p = fscc.connect(0);

% TX
fscc.purge(p, true, false);

% RX
fscc.purge(p, false, true);

% TX & RX
fscc.purge(p, true, true);

fscc.disconnect(p);