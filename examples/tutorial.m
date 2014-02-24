fscc = mfscc();
p = fscc.connect(0);
written = fscc.write_with_blocking(p, 'Hello world!', 12);
[message, message_size] = fscc.read_with_timeout(p, 5);
char(message.Value)
disp(message_size.Value)
fscc.disconnect(p);