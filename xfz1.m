function [methodinfo,structs,enuminfo,ThunkLibName]=xfz1
%XFZ1 Create structures to define interfaces found in 'fscc'.

%This function was generated by loadlibrary.m parser version 1.1.6.38 on Thu Feb 27 10:05:16 2014
%perl options:'fscc.i -outfile=xfz1.m'
ival={cell(1,0)}; % change 0 to the actual number of functions to preallocate the data.
structs=[];enuminfo=[];fcnNum=1;
fcns=struct('name',ival,'calltype',ival,'LHS',ival,'RHS',ival,'alias',ival);
ThunkLibName=[];
%  int fscc_connect ( unsigned port_num , fscc_handle * h ); 
fcns.name{fcnNum}='fscc_connect'; fcns.calltype{fcnNum}='cdecl'; fcns.LHS{fcnNum}='int32'; fcns.RHS{fcnNum}={'uint32', 'voidPtrPtr'};fcnNum=fcnNum+1;
%  int fscc_set_tx_modifiers ( fscc_handle h , unsigned modifiers ); 
fcns.name{fcnNum}='fscc_set_tx_modifiers'; fcns.calltype{fcnNum}='cdecl'; fcns.LHS{fcnNum}='int32'; fcns.RHS{fcnNum}={'voidPtr', 'uint32'};fcnNum=fcnNum+1;
%  int fscc_get_tx_modifiers ( fscc_handle h , unsigned * modifiers ); 
fcns.name{fcnNum}='fscc_get_tx_modifiers'; fcns.calltype{fcnNum}='cdecl'; fcns.LHS{fcnNum}='int32'; fcns.RHS{fcnNum}={'voidPtr', 'uint32Ptr'};fcnNum=fcnNum+1;
%  int fscc_set_memory_cap ( fscc_handle h , const struct fscc_memory_cap * memcap ); 
fcns.name{fcnNum}='fscc_set_memory_cap'; fcns.calltype{fcnNum}='cdecl'; fcns.LHS{fcnNum}='int32'; fcns.RHS{fcnNum}={'voidPtr', 'fscc_memory_capPtr'};fcnNum=fcnNum+1;
%  int fscc_get_memory_cap ( fscc_handle h , struct fscc_memory_cap * memcap ); 
fcns.name{fcnNum}='fscc_get_memory_cap'; fcns.calltype{fcnNum}='cdecl'; fcns.LHS{fcnNum}='int32'; fcns.RHS{fcnNum}={'voidPtr', 'fscc_memory_capPtr'};fcnNum=fcnNum+1;
%  int fscc_set_registers ( fscc_handle h , const struct fscc_registers * regs ); 
fcns.name{fcnNum}='fscc_set_registers'; fcns.calltype{fcnNum}='cdecl'; fcns.LHS{fcnNum}='int32'; fcns.RHS{fcnNum}={'voidPtr', 'fscc_registersPtr'};fcnNum=fcnNum+1;
%  int fscc_get_registers ( fscc_handle h , struct fscc_registers * regs ); 
fcns.name{fcnNum}='fscc_get_registers'; fcns.calltype{fcnNum}='cdecl'; fcns.LHS{fcnNum}='int32'; fcns.RHS{fcnNum}={'voidPtr', 'fscc_registersPtr'};fcnNum=fcnNum+1;
%  int fscc_get_append_status ( fscc_handle h , unsigned * status ); 
fcns.name{fcnNum}='fscc_get_append_status'; fcns.calltype{fcnNum}='cdecl'; fcns.LHS{fcnNum}='int32'; fcns.RHS{fcnNum}={'voidPtr', 'uint32Ptr'};fcnNum=fcnNum+1;
%  int fscc_enable_append_status ( fscc_handle h ); 
fcns.name{fcnNum}='fscc_enable_append_status'; fcns.calltype{fcnNum}='cdecl'; fcns.LHS{fcnNum}='int32'; fcns.RHS{fcnNum}={'voidPtr'};fcnNum=fcnNum+1;
%  int fscc_disable_append_status ( fscc_handle h ); 
fcns.name{fcnNum}='fscc_disable_append_status'; fcns.calltype{fcnNum}='cdecl'; fcns.LHS{fcnNum}='int32'; fcns.RHS{fcnNum}={'voidPtr'};fcnNum=fcnNum+1;
%  int fscc_get_append_timestamp ( fscc_handle h , unsigned * status ); 
fcns.name{fcnNum}='fscc_get_append_timestamp'; fcns.calltype{fcnNum}='cdecl'; fcns.LHS{fcnNum}='int32'; fcns.RHS{fcnNum}={'voidPtr', 'uint32Ptr'};fcnNum=fcnNum+1;
%  int fscc_enable_append_timestamp ( fscc_handle h ); 
fcns.name{fcnNum}='fscc_enable_append_timestamp'; fcns.calltype{fcnNum}='cdecl'; fcns.LHS{fcnNum}='int32'; fcns.RHS{fcnNum}={'voidPtr'};fcnNum=fcnNum+1;
%  int fscc_disable_append_timestamp ( fscc_handle h ); 
fcns.name{fcnNum}='fscc_disable_append_timestamp'; fcns.calltype{fcnNum}='cdecl'; fcns.LHS{fcnNum}='int32'; fcns.RHS{fcnNum}={'voidPtr'};fcnNum=fcnNum+1;
%  int fscc_get_ignore_timeout ( fscc_handle h , unsigned * status ); 
fcns.name{fcnNum}='fscc_get_ignore_timeout'; fcns.calltype{fcnNum}='cdecl'; fcns.LHS{fcnNum}='int32'; fcns.RHS{fcnNum}={'voidPtr', 'uint32Ptr'};fcnNum=fcnNum+1;
%  int fscc_enable_ignore_timeout ( fscc_handle h ); 
fcns.name{fcnNum}='fscc_enable_ignore_timeout'; fcns.calltype{fcnNum}='cdecl'; fcns.LHS{fcnNum}='int32'; fcns.RHS{fcnNum}={'voidPtr'};fcnNum=fcnNum+1;
%  int fscc_disable_ignore_timeout ( fscc_handle h ); 
fcns.name{fcnNum}='fscc_disable_ignore_timeout'; fcns.calltype{fcnNum}='cdecl'; fcns.LHS{fcnNum}='int32'; fcns.RHS{fcnNum}={'voidPtr'};fcnNum=fcnNum+1;
%  int fscc_get_rx_multiple ( fscc_handle h , unsigned * status ); 
fcns.name{fcnNum}='fscc_get_rx_multiple'; fcns.calltype{fcnNum}='cdecl'; fcns.LHS{fcnNum}='int32'; fcns.RHS{fcnNum}={'voidPtr', 'uint32Ptr'};fcnNum=fcnNum+1;
%  int fscc_enable_rx_multiple ( fscc_handle h ); 
fcns.name{fcnNum}='fscc_enable_rx_multiple'; fcns.calltype{fcnNum}='cdecl'; fcns.LHS{fcnNum}='int32'; fcns.RHS{fcnNum}={'voidPtr'};fcnNum=fcnNum+1;
%  int fscc_disable_rx_multiple ( fscc_handle h ); 
fcns.name{fcnNum}='fscc_disable_rx_multiple'; fcns.calltype{fcnNum}='cdecl'; fcns.LHS{fcnNum}='int32'; fcns.RHS{fcnNum}={'voidPtr'};fcnNum=fcnNum+1;
%  int fscc_track_interrupts ( fscc_handle h , unsigned interrupts , unsigned * matches , OVERLAPPED * o ); 
fcns.name{fcnNum}='fscc_track_interrupts'; fcns.calltype{fcnNum}='cdecl'; fcns.LHS{fcnNum}='int32'; fcns.RHS{fcnNum}={'voidPtr', 'uint32', 'uint32Ptr', 'voidPtr'};fcnNum=fcnNum+1;
%  int fscc_track_interrupts_with_blocking ( fscc_handle h , unsigned interrupts , unsigned * matches ); 
fcns.name{fcnNum}='fscc_track_interrupts_with_blocking'; fcns.calltype{fcnNum}='cdecl'; fcns.LHS{fcnNum}='int32'; fcns.RHS{fcnNum}={'voidPtr', 'uint32', 'uint32Ptr'};fcnNum=fcnNum+1;
%  int fscc_track_interrupts_with_timeout ( fscc_handle h , unsigned interrupts , unsigned * matches , unsigned timeout ); 
fcns.name{fcnNum}='fscc_track_interrupts_with_timeout'; fcns.calltype{fcnNum}='cdecl'; fcns.LHS{fcnNum}='int32'; fcns.RHS{fcnNum}={'voidPtr', 'uint32', 'uint32Ptr', 'uint32'};fcnNum=fcnNum+1;
%  int fscc_purge ( fscc_handle h , unsigned tx , unsigned rx ); 
fcns.name{fcnNum}='fscc_purge'; fcns.calltype{fcnNum}='cdecl'; fcns.LHS{fcnNum}='int32'; fcns.RHS{fcnNum}={'voidPtr', 'uint32', 'uint32'};fcnNum=fcnNum+1;
%  int fscc_write ( fscc_handle h , char * buf , unsigned size , unsigned * bytes_written , OVERLAPPED * o ); 
fcns.name{fcnNum}='fscc_write'; fcns.calltype{fcnNum}='cdecl'; fcns.LHS{fcnNum}='int32'; fcns.RHS{fcnNum}={'voidPtr', 'uint8Ptr', 'uint32', 'uint32Ptr', 'voidPtr'};fcnNum=fcnNum+1;
%  int fscc_write_with_blocking ( fscc_handle h , char * buf , unsigned size , unsigned * bytes_written ); 
fcns.name{fcnNum}='fscc_write_with_blocking'; fcns.calltype{fcnNum}='cdecl'; fcns.LHS{fcnNum}='int32'; fcns.RHS{fcnNum}={'voidPtr', 'uint8Ptr', 'uint32', 'uint32Ptr'};fcnNum=fcnNum+1;
%  int fscc_read ( fscc_handle h , char * buf , unsigned size , unsigned * bytes_read , OVERLAPPED * o ); 
fcns.name{fcnNum}='fscc_read'; fcns.calltype{fcnNum}='cdecl'; fcns.LHS{fcnNum}='int32'; fcns.RHS{fcnNum}={'voidPtr', 'uint8Ptr', 'uint32', 'uint32Ptr', 'voidPtr'};fcnNum=fcnNum+1;
%  int fscc_read_with_blocking ( fscc_handle h , char * buf , unsigned size , unsigned * bytes_written ); 
fcns.name{fcnNum}='fscc_read_with_blocking'; fcns.calltype{fcnNum}='cdecl'; fcns.LHS{fcnNum}='int32'; fcns.RHS{fcnNum}={'voidPtr', 'uint8Ptr', 'uint32', 'uint32Ptr'};fcnNum=fcnNum+1;
%  int fscc_read_with_timeout ( fscc_handle h , char * buf , unsigned size , unsigned * bytes_read , unsigned timeout ); 
fcns.name{fcnNum}='fscc_read_with_timeout'; fcns.calltype{fcnNum}='cdecl'; fcns.LHS{fcnNum}='int32'; fcns.RHS{fcnNum}={'voidPtr', 'uint8Ptr', 'uint32', 'uint32Ptr', 'uint32'};fcnNum=fcnNum+1;
%  int fscc_disconnect ( fscc_handle h ); 
fcns.name{fcnNum}='fscc_disconnect'; fcns.calltype{fcnNum}='cdecl'; fcns.LHS{fcnNum}='int32'; fcns.RHS{fcnNum}={'voidPtr'};fcnNum=fcnNum+1;
%  int fscc_set_clock_frequency ( fscc_handle h , unsigned frequency ); 
fcns.name{fcnNum}='fscc_set_clock_frequency'; fcns.calltype{fcnNum}='cdecl'; fcns.LHS{fcnNum}='int32'; fcns.RHS{fcnNum}={'voidPtr', 'uint32'};fcnNum=fcnNum+1;
structs.fscc_registers.members=struct('reserved1', 'int64#2', 'FIFOT', 'int64', 'reserved2', 'int64#2', 'CMDR', 'int64', 'STAR', 'int64', 'CCR0', 'int64', 'CCR1', 'int64', 'CCR2', 'int64', 'BGR', 'int64', 'SSR', 'int64', 'SMR', 'int64', 'TSR', 'int64', 'TMR', 'int64', 'RAR', 'int64', 'RAMR', 'int64', 'PPR', 'int64', 'TCR', 'int64', 'VSTR', 'int64', 'reserved3', 'int64#1', 'IMR', 'int64', 'DPLLR', 'int64', 'FCR', 'int64');
structs.fscc_memory_cap.members=struct('input', 'int32', 'output', 'int32');
enuminfo.transmit_type=struct('XF',0,'XREP',1,'TXT',2,'TXEXT',4);
enuminfo.error_type=struct('FSCC_TIMEOUT',16000,'FSCC_INCORRECT_MODE',16001,'FSCC_BUFFER_TOO_SMALL',16002,'FSCC_PORT_NOT_FOUND',16003,'FSCC_INVALID_ACCESS',16004,'FSCC_INVALID_PARAMETER',16005);
methodinfo=fcns;