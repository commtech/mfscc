fscc = mfscc();
p = fscc.connect(0);
fscc.purge(p, 1, 0);
fscc.purge(p, 0, 1);
fscc.purge(p, 1, 1);
fscc.disconnect(p);