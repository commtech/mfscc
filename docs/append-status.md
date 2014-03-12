# Append Status

It is a good idea to pay attention to the status of each frame. For example, you may want to see if the frame's CRC check succeeded or failed.

The FSCC reports this data to you by appending two additional bytes to each frame you read from the card, if you opt-in to see this data. There are a few methods of enabling this additional data.

###### Support
| Code | Version |
| ---- | ------- |
| `fscc-windows` | `v2.0.0` |
| `fscc-linux` | `v2.0.0` |
| `mfscc` | `v1.0.0` |


## Get
```MATLAB
status = fscc.get_append_status(h)
```

| Parameter | Description |
| --------- | ----------- |
| `h` | The handle to your port |

| Output |
|------- |
| The current append status value |

###### Examples
```MATLAB
fscc = mfscc();
...

status = fscc.get_append_status(h);
```

## Enable
```MATLAB
fscc.enable_append_status(h)
```

| Parameter | Description |
| --------- | ----------- |
| `h` | The handle to your port |


###### Examples
```MATLAB
fscc = mfscc();
...

fscc.enable_append_status(h);
```


## Disable
```MATLAB
fscc.disable_append_status(fscc_handle h)
```

| Parameter | Description |
| --------- | ----------- |
| `h` | The handle to your port |

###### Examples
```MATLAB
fscc = mfscc();
...

fscc.disable_append_status(h);
```


### Additional Resources
- Complete example: [`examples/append_status.m`](../examples/append_status.m)
- Implementation details: [`mfscc.m`](../mfscc.m)
