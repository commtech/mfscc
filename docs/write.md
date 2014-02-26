# Write


###### Driver Support
| Code           | Version
| -------------- | --------
| `fscc-windows` | `v2.0.0` 
| `fscc-linux`   | `v2.0.0` 
| `pyfscc`       | `v1.0.0`
| `mfscc`        | `v1.0.0`


## Write
```fscc.write(fscc_handle p, string data)```

| Parameter      | Type             | Description
| -------------- | ---------------- | -------------------------------------------
| `p`            | `fscc_handle`    | The handle to your port
| `data`         | `string`         | The string you would like to write

| Exception             | Cause
| --------------------- | ----------------------------------------------------
| `FSCC:BufferTooSmall` | The write size exceeds the output memory usage cap
| `FSCC:Timeout`        | Command timed out (missing clock)
| `FSCC:IncorrectMode`  | Using the synchronous port while in asynchronous mode

###### Examples
```MATLAB
fscc = mfscc();
...

fscc.write(p, 'Hello world!');
```


### Additional Resources
- Complete example: [`examples\tutorial.m`](https://github.com/commtech/mfscc/blob/master/examples/tutorial.m)
- Implemenation details: [`fscc.m`](https://github.com/commtech/mfscc/blob/master/mfscc.m)
