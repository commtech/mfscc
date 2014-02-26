fscc = mfscc();
p = fscc.connect(0);

fscc.write(p, 'Hello world.');
[data, ~] = fscc.read(p, 100)

fscc.disconnect(p);