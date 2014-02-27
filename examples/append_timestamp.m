fscc = mfscc();
p = fscc.connect(0);

status = fscc.get_append_timestamp(p)

fscc.enable_append_timestamp(p);
fscc.disable_append_timestamp(p);

fscc.disconnect(p);