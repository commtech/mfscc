fscc = mfscc();
p = fscc.connect(0);

% 1MB onput, 2MB output 
fscc.set_memory_cap(p, 1000000, 2000000);

memcap = fscc.get_memory_cap(p)

fscc.disconnect(p);