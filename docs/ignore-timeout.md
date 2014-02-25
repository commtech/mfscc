# Ignore Timeout

###### Support
| Code           | Version
| -------------- | --------
| `fscc-windows` | `v2.0.0`
| `fscc-linux`   | `v2.0.0`
| `pyfscc`       | `v1.0.0`
| `mfscc`        | `v1.0.0`

## Property
```python
ignore_timeout = property(...)
```


## Get
###### Examples
```MATLAB
fscc = mfscc();
...

status = fscc.get_ignore_timeout(p);
```


## Enable
###### Examples
```MATLAB
fscc = mfscc();
...

fscc.enable_ignore_timeout(p);
```


## Disable
###### Examples
```python
fscc = mfscc();
...

fscc.disable_ignore_timeout(p);
```


### Additional Resources
- Complete example: [`examples\ignore-timeout.m`](https://github.com/commtech/mfscc/blob/master/examples/ignore-timeout.m)
- Implemenation details: [`mfscc.m`](https://github.com/commtech/mfscc/blob/master/mfscc.m)
