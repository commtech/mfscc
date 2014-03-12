# Connect

Opening a handle using this API will only give you access to the synchronous functionality of the card. You will need to use the COM ports if you would like to use the asynchronous functionality.

###### Driver Support
| Code | Version |
| ---- | ------- |
| `fscc-windows` | `v2.0.0` |
| `fscc-linux` | `v2.0.0` |
| `mfscc` | `v1.0.0` |


## Connect
```MATLAB
h = fscc.connect(port_num)
```

| Parameter | Description |
| --------- | ----------- |
| `port_num` | The port number you would like to connect to |

| Output |
|------- |
| The handle to your port |

| Exception | Cause |
| --------- | ----- |
| `FSCC:PortNotFound` | Port not found |
| `FSCC:InvalidAccess` | Insufficient permissions |

###### Examples
```MATLAB
fscc = mfscc();
...

h = fscc.connect(0);
```


### Additional Resources
- Complete example: [`examples/tutorial.m`](../examples/tutorial.m)
- Implementation details: [`mfscc.m`](../mfscc.m)
