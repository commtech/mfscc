fscc = mfscc();
p = fscc.connect(0);

fscc.disconnect(p);

if __name__ == '__main__':
    p = fscc.Port(0)

    # Tin interrupt
    print(hex(p.track_interrupts(0x00000400, 1000)))
