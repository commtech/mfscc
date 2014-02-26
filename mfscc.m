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

function val = FSCC_UPDATE_VALUE
    val = -2;
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

function set_registers(h, registers)
    reg_struct = struct(registers{:});
    registers = libpointer('fscc_registersPtr', reg_struct);
    [e, ~, ~] = calllib(LIB_NAME, 'fscc_set_registers', h, registers);
    check_error(e);
end

function [registers] = get_registers(h)
    reg_struct = struct('FIFOT', FSCC_UPDATE_VALUE, ...
                        'STAR', FSCC_UPDATE_VALUE, ...
                        'CCR0', FSCC_UPDATE_VALUE, ...
                        'CCR1', FSCC_UPDATE_VALUE, ...
                        'CCR2', FSCC_UPDATE_VALUE, ...
                        'BGR', FSCC_UPDATE_VALUE, ...
                        'SSR', FSCC_UPDATE_VALUE, ...
                        'SMR', FSCC_UPDATE_VALUE, ...
                        'TSR', FSCC_UPDATE_VALUE, ...
                        'TMR', FSCC_UPDATE_VALUE, ...
                        'RAR', FSCC_UPDATE_VALUE, ...
                        'RAMR', FSCC_UPDATE_VALUE, ...
                        'PPR', FSCC_UPDATE_VALUE, ...
                        'TCR', FSCC_UPDATE_VALUE, ...
                        'VSTR', FSCC_UPDATE_VALUE, ...
                        'IMR', FSCC_UPDATE_VALUE, ...
                        'DPLLR', FSCC_UPDATE_VALUE, ...
                        'FCR', FSCC_UPDATE_VALUE ...
                    );

    registers = libpointer('fscc_registersPtr', reg_struct);
    [e, ~, registers] = calllib(LIB_NAME, 'fscc_get_registers', h, registers);

    for str = {'reserved1', 'reserved2', 'CMDR', 'reserved3'}
        registers = rmfield(registers, str);
    end

    check_error(e);
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



    
