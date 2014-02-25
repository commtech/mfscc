fscc = mfscc();
p = fscc.connect(0);
written = fscc.write_with_blocking(p, 'Hello world.', 12);
[message, message_size] = fscc.read_with_timeout(p, 5);
display(message)
fscc.purge(p,1,1);
fscc.disconnect(p);