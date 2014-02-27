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


## Get
```int status = fscc.get_append_status(fscc_handle p)```

| Parameter      | Type          | Description
| -------------- | ------------- | ------------------------
| `p`            | `fscc_handle` | The handle to your port

| Output      | Value
|------------ | ------------------------
| `status`    | Whether append status is enabled(1) or disabled(0)

###### Examples
```MATLAB
fscc = mfscc();
...

status = fscc.get_append_status(p);
```

## Enable
```fscc.enable_append_status(fscc_handle p)```

| Parameter      | Type          | Description
| -------------- | ------------- | ------------------------
| `p`            | `fscc_handle` | The handle to your port


###### Examples
```MATLAB
fscc = mfscc();
...

fscc.enable_append_status(p);
```


## Disable
```fscc.disable_append_status(fscc_handle p)```

| Parameter      | Type          | Description
| -------------- | ------------- | ------------------------
| `p`            | `fscc_handle` | The handle to your port

###### Examples
```MATLAB
fscc = mfscc();
...

fscc.disable_append_status(p);
```


### Additional Resources
- Complete example: [`examples\append_status.m`](https://github.com/commtech/mfscc/blob/master/examples/append_status.m)
- Implemenation details: [`mfscc.m`](https://github.com/commtech/mfscc/blob/master/mfscc.m)
