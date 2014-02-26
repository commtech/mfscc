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


## Property
```python
tx_modifiers = property(...)
```


## Get
###### Examples
```MATLAB
fscc = mfscc();
...

modifiers = fscc.get_tx_modifiers(p);
```


## Set
###### Examples
```MATLAB
fscc = mfscc();
...
modifiers = bitor(1, 2);
fscc.set_tx_modifiers(p, modifiers);
```


### Additional Resources
- Complete example: [`examples\tx-modifiers.m`](https://github.com/commtech/mfscc/blob/master/examples/tx-modifiers.m)
- Implemenation details: [`mfscc.m`](https://github.com/commtech/mfscc/blob/master/mfscc.m)
