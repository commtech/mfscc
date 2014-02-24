fscc = mfscc();
p = fscc.connect(0);
status = fscc.get_append_timestamp(p)
fscc.set_append_timestamp(p, 1);
fscc.set_append_timestamp(p, 0);
fscc.disconnect(p);