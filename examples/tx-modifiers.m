fscc = mfscc();
p = fscc.connect(0);
modifiers = fscc.get_tx_modifiers(p)
modifiers = 1 | 2;
fscc.set_tx_modifiers(p, modifiers);
fscc.set_tx_modifiers(p, 0);
fscc.disconnect(p);