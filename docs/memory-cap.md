# Memory Cap

###### Support
| Code           | Version
| -------------- | --------
| `fscc-windows` | `v2.0.0` 
| `fscc-linux`   | `v2.0.0` 
| `pyfscc`       | `v1.0.0`
| `mfscc`        | `v1.0.0`

## Get
```[int input, int output] = fscc.get_memory_cap(fscc_handle p)```

| Parameter      | Type          | Description
| -------------- | ------------- | ------------------------
| `p`            | `fscc_handle` | The handle to your port

| Output         | Value
|--------------- | --------------------------
| `input`        | Current input memory cap
| `output`       | Current output memory cap

###### Examples
```python
fscc = mfscc();
...

[mem_input, mem_output] = fscc.get_memory_cap(p);
```


## Set
```fscc.get_memory_cap(fscc_handle p, int input, int output)```

| Parameter      | Type          | Description
| -------------- | ------------- | ------------------------------
| `p`            | `fscc_handle` | The handle to your port
| `input`        | `int`         | The desired input memory cap
| `output`       | `int`         | The desired output memory cap

###### Examples
```python
fscc = mfscc();
...
mem_input = 1000000;
mem_output = 2000000;
fscc.set_memory_cap(p, mem_input, mem_output);
```


### Additional Resources
- Complete example: [`examples\memory_cap.m`](https://github.com/commtech/mfscc/blob/master/examples/memory_cap.m)
- Implemenation details: [`mfscc.m`](https://github.com/commtech/mfscc/blob/master/mfscc.m)
