# Track Interrupts
This feature is currently not supported in MATLAB.

###### Driver Support
| Code           | Version
| -------------- | --------
| `fscc-windows` | `v2.7.0` 
| `pyfscc`       | `v1.0.0`
| `mfscc`        | `v1.0.0`


## Track Interrupts
```MATLAB
int matches = fscc.track_interrupts(fscc_handle p, int interrupts, int timeout):
```

| Parameter    | Type          | Default | Description
| ------------ | ------------- | ------- | ---------------------------------------------------------
| `p`          | `fscc_handle` |         | The handle of your port
| `interrupts` | `int`         |         | The interrupts you would like to track
| `timeout`    | `int`         | None    | Number of milliseconds to wait for data before timing out


###### Examples
```MATLAB
fscc = mfscc()
...

# TIN interrupt
fscc.track_interrupts(p, hex2dec('00000400'), 1000)
```


### Additional Resources
- Complete example: [`examples\track-interrupts.m`](https://github.com/commtech/mfscc/blob/master/examples/track-interrupts.m)
- Implemenation details: [`mfscc.m`](https://github.com/commtech/mfscc/blob/master/mfscc.m)
