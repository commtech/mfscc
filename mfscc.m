function fscc_fun = mfscc()
    % This will pull in the library unless its already in
    if not(libisloaded('cfscc'))
        hfile = 'fscc.h';
        loadlibrary('cfscc.dll',hfile);
    end
    
    fscc_fun.get_append_status=@get_append_status;
    fscc_fun.enable_append_status=@enable_append_status;
    fscc_fun.disable_append_status=@disable_append_status;
    fscc_fun.get_append_timestamp=@get_append_timestamp;
    fscc_fun.enable_append_timestamp=@enable_append_timestamp;
    fscc_fun.disable_append_timestamp=@disable_append_timestamp;
    fscc_fun.set_clock_frequency=@set_clock_frequency;
    fscc_fun.connect=@connect;
    fscc_fun.disconnect=@disconnect;
    fscc_fun.get_ignore_timeout=@get_ignore_timeout;
    fscc_fun.enable_ignore_timeout=@enable_ignore_timeout;
    fscc_fun.disable_ignore_timeout=@disable_ignore_timeout;
    fscc_fun.get_memory_cap=@get_memory_cap;	% May not work
    fscc_fun.set_memory_cap=@set_memory_cap;    % May not work
    fscc_fun.purge=@purge;
    %fscc_fun.read=@read;
    fscc_fun.read_with_timeout=@read_with_timeout;
    %fscc_fun.read_with_blocking=@read_with_blocking;
    fscc_fun.set_registers=@set_registers;
    %fscc_fun.get_registers=@get_registers;
    fscc_fun.get_rx_multiple=@get_rx_multiple;
    fscc_fun.enable_rx_multiple=@enable_rx_multiple;
    fscc_fun.disable_rx_multiple=@disable_rx_multiple;
    %fscc_fun.track_interrupts=@track_interrupts;
    fscc_fun.track_interrupts_with_blocking=@track_interrupts_with_blocking;
    fscc_fun.track_interrupts_with_timeout=@track_interrupts_with_timeout;
    fscc_fun.get_tx_modifiers=@get_tx_modifiers;
    fscc_fun.set_tx_modifiers=@set_tx_modifiers;
    %fscc_fun.write=@write;
    fscc_fun.write_with_blocking=@write_with_blocking; % May not work
end

function [status] = get_append_status(handle)
    status = libpointer('uint32Ptr',0);
    calllib('cfscc', 'fscc_get_append_status', handle, status);
end

function enable_append_status(handle)
    calllib('cfscc', 'fscc_enable_append_status', handle);
end

function disable_append_status(handle)
    calllib('cfscc', 'fscc_disable_append_status', handle);
end

function [status] = get_append_timestamp(handle)
    status = libpointer('uint32Ptr',0);
    calllib('cfscc', 'fscc_get_append_timestamp', handle, status);
end

function enable_append_timestamp(handle)
    calllib('cfscc', 'fscc_enable_append_timestamp', handle);
end

function disable_append_timestamp(handle)
    calllib('cfscc', 'fscc_disable_append_timestamp', handle);
end

function set_clock_frequency(handle, frequency)
    success = calllib('cfscc', 'fscc_set_clock_frequency', handle, frequency);
     if success == 16005
        err = MException('InvalidParameter', 'Clock frequency is out of range (15,000 to 270,000,000)');
        throw(err)
     end
end

function [handle] = connect(port)
    handle = libpointer;
    success = calllib('cfscc', 'fscc_connect', port, handle);
    if success == 16003
        err = MException('PortNotFound', 'Port not found - board installed?');
        throw(err)
    elseif success == 16004
        err = MException('InvalidAccess', 'Insufficient permissions.');
        throw(err)
    end
end

function disconnect(handle)
    calllib('cfscc', 'fscc_disconnect', handle);
end

function [status] = get_ignore_timeout(handle)
    status = libpointer('uint32Ptr');
    calllib('cfscc', 'fscc_get_ignore_timeout', handle, status);
end

function enable_ignore_timeout(handle)
    calllib('cfscc', 'fscc_enable_ignore_timeout', handle);
end

function disable_ignore_timeout(handle)
    calllib('cfscc', 'fscc_disable_ignore_timeout', handle);
end

function [input, output] = get_memory_cap(handle)
    fscc_memory_cap = struct('input',int32(0),'output',int32(0));
    mem_struct = libpointer('c_struct',fscc_memory_cap);
    calllib('cfscc', 'fscc_get_memory_cap', handle, mem_struct);
    input = mem_struct.input;
    output = mem_struct.output;
end

function set_memory_cap(handle, input, output)
    fscc_memory_cap = struct('input', int32(input), 'output', int32(output));
    mem_struct = libpointer('c_struct', fscc_memory_cap);
    calllib('cfscc', 'fscc_set_memory_cap', handle, mem_struct);
end

