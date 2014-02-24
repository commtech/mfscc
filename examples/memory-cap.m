fscc = mfscc();
p = fscc.connect(0);
fscc.set_memory_cap(p, 1000000, 2000000);
mem_cap = fscc.get_memory_cap(p)
fscc.disconnect(p);