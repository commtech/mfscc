function fscc = mfscc()
    % This will pull in the library unless its already in
    if not(libisloaded(LIB_NAME))
        [~, ~] = loadlibrary(LIB_NAME, 'fscc.h');
    end

    fscc.get_append_status=@get_append_status;
    fscc.enable_append_status=@enable_append_status;
    fscc.disable_append_status=@disable_append_status;
    fscc.get_append_timestamp=@get_append_timestamp;
    fscc.enable_append_timestamp=@enable_append_timestamp;
    fscc.disable_append_timestamp=@disable_append_timestamp;
    fscc.set_clock_frequency=@set_clock_frequency;
    fscc.connect=@connect;
    fscc.disconnect=@disconnect;
    fscc.get_ignore_timeout=@get_ignore_timeout;
    fscc.enable_ignore_timeout=@enable_ignore_timeout;
    fscc.disable_ignore_timeout=@disable_ignore_timeout;
    fscc.get_memory_cap=@get_memory_cap;
    fscc.set_memory_cap=@set_memory_cap;
    fscc.purge=@purge;
    fscc.read=@read;
    fscc.set_registers=@set_registers;
    fscc.get_registers=@get_registers;
    fscc.get_rx_multiple=@get_rx_multiple;
    fscc.enable_rx_multiple=@enable_rx_multiple;
    fscc.disable_rx_multiple=@disable_rx_multiple;
    fscc.track_interrupts=@track_interrupts;
    fscc.get_tx_modifiers=@get_tx_modifiers;
    fscc.set_tx_modifiers=@set_tx_modifiers;
    fscc.write=@write;
end

function path = LIB_NAME
    path = 'cfscc';
end

function [status] = get_append_status(h)
    status = libpointer('uint32Ptr', 0);
    [e, ~, status] = calllib(LIB_NAME, 'fscc_get_append_status', h, ... 
                             status);
    check_error(e);
end

function enable_append_status(h)
    [e, ~] = calllib(LIB_NAME, 'fscc_enable_append_status', h);
    check_error(e);
end

function disable_append_status(h)
    [e, ~] = calllib(LIB_NAME, 'fscc_disable_append_status', h);
    check_error(e);
end

function [status] = get_append_timestamp(h)
    status = libpointer('uint32Ptr', 0);
    [e, ~, status] = calllib(LIB_NAME, 'fscc_get_append_timestamp', h, ...
                             status);
    check_error(e);
end

function enable_append_timestamp(h)
    [e, ~] = calllib(LIB_NAME, 'fscc_enable_append_timestamp', h);
    check_error(e);
end

function disable_append_timestamp(h)
    [e, ~] = calllib(LIB_NAME, 'fscc_disable_append_timestamp', h);
    check_error(e);
end

function set_clock_frequency(h, frequency)
    [e, ~] = calllib(LIB_NAME, 'fscc_set_clock_frequency', h, frequency);
    check_error(e);
end

function [h] = connect(port_num)
    h = libpointer;
    [e, h] = calllib(LIB_NAME, 'fscc_connect', port_num, h);
    check_error(e);
end

function disconnect(h)
    [~, ~] = calllib(LIB_NAME, 'fscc_disconnect', h);
end

function [status] = get_ignore_timeout(h)
    status = libpointer('uint32Ptr', 0);
    [e, ~, status] = calllib(LIB_NAME, 'fscc_get_ignore_timeout', h, ...
                             status);
    check_error(e);
end

function enable_ignore_timeout(h)
    [e, ~] = calllib(LIB_NAME, 'fscc_enable_ignore_timeout', h);
    check_error(e);
end

function disable_ignore_timeout(h)
    [e, ~] = calllib(LIB_NAME, 'fscc_disable_ignore_timeout', h);
    check_error(e);
end

function memcap = get_memory_cap(h)
    memcap_struct = struct('input', int32(-2), 'output', int32(-2));
    memcap = libpointer('fscc_memory_cap', memcap_struct);
    [e, ~, memcap] = calllib(LIB_NAME, 'fscc_get_memory_cap', h, memcap);
    check_error(e);
end
 
function set_memory_cap(h, input, output)
    memcap_struct = struct('input', int32(input), ...
                           'output', int32(output));
    memcap = libpointer('fscc_memory_cap', memcap_struct);
    [e, ~, ~] = calllib(LIB_NAME, 'fscc_set_memory_cap', h, memcap);
    check_error(e);
end

function purge(h, tx, rx)
    [e, ~] = calllib(LIB_NAME, 'fscc_purge', h, tx, rx);
    check_error(e);
end

function [data, bytes_read] = read(h, timeout, size)
    if ~exist('timeout', 'var')
        timeout = 0;
    end
    if ~exist('size', 'var')
        size = 4096;
    end

    data_ptr = libpointer('cstring', char(zeros(1, size + 1)));
    bytes_read  = libpointer('uint32Ptr', 0);

    if timeout
        [e, ~, data_ptr, bytes_read] = calllib(LIB_NAME, 'fscc_read_with_timeout', h, data_ptr, size, bytes_read, timeout);
    else
        [e, ~, data_ptr, bytes_read] = calllib(LIB_NAME, 'fscc_read_with_blocking', h, data_ptr, size, bytes_read);
    end
    
    if bytes_read
        data = data_ptr(1:bytes_read + 1);
    end

    check_error(e);
