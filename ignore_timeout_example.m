fscc = mfscc();
fscc_handle = fscc.connect(0);
ignore_timeout = fscc.get_ignore_timeout(fscc_handle);
disp('Current ignore timeout: ')
disp(ignore_timeout.Value)
fscc.enable_ignore_timeout(fscc_handle);
disp('Enabled ignore timeout.')
fscc.disable_ignore_timeout(fscc_handle);
disp('Disabled ignore timeout.')
if ignore_timeout.Value == 1
    fscc.enable_ignore_timeout(fscc_handle);
end
disp('Ignore timeout returned to original setting.')
fscc.disconnect(fscc_handle);