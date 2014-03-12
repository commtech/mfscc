# RX Multiple

###### Support
| Code | Version |
| ---- | ------- |
| `fscc-windows` | `v2.0.0` |
| `fscc-linux` | `v2.0.0` |
| `mfscc` | `v1.0.0` |


## Get
```MATLAB
status = fscc.get_rx_multiple(h)
```

| Parameter | Description |
| --------- | ----------- |
| `h` | The handle to your port |

| Output | Value |
| ------ | ----- |
| `status` | The current rx multiple value |


###### Examples
```MATLAB
fscc = mfscc();
...

status = fscc.get_rx_multiple(h);
```


## Enable
```MATLAB
fscc.enable_rx_multiple(h)
```

| Parameter | Description |
| --------- | ----------- |
| `h` | The handle to your port |

###### Examples
```MATLAB
fscc = mfscc();
...

fscc.enable_rx_multiple(h);
```


## Disable
```MATLAB
fscc.disable_rx_multiple(h)
```

| Parameter | Description |
| --------- | ----------- |
| `h` | The handle to your port |

###### Examples
```MATLAB
fscc = mfscc();
...

fscc.disable_rx_multiple(h);
```


### Additional Resources
- Complete example: [`examples/rx_multiple.m`](../examples/rx_multiple.m)
- Implementation details: [`mfscc.m`](../mfscc.m)
