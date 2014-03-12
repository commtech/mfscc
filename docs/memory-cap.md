# Memory Cap

###### Support
| Code | Version |
| ---- | ------- |
| `fscc-windows` | `v2.0.0` |
| `fscc-linux` | `v2.0.0` |
| `mfscc` | `v1.0.0` |

## Get
```MATLAB
[input, output] = fscc.get_memory_cap(h)
```

| Parameter | Description |
| --------- | ----------- |
| `h` | The handle to your port |

| Output | Description |
|------- | ----------- |
| `input` | Current input memory cap |
| `output` | Current output memory cap |

###### Examples
```MATLAB
fscc = mfscc();
...

[input, output] = fscc.get_memory_cap(h);
```


## Set
```MATLAB
fscc.set_memory_cap(h, input, output)
```

| Parameter | Description |
| --------- | ----------- |
| `h` | The handle to your port |
| `input` | The desired input memory cap |
| `output`| The desired output memory cap |

###### Examples
```MATLAB
fscc = mfscc();
...

fscc.set_memory_cap(p, 1000000, 1000000);
```


### Additional Resources
- Complete example: [`examples/memory_cap.m`](../examples/memory_cap.m)
- Implementation details: [`mfscc.m`](../mfscc.m)
