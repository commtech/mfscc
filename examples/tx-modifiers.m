fscc = mfscc();
p = fscc.connect(0);

modifiers = fscc.get_tx_modifiers(p)

% Enable transmit repeat & transmit on timer
fscc.set_tx_modifiers(p, fscc.TXT() | fscc.XREP());

% Revert to normal transmission
fscc.set_tx_modifiers(p, fscc.XF());

fscc.disconnect(p);