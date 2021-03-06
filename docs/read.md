# Read
The `size` argument of the various read functions means different things depending on the mode you are using.

In a frame based mode the `size` argument specifies the maximum frame `size` to return. If the next queued frame is larger than the size you specified the error `FSCC_BUFFER_TOO_SMALL` is returned and the data will remain waiting for a read of a larger value. If a `size` is specified that is larger than the length of multiple frames in queue, you will still only receive one frame per read call.

In streaming mode (no frame termination) the `size` argument specifies the maximum amount of data to return. If there are 100 bytes of streaming data in the card and you read with a `size` of 50, you will receive 50 bytes. If you do a read of 200 bytes, you will receive the 100 bytes available.

Frame based data and streaming data are kept separate within the driver. To understand what this means, first imagine the following scenario. You are in a frame based mode and receive a couple of frames. You then switch to streaming mode and receive a stream of data. When calling read you will receive the the streaming data until you switch back into a frame based mode and do a read.

###### Driver Support
| Code | Version |
| ---- | ------- |
| `fscc-windows` | `v2.0.0` |
| `fscc-linux` | `v2.0.0` |
| `mfscc` | `v1.0.0` |


## Read
```MATLAB
[data, bytes_read] = fscc.read(h, timeout, size)
```

| Parameter | Default | Description |
| --------- | ------- | ----------- |
| `h` | | The handle to your port |
| `timeout` | None | Number of milliseconds to wait for data before timing out |
| `size` | 4096 | The data buffer size |

| Output | Description |
|------- | ----------- |
| `data` | The data buffer to hold incoming data |
| `bytes_read` | How many bytes were returned from the read |

| Exception | Cause |
| --------- | ----- |
| `FSCC:BufferTooSmall` | The buffer size is smaller than the next frame |
| `FSCC:IncorrectMode` | Using the synchronous port while in asynchronous mode |

###### Examples
```MATLAB
fscc = mfscc();
...

[data, bytes_read] = fscc.read(p, 5, 4096);
```


### Additional Resources
- Complete example: [`examples/tutorial.m`](../examples/tutorial.m)
- Implementation details: [`mfscc.m`](../mfscc.m)
