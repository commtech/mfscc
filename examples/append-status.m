fscc = mfscc();
p = fscc.connect(0);
status = fscc.get_append_status(p)
fscc.set_append_status(p, 1);
fscc.set_append_status(p, 0);
fscc.disconnect(p);