function purge(handle, transmit, receive)
    calllib('cfscc', 'fscc_purge', handle, transmit, receive);
    if success == 16000
        err = MException('Timeout', 'Command timed out (missing clock)');
        throw(err)
    end
end

%function [data, amount_read] = read(handle, 
%end

function [data, amount_read] = read_with_timeout(handle, timeout)
    data = libpointer('voidPtr',[int8(str) 0]);
    amount_read = libpointer('uint32Ptr');
    calllib('cfscc', 'fscc_read', handle, data, 4096, amount_read, timeout);
    if success == 16002
        err = MException('BufferTooSmall', 'The buffer size is smaller than the next frame');
        throw(err)
    elseif success == 16001
        err = MException('incorrectMode', 'Using the synchronous port while in asynchronous mode');
        throw(err)
    end
end

%function [data, amount_read] = read_with_blocking(handle,
%end

% Currently non-functioning, this should take in registers, parse it for
% valid register names, map it to an appropriately sized and build
% structure, then send that onward to fscc_set_registers
function set_registers(handle, registers)
    key_set = {'RES1','RES2','FIFOT','RES3','RES4','CMDR','CCR0','CCR1','CCR2','BGR','SSR','SMR','TSR','TMR','RAR','RAMR','PPR','TCR','VSTR','RES5','IMR','DPLLR','FCR'};
    val_set = [-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1];
    reg_map = containers.Map(key_set, val_set);
    allKeys = keys(registers);
    for i = allKeys
        temp_i = upper(i);
        if ismember(temp_i, {'CMDR','CCR0','CCR1','CCR2','BGR','SSR','SMR','TSR','TMR','RAR','RAMR','PPR','TCR','IMR','DPLLR','FCR'})
            reg_map(char(temp_i)) = registers(char(temp_i));
        end
    end
    registers_in = struct('reserved1',int64(reg_map('RES1')),'RES2',int64(reg_map('RES2')),'FIFOT',int64(reg_map('FIFOT')),'RES3',int64(reg_map('RES3')),'RES4',int64(reg_map('RES4')),'CMDR',int64(reg_map('CMDR')),'CCR0',int64(reg_map('CCR0')),'CCR1',int64(reg_map('CCR1')),'CCR2',int64(reg_map('CCR2')),'BGR',int64(reg_map('BGR')),'SSR',int64(reg_map('SSR')),'SMR',int64(reg_map('SMR')),'TSR',int64(reg_map('TSR')),'TMR',int64(reg_map('TMR')),'RAR',int64(reg_map('RAR')),'RAMR',int64(reg_map('RAMR')),'PPR',int64(reg_map('PPR')),'TCR',int64(reg_map('TCR')),'VSTR',int64(reg_map('VSTR')),'RES5',int64(reg_map('RES5')),'IMR',int64(reg_map('IMR')),'DPLLR',int64(reg_map('DPLLR')),'FCR',int64(reg_map('FCR')));
    mem_struct = libstruct('fscc_registers',registers_in);
end

%function [registers] = get_registers(handle)
%end

function [status] = get_rx_multiple(handle)
    status = libpointer('uint32Ptr',0);
    calllib('cfscc', 'fscc_get_rx_multiple', handle, status);
end

function enable_rx_multiple(handle)
    calllib('cfscc', 'fscc_enable_rx_multiple', handle);
end

function disable_rx_multiple(handle)
    calllib('cfscc', 'fscc_disable_rx_multiple', handle);
end

function [matches] = track_interrupts_with_blocking(handle, interrupts)
    matches = libpointer('uint32Ptr', 0);
    calllib('cfscc', 'fscc_track_interrupts_with_blocking', handle, interrupts, matches);
end

function [matches] = track_interrupts_with_timeout(handle, interrupts, timeout)
    matches = libpointer('uint32Ptr', 0);
    calllib('cfscc', 'fscc_track_interrupts_with_timeout', handle, interrupts, matches, timeout);
end
function [tx_modifiers] = get_tx_modifiers(handle)
    tx_modifiers = libpointer('uint32Ptr',0);
    calllib('cfscc', 'fscc_get_tx_modifiers', handle, tx_modifiers);
end

function set_tx_modifiers(handle, tx_modifiers)
    calllib('cfscc', 'fscc_set_tx_modifiers', handle, tx_modifiers);
end

%function [written] = write(handle, data, size)
%end

function [written] = write_with_blocking(handle, data, size)
    written = libpointer('uint32Ptr',0);
    success = calllib('cfscc', 'fscc_write_with_blocking', handle, data, size, written);
    if success == 16002
        err = MException('BufferTooSmall', 'The write size exceeds the output memory usage cap');
        throw(err)
    elseif success == 16000
        err = MException('Timeout', 'Command timed out (missing clock)');
        throw(err)
    elseif success == 16001
        err = MException('IncorrectMode', 'Using the synchronous port while in asynchronous mode');
        throw(err)
    end
end






    
