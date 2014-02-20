fscc = mfscc();
fscc_handle = fscc.connect(0);
fscc.set_clock_frequency(fscc_handle, 18432000);
disp('FSCC clock frequency set to: 18432000')
fscc.disconnect(fscc_handle);