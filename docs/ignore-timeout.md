# Ignore Timeout

###### Support
| Code | Version |
| ---- | ------- |
| `fscc-windows` | `v2.0.0` |
| `fscc-linux` | `v2.0.0` |
| `mfscc` | `v1.0.0` |

## Get
```MATLAB
status = fscc.get_ignore_timeout(h)
```

| Parameter | Description |
| --------- | ----------- |
| `h` | The handle to your port |

| Output |
|------- |
| The current ignore timeout value |

###### Examples
```MATLAB
fscc = mfscc();
...

status = fscc.get_ignore_timeout(h);
```


## Enable
```MATLAB
fscc.enable_append_timestamp(h)
```

| Parameter | Description |
| --------- | ----------- |
| `h` | The handle to your port |

###### Examples
```MATLAB
fscc = mfscc();
...

fscc.enable_ignore_timeout(h);
```


## Disable
```MATLAB
fscc.disable_append_timestamp(h)
```

| Parameter | Description |
| --------- | ----------- |
| `h` | The handle to your port |

###### Examples
```MATLAB
fscc = mfscc();
...

fscc.disable_ignore_timeout(h);
```


### Additional Resources
- Complete example: [`examples/ignore_timeout.m`](../examples/ignore_timeout.m)
- Implementation details: [`mfscc.m`](../mfscc.m)
