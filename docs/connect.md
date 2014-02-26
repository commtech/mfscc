# Connect

Opening a handle using this API will only give you access to the
synchronous functionality of the card. You will need to use the COM ports
if you would like to use the asynchronous functionality.

###### Driver Support
| Code           | Version
| -------------- | --------
| `fscc-windows` | `v2.0.0`
| `fscc-linux`   | `v2.0.0`
| `pyfscc`       | `v1.0.0`
| `mfscc`        | `v1.0.0`


## Connect
```fscc_handle p = fscc.connect(int port_num)```

| Parameter      | Type           | Description
| -------------- | -------------- | ---------------------------------
| `port_num`     | `unsigned int` | The port number you want to open

| Output         | Value
|--------------- | --------------------------
| `p`            | Pointer to fscc_handle

###### Examples
```MATLAB
fscc = mfscc();
...

p = fscc.connect(0);
```


### Additional Resources
- Complete example: [`examples\tutorial.m`](https://github.com/commtech/mfscc/blob/master/examples/tutorial.m)
- Implemenation details: [`mfscc.m`](https://github.com/commtech/mfscc/blob/master/mfscc.m)
