# Append Status

It is a good idea to pay attention to the status of each frame. For example, you
may want to see if the frame's CRC check succeeded or failed.

The FSCC reports this data to you by appending two additional bytes
to each frame you read from the card, if you opt-in to see this data. There are
a few methods of enabling this additional data.

###### Support
| Code           | Version
| -------------- | --------
| `fscc-windows` | `v2.0.0`
| `fscc-linux`   | `v2.0.0`
| `pyfscc`       | `v1.0.0`
| `mfscc`        | `v1.0.0`


## Property
```python
append_status = property(...)
```


## Get
###### Examples
```MATLAB
fscc = mfscc();
...

status = fscc.get_append_status(p);
```


## Enable
###### Examples
```MATLAB
fscc = mfscc();
...

fscc.enable_append_status(p);
```


## Disable
###### Examples
```MATLAB
fscc = mfscc();
...

fscc.disable_append_status(p);
```


### Additional Resources
- Complete example: [`examples\append-status.m`](https://github.com/commtech/mfscc/blob/master/examples/append-status.m)
- Implemenation details: [`mfscc.m`](https://github.com/commtech/mfscc/blob/master/mfscc.m)
