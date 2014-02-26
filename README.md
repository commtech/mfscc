# MATLAB Library (mfscc)
This README file is best viewed [online](http://github.com/commtech/mfscc/).

## Installing Library

##### Downloading Library
- You can use the pre-built library files that are included with the driver
- Or, you can download the latest library version from
[Github releases](https://github.com/commtech/mfscc/releases).


## Quick Start Guide

Lets get started with a quick programming example for fun.

_This tutorial has already been set up for you at_ 
[`examples/tutorial.m`](https://github.com/commtech/mfscc/tree/master/examples/tutorial.m).

First, create a new MATLAB file (named tutorial.m) with the following code.

```matlab
fscc = mfscc();
p = fscc.connect(0);

fscc.write(p, 'Hello world.');
[data, ~] = fscc.read(p, 100)

fscc.disconnect(p);
```

Now attach the included loopback connector and run the MATLAB code.

You have now transmitted and received an HDLC frame! 


## API Reference

There are likely other configuration options you will need to set up for your 
own program. All of these options are described on their respective documentation page.

- [Connect](https://github.com/commtech/mfscc/blob/master/docs/connect.m)
- [Append Status](https://github.com/commtech/mfscc/blob/master/docs/append-status.m)
- [Append Timestamp](https://github.com/commtech/mfscc/blob/master/docs/append-timestamp.m)
- [Clock Frequency](https://github.com/commtech/mfscc/blob/master/docs/clock-frequency.m)
- [Ignore Timeout](https://github.com/commtech/mfscc/blob/master/docs/ignore-timeout.m)
- [RX Multiple](https://github.com/commtech/mfscc/blob/master/docs/rx-multiple.m)
- [Memory Cap](https://github.com/commtech/mfscc/blob/master/docs/memory-cap.m)
- [Purge](https://github.com/commtech/mfscc/blob/master/docs/purgemmd)
- [Registers](https://github.com/commtech/mfscc/blob/master/docs/registers.m)
- [TX Modifiers](https://github.com/commtech/mfscc/blob/master/docs/tx-modifiersmmd)
- [Track Interrupts](https://github.com/commtech/mfscc/blob/master/docs/track-interrupts.m)
- [Writes](https://github.com/commtech/mfscc/blob/master/docs/write.m)
- [Read](https://github.com/commtech/mfscc/blob/master/docs/read.m)


## Run-time Dependencies
- [MATLAB](http://www.mathworks.com/products/matlab/) (32-bit)
- [cfscc](https://github.com/commtech/cfscc/) (Included)
- Windows compiler
- OS: Windows XP+ & Linux


## API Compatibility
We follow [Semantic Versioning](http://semver.org/) when creating releases.


## License

Copyright (C) 2014 [Commtech, Inc.](http://commtech-fastcom.com)

Licensed under the [GNU General Public License v3](http://www.gnu.org/licenses/gpl.txt).
