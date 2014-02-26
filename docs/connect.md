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
```MATLAB
def __init__(self, port_num, append_status=True, append_timestamp=True)
```

| Exception            | Base Exception | Cause
| -------------------- | -------------- |-------------------------
| `PortNotFoundError`  | `OSError`      | Port not found
| `InvalidAccessError` | `OSError`      | Insufficient permissions

###### Examples
```MATLAB
fscc = mfscc();
...

p = fscc.connect(0);
```


### Additional Resources
- Complete example: [`examples\tutorial.m`](https://github.com/commtech/mfscc/blob/master/examples/tutorial.m)
- Implemenation details: [`mfscc.m`](https://github.com/commtech/mfscc/blob/master/mfscc.m)
