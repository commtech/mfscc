fscc = mfscc();
fscc_handle = fscc.connect(0);
append_timeout = fscc.get_append_timeout(fscc_handle);
disp('Current append timeout: ')
disp(append_timeout.Value)
fscc.enable_append_timeout(fscc_handle);
disp('Enabled append timeout.')
fscc.disable_append_timeout(fscc_handle);
disp('Disabled append timeout.')
if append_timeout.Value == 1
    fscc.enable_append_timeout(fscc_handle);
end
disp('Append timeout returned to original setting.')
fscc.disconnect(fscc_handle);