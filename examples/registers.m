fscc = mfscc();
p = fscc.connect(0);

regs = {'CCR0', hex2dec('0011201c'), 'BGR', 10};
fscc.set_registers(p, regs);

regs = fscc.get_registers(p)

fscc.disconnect(0);