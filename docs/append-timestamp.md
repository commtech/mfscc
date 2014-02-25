# Append Timestamp
###### Windows
[`KeQuerySystemTime`](http://msdn.microsoft.com/en-us/library/windows/hardware/ff553068.aspx)
is used to acquire the timestamp upon complete reception of a frame.

###### Linux
[`do_gettimeofday`](http://www.fsl.cs.sunysb.edu/kernel-api/re29.html)
is used to acquire the timestamp upon complete reception of a frame.

_We will be moving to 
[`getnstimeofday`](http://www.gnugeneration.com/books/linux/2.6.20/kernel-api/re32.html)
in the 3.0 driver series._


###### Support
| Code           | Version
| -------------- | --------
| `fscc-windows` | `v2.4.0`
| `fscc-linux`   | `v2.4.0`
| `pyfscc`       | `v2.0.0`
| `mfscc`        | `v1.0.0`


## Property
```python
append_timestamp = property(...)
```


## Get
###### Examples
```MATLAB
fscc = mfscc();
...

status = fscc.get_append_timeout(p);
```


## Enable
###### Examples
```MATLAB
fscc = mfscc();
...

fscc.set_append_status(p, 1);
```


## Disable
###### Examples
```MATLAB
fscc = mfscc();
...

fscc.set_append_status(p, 0);
```


### Additional Resources
- Complete example: [`examples\append-timestamp.m`](https://github.com/commtech/mfscc/blob/master/examples/append-timestamp.m)
- Implemenation details: [`mfscc.m`](https://github.com/commtech/mfscc/blob/master/mfscc.m)
