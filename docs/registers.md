# Registers

The FSCC driver is a swiss army knife of sorts with communication. It can
handle many different situations, if configured correctly. Typically to
configure it to handle your specific situation you need to modify the card's
register values.

_For a complete listing of all of the configuration options please see the 
manual._

In HDLC mode some settings are fixed at certain values. If you are in
HDLC mode and after setting/getting your registers some bits don't look correct,
then they are likely fixed. A complete list of the fixed values can be found in 
the CCR0 section of the manual.

All of the registers, except FCR, are tied to a single port. FCR on the other hand 
is shared between two ports on a card. You can differentiate between which FCR 
settings affects what port by the A/B labels. A for port 0 and B for port 1.

_A [`purge()`](https://github.com/commtech/mfscc/blob/master/docs/purge.md) (receive side)
is required after changing the `MODE` bits in the `CCR0` register. If you need to change
the `MODE` bits but don't have a clock present, change the `CM` bits to `0x7` temporarily. This will give 
you an internal clock to switch modes. You can then switch to your desired `CM` now that your `MODE` is 
locked in._

###### Driver Support
| Code           | Version
| -------------- | --------
| `fscc-windows` | `v2.0.0` 
| `fscc-linux`   | `v2.0.0` 
| `pyfscc`       | `v1.0.0`
| `mfscc`        | `v1.0.0`


## Set
```fscc.set_registers(fscc_handle p, fscc_registers registers)```

| Parameter      | Type             | Description
| -------------- | ---------------- | -------------------------------------------
| `p`            | `fscc_handle`    | The handle to your port
| `registers`    | `fscc_registers` | The registers and values needing to be set

###### Examples
```MATLAB
fscc = mfscc();
...
regs = {'CCR0', hex2dec('0011201c'), 'BGR', 10};
fscc.set_registers(p, regs);
```


## Get
```registers = fscc.get_registers(fscc_handle p)```

| Parameter      | Type             | Description
| -------------- | ---------------- | -------------------------
| `p`            | `fscc_handle`    | The handle to your port

| Output         | Value
| -------------- | -------------------------------
| `registers`    | The registers and their values.

###### Examples
```MATLAB
fscc = mfscc();
...

registers = fscc.get_registers(p);
```


### Additional Resources
- Complete example: [`examples\registers.m`](https://github.com/commtech/mfscc/blob/master/examples/registers.m)
- Implemenation details: [`mfscc.m`](https://github.com/commtech/mfscc/blob/master/mfscc.m)
