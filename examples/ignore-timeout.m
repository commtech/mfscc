fscc = mfscc();
p = fscc.connect(0);

status = fscc.get_ignore_timeout(p)

fscc.enable_ignore_timeout(p);
fscc.disable_ignore_timeout(p);

fscc.disconnect(p);