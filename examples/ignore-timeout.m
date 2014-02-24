fscc = mfscc();
p = fscc.connect(0);
status = fscc.get_ignore_timeout(p)
fscc.set_ignore_timeout(p, 1);
fscc.set_ignore_timeout(p, 0);
fscc.disconnect(p);