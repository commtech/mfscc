fscc = mfscc();
p = fscc.connect(0);
reg_in = containers.Map({'CCR2','BGR'},{0,1});
fscc.set_registers(p, reg_in);
reg_out = fscc.get_registers(p)
fscc.disconnect(0);