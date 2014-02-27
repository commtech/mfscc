fscc = mfscc();
p = fscc.connect(0);

% Tin interrupt
fscc.track_interrupts(p, hex2dec('00000400'), 1000)

fscc.disconnect(p);