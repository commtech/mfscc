# Memory Cap

###### Support
| Code           | Version
| -------------- | --------
| `fscc-windows` | `v2.0.0` 
| `fscc-linux`   | `v2.0.0` 
| `pyfscc`       | `v1.0.0`
| `mfscc`        | `v1.0.0`


## Property
```python
memory_cap = property(...)
```


## Get
###### Examples
```python
fscc = mfscc();
...

[mem_input, mem_output] = fscc.get_memory_cap(p);
```


## Set
###### Examples
```python
fscc = mfscc();
...
mem_input = 1000000;
mem_output = 2000000;
fscc.set_memory_cap(p, mem_input, mem_output);
```


### Additional Resources
- Complete example: [`examples\memory-cap.m`](https://github.com/commtech/mfscc/blob/master/examples/memory-cap.m)
- Implemenation details: [`mfscc.m`](https://github.com/commtech/mfscc/blob/master/mfscc.m)
