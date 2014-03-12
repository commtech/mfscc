# TX Modifiers

| Modifiers | Value | Description |
| --------- | -----:| ----------- |
| `XF` | 0 | Normal transmit (disable modifiers) |
| `XREP` | 1 | Transmit frame repeatedly |
| `TXT` | 2 | Transmit frame on timer |
| `TXEXT` | 4 | Transmit frame on external signal |

###### Support
| Code | Version |
| ---- | ------- |
| `fscc-windows` | `v2.0.0` |
| `fscc-linux` | `v2.0.0` |
| `mfscc` | `v1.0.0` |

## Get
```MATLAB
modifiers = fscc.get_tx_modifiers(h)
```

| Parameter | Description |
| --------- | ----------- |
| `h` | The handle to your port |

| Output | Value |
| ------ | ----- |
| `modifiers` | The current tx modifiers value |

###### Examples
```MATLAB
fscc = mfscc();
...

modifiers = fscc.get_tx_modifiers(h);
```


## Set
```MATLAB
fscc.set_tx_multiple(h, modifiers)
```

| Parameter | Description |
| --------- | ----------- |
| `h` | The handle to your port |
| `modifiers` | What tx modifiers you would like to set |

###### Examples
```MATLAB
fscc = mfscc();
...

fscc.set_tx_modifiers(h, fscc.TXEXT() | fscc.XREP());
```


### Additional Resources
- Complete example: [`examples/tx_modifiers.m`](../examples/tx_modifiers.m)
- Implementation details: [`mfscc.m`](../mfscc.m)
