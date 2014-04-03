# Track Interrupts

###### Driver Support
| Code | Version |
| ---- | ------- |
| `fscc-windows` | `v2.7.0` |
| `fscc-linux` | `v2.0.0` |
| `mfscc` | `v1.0.0` |


## Track Interrupts
```MATLAB
matches = fscc.track_interrupts(h, interrupts, timeout):
```

| Parameter | Default | Description |
| --------- | ------- | ----------- |
| `h` | | The handle of your port |
| `interrupts` |  | The interrupts you would like to track |
| `timeout` | None | Number of milliseconds to wait for data before timing out |


###### Examples
```MATLAB
fscc = mfscc()
...

% TIN interrupt
fscc.track_interrupts(p, hex2dec('00000400'), 1000)
```


### Additional Resources
- Complete example: [`examples/track_interrupts.m`](../examples/track_interrupts.m)
- Implementation details: [`mfscc.m`](../mfscc.m)
