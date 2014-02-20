fscc = mfscc();
fscc_handle = fscc.connect(0);
append_status = fscc.get_append_status(fscc_handle);
disp('Current append status: ')
disp(append_status.Value)
fscc.enable_append_status(fscc_handle);
disp('Enabled append status.')
fscc.disable_append_status(fscc_handle);
disp('Disabled append status.')
if append_status.Value == 1
    fscc.enable_append_status(fscc_handle);
end
disp('Append status returned to original setting.')
fscc.disconnect(fscc_handle);