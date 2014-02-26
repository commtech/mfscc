# Ignore Timeout

###### Support
| Code           | Version
| -------------- | --------
| `fscc-windows` | `v2.0.0`
| `fscc-linux`   | `v2.0.0`
| `pyfscc`       | `v1.0.0`
| `mfscc`        | `v1.0.0`

## Get
```int status = fscc.get_ignore_timeout(fscc_handle p)```

| Parameter      | Type          | Description
| -------------- | ------------- | ------------------------
| `p`            | `fscc_handle` | The handle to your port

| Output        | Value
|-------------- | --------------------------
| `status`      | Whether ignore timeout is enabled(1) or disabled(0)

###### Examples
```MATLAB
fscc = mfscc();
...

status = fscc.get_ignore_timeout(p);
```


## Enable
```fscc.enable_append_timestamp(fscc_handle p)```

| Parameter      | Type          | Description
| -------------- | ------------- | ------------------------
| `p`            | `fscc_handle` | The handle to your port

###### Examples
```MATLAB
fscc = mfscc();
...

fscc.enable_ignore_timeout(p);
```


## Disable
```fscc.disable_append_timestamp(fscc_handle p)```

| Parameter      | Type          | Description
| -------------- | ------------- | ------------------------
| `p`            | `fscc_handle` | The handle to your port

###### Examples
```MATLAB
fscc = mfscc();
...

fscc.disable_ignore_timeout(p);
```


### Additional Resources
- Complete example: [`examples\ignore-timeout.m`](https://github.com/commtech/mfscc/blob/master/examples/ignore-timeout.m)
- Implemenation details: [`mfscc.m`](https://github.com/commtech/mfscc/blob/master/mfscc.m)