end

%TODO: Analysis
function set_registers(h, registers)
    key_set = {'FIFOT','CMDR','CCR0','CCR1','CCR2','BGR','SSR','SMR','TSR','TMR','RAR','RAMR','PPR','TCR','VSTR','IMR','DPLLR','FCR'};
    double_one = {[-1,-1]};
    val_set = [-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1];
    reg_map = containers.Map(key_set, val_set);
    allKeys = keys(registers);
    for i = allKeys
        temp_i = upper(i);
        if ismember(temp_i, {'CMDR','CCR0','CCR1','CCR2','BGR','SSR','SMR','TSR','TMR','RAR','RAMR','PPR','TCR','IMR','DPLLR','FCR'})
            reg_map(char(temp_i)) = registers(char(temp_i));
        end
    end
    registers_in = struct('reserved1',double_one,'FIFOT',reg_map('FIFOT'),'reserved2',double_one,'CMDR',reg_map('CMDR'),'STAR', -1,'CCR0',reg_map('CCR0'),'CCR1',reg_map('CCR1'),'CCR2',reg_map('CCR2'),'BGR',reg_map('BGR'),'SSR',reg_map('SSR'),'SMR',reg_map('SMR'),'TSR',reg_map('TSR'),'TMR',reg_map('TMR'),'RAR',reg_map('RAR'),'RAMR',reg_map('RAMR'),'PPR',reg_map('PPR'),'TCR',reg_map('TCR'),'VSTR',reg_map('VSTR'),'reserved3',-1,'IMR',reg_map('IMR'),'DPLLR',reg_map('DPLLR'),'FCR',reg_map('FCR'));
    mem_struct = libstruct('fscc_registers',registers_in);
    e = calllib(LIB_NAME, 'fscc_set_registers', h, mem_struct);    
    check_error(e);
end

%TODO: Analysis
function [reg_out] = get_registers(h)
    reg_struct = struct('reserved1',-1,'FIFOT',-2,'reserved2',-1,'CMDR',-1,'STAR', -2,'CCR0',-2,'CCR1',-2,'CCR2',-2,'BGR',-2,'SSR',-2,'SMR',-2,'TSR',-2,'TMR',-2,'RAR',-2,'RAMR',-2,'PPR',-2,'TCR',-2,'VSTR',-2,'reserved3',-1,'IMR',-2,'DPLLR',-2,'FCR',-2);
    registers = libpointer('fscc_registers',reg_struct);
    e = calllib(LIB_NAME, 'fscc_get_registers', h, registers);
    check_error(e);
    reg_out = get(registers, 'Value');
end

function [status] = get_rx_multiple(h)
    status = libpointer('uint32Ptr', 0);
    [e, ~, status] = calllib(LIB_NAME, 'fscc_get_rx_multiple', h, status);
    check_error(e);
end

function enable_rx_multiple(h)
    [e, ~] = calllib(LIB_NAME, 'fscc_enable_rx_multiple', h);    
    check_error(e);
end

function disable_rx_multiple(h)
    [e, ~] = calllib(LIB_NAME, 'fscc_disable_rx_multiple', h);
    check_error(e);
end

%TODO: Analysis
function [matches] = track_interrupts(h, interrupts, timeout)
    if ~exist('timeout', 'var')
        timeout = 0;
    end

    matches = libpointer('uint32Ptr', 0);
    
    if timeout
        [e, ~, matches] = calllib(LIB_NAME, 'fscc_track_interrupts_with_timeout', h, interrupts, matches, timeout); 
    else
        [e, ~, matches] = calllib(LIB_NAME, 'fscc_track_interrupts_with_blocking', h, interrupts, matches);  
    end

    check_error(e);
end

function [modifiers] = get_tx_modifiers(h)
    modifiers = libpointer('uint32Ptr', 0);
    [e, ~, modifiers] = calllib(LIB_NAME, 'fscc_get_tx_modifiers', h, ...
                                modifiers);
    check_error(e);
end

function set_tx_modifiers(h, tx_modifiers)
    [e, ~] = calllib(LIB_NAME, 'fscc_set_tx_modifiers', h, tx_modifiers);
    check_error(e);
end

function [bytes_written] = write(h, data)
    bytes_written = libpointer('uint32Ptr', 0);
    size = length(data);
    [e, ~, ~, bytes_written] = calllib(LIB_NAME, 'fscc_write_with_blocking', h, data, size, bytes_written);
    check_error(e);
end

function check_error(e)
    if e == 0
    elseif e == 16000
        throw(MException('FSCC:Timeout', 'Command timed out (missing clock)'));
    elseif e == 16001
        throw(MException('FSCC:IncorrectMode', 'Incorrect mode'));
    elseif e == 16002
        throw(MException('FSCC:BufferTooSmall', 'Buffer too small'));
    elseif e == 16003
        throw(MException('FSCC:PortNotFound', 'Port not found'));
    elseif e == 16004
        throw(MException('FSCC:InvalidAccess', 'Port not found'));
    elseif e == 16005
        throw(MException('FSCC:InvalidParameter', 'Invalid parameter'));
    else
        throw(MException('FSCC:UnknownError', 'Unknown error'));
    end
end



    
