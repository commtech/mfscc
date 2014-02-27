fscc = mfscc();
p = fscc.connect(0);

status = fscc.get_append_status(p)

fscc.enable_append_status(p);
fscc.disable_append_status(p);

fscc.disconnect(p);