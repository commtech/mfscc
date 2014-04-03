# Append Timestamp
###### Windows
[`KeQuerySystemTime`](http://msdn.microsoft.com/en-us/library/windows/hardware/ff553068.aspx) is used to acquire the timestamp upon complete reception of a frame.

###### Linux
[`do_gettimeofday`](http://www.fsl.cs.sunysb.edu/kernel-api/re29.html) is used to acquire the timestamp upon complete reception of a frame.

_We will be moving to 
[`getnstimeofday`](http://www.gnugeneration.com/books/linux/2.6.20/kernl-api/re32.html) in the 3.0 driver series._


###### Support
| Code | Version |
| ---- | ------- |
| `fscc-windows` | `v2.4.0` |
| `fscc-linux` | `v2.4.0` |
| `mfscc` | `v1.0.0` |


## Get
```MATLAB
int fscc.get_append_timestamp(h)
```

| Parameter | Description |
| --------- | ----------- |
| `h` | The handle to your port |

| Output |
|------- |
| The current append timestamp value |

###### Examples
```MATLAB
fscc = mfscc();
...

status = fscc.get_append_timeout(h);
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

fscc.enable_append_timestamp(h);
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

fscc.disable_append_timestamp(h);
```


### Additional Resources
- Complete example: [`examples/append_timestamp.m`](../examples/append_timestamp.m)
- Implementation details: [`mfscc.m`](../mfscc.m)
