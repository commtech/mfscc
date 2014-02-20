fscc = mfscc();
fscc_handle = fscc.connect(0);
mem_cap = fscc.get_memory_cap(fscc_handle);
disp('Current memory cap: ')
mem_in = ['Input: ', int2str(mem_cap.input)];
mem_out = ['Output: ', int2str(mem_cap.output)];
disp(mem_in)
disp(mem_out)
fscc.set_memory_cap(fscc_handle, 1000000, 2000000);
mem_cap_temp = fscc.get_memory_cap(fscc_handle);
disp('Changed memory cap: ')
mem_in = ['Input: ', int2str(mem_cap_temp.input)];
mem_out = ['Output: ', int2str(mem_cap_temp.output)];
disp(mem_in)
disp(mem_out)
fscc.set_memory_cap(fscc_handle, mem_cap.input, mem_cap.output);
disp('Memory caps returned to original setting.')
fscc.disconnect(fscc_handle);