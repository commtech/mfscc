# Clock Frequency

The FSCC device has a programmable clock that can be set anywhere from 20 KHz to 200 MHz. However, this is not the full operational range of an FSCC port, only the range that the on-board clock can be set to.

Using one of the synchronous modes you can only receive data consistently up to 30 MHz (when you are using an external clock). If you are transmitting data using an internal clock, you can safely receive data consistently up to 50 MHz.

Lower clock rates (less than 1 MHz for example) can take a long time for the frequency generator to finish. If you run into this situation we recommend using a larger frequency and then dividing it down to your desired baud rate using the `BGR` register.

_If you are receiving timeout errors when using slow data rates you can bypass the safety checks by using the [`ignore_timeout`](https://github.com/commtech/mfscc/blob/master/docs/ignore-timeout.md)
option._

###### Driver Support
| Code | Version |
| ---- | ------- |
| `fscc-windows` | `v2.0.0` |
| `fscc-linux` | `v2.0.0` |
| `mfscc` | `v1.0.0` |

## Set
```MATLAB
fscc.set_clock_frequency(h, frequency)
```

| Parameter | Description |
| --------- | ----------- |
| `h` | The handle to your port |
| `frequency` | Desired clock frequency (15,000 to 270,000,000) |

| Exception | Cause |
| --------- | ----- |
| `FSCC:InvalidParameter` | Clock frequency is out of range (15,000 to 270,000,000) |

###### Examples
```MATLAB
fscc = mfscc();
...

fscc.set_clock_frequency(p, 18432000); % 18.432 MHz
```


### Additional Resources
- Complete example: [`examples/clock_frequency.m`](../examples/clock_frequency.m)
- Implementation details: [`mfscc.m`](../mfscc.m)
