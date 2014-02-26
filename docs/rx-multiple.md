# RX Multiple

###### Support
| Code           | Version
| -------------- | --------
| `fscc-windows` | `v2.0.0`
| `fscc-linux`   | `v2.0.0`
| `pyfscc`       | `v1.0.0`
| `mfscc`        | `v1.0.0`


## Get
```int status = fscc.get_rx_multiple(fscc_handle p)```

| Parameter      | Type             | Description
| -------------- | ---------------- | -------------------------------------------
| `p`            | `fscc_handle`    | The handle to your port

| Output         | Value
| -------------- | -----------------
| `status`       | Whether rx multiple is enabled(1) or disabled(0)


###### Examples
```MATLAB
fscc = mfscc();
...

status = fscc.get_rx_multiple(p);
```


## Enable
```fscc.enable_rx_multiple(fscc_handle p)```

| Parameter      | Type             | Description
| -------------- | ---------------- | -------------------------------------------
| `p`            | `fscc_handle`    | The handle to your port

###### Examples
```MATLAB
fscc = mfscc();
...

fscc.enable_rx_multiple(p);
```


## Disable
```fscc.disable_rx_multiple(fscc_handle p)```

| Parameter      | Type             | Description
| -------------- | ---------------- | -------------------------------------------
| `p`            | `fscc_handle`    | The handle to your port

###### Examples
```MATLAB
fscc = mfscc();
...

fscc.disable_rx_multiple(p);
```


### Additional Resources
- Complete example: [`examples\rx-multiple.m`](https://github.com/commtech/mfscc/blob/master/examples/rx-multiple.m)
- Implemenation details: [`mfscc.m`](https://github.com/commtech/mfscc/blob/master/mfscc.m)
