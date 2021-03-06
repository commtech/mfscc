# Purge
Between the hardware FIFO and the driver's software buffers there are multiple places data could be stored, excluding your application code. If you ever need to clear this data and start fresh, there are a couple of methods you can use.

_A `purge()` (receive side) is required after changing the `MODE` bits in the `CCR0` register. If you need to change the `MODE` bits but don't have a clock present, change the `CM` bits to `0x7` temporarily. This will give you an internal clock to switch modes. You can then switch to your desired `CM` now that your `MODE` is locked in._

###### Driver Support
| Code | Version |
| ---- | ------- |
| `fscc-windows` | `v2.0.0` |
| `fscc-linux` | `v2.0.0` |
| `mfscc` | `v1.0.0` |


```MATLAB
fscc.purge(h, tx, rx)
```

| Parameter | Description |
| --------- | ----------- |
| `h` | The handle to your port |
| `tx` | Whether to purge the transmit data
| `rx` | Whether to purge the receive data

| Exception | Cause |
| --------- | ----- |
| `FSCC:Timeout` | Command timed out (missing clock) |

###### Examples
Purge both the transmit and receive data.
```MATLAB
fscc = mfscc();
...

fscc.purge(p, true, true);
```

Purge only the transmit data.
```MATLAB
fscc = mfscc();
...

fscc.purge(p, true, false);
```

Purge only the receive data.
```MATLAB
fscc = mfscc();
...

fscc.purge(p, false, true);
```


### Additional Resources
- Complete example: [`examples/purge.m`](../examples/purge.m)
- Implementation details: [`mfscc.m`](../mfscc.m)
