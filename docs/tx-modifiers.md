# TX Modifiers

| Modifiers | Value | Description
| -------- | ------ | -----------
| `XF`     | `0`    | Normal transmit (disable modifiers)
| `XREP`   | `1`    | Transmit frame repeatedly
| `TXT`    | `2`    | Transmit frame on timer
| `TXEXT`  | `4`    | Transmit frame on external signal

###### Support
| Code           | Version
| -------------- | --------
| `fscc-windows` | `v2.0.0`
| `fscc-linux`   | `v2.0.0`
| `pyfscc`       | `v1.0.0`
| `mfscc`        | `v1.0.0`

## Get
```int modifiers = fscc.get_tx_modifiers(fscc_handle p)```

| Parameter      | Type             | Description
| -------------- | ---------------- | -------------------------------------------
| `p`            | `fscc_handle`    | The handle to your port

| Output         | Value
| -------------- | ----------------------------------
| `modifiers`    | The modifiers currently enabled

###### Examples
```MATLAB
fscc = mfscc();
...

modifiers = fscc.get_tx_modifiers(p);
```


## Set
```fscc.set_tx_multiple(fscc_handle p, int modifiers)```

| Parameter      | Type             | Description
| -------------- | ---------------- | -------------------------------------------
| `p`            | `fscc_handle`    | The handle to your port
| `modifiers`    | `int`            | The tx modifiers you would like enabled

###### Examples
```MATLAB
fscc = mfscc();
...

fscc.set_tx_modifiers(p, fscc.TXEXT() | fscc.XREP());
```


### Additional Resources
- Complete example: [`examples\tx_modifiers.m`](https://github.com/commtech/mfscc/blob/master/examples/tx_modifiers.m)
- Implemenation details: [`mfscc.m`](https://github.com/commtech/mfscc/blob/master/mfscc.m)
