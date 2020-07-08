#!/usr/bin/env python3
# lifted from https://www-asim.lip6.fr/svn/dsx/dsx/trunk/dsx/lib/python/bintools/mif.py

__all__ = ['create']

import struct

def emit_mif_internal(fd, data, width = 4, format='>L'):
    addr = 0
    while data:
        word = data[:4]
        data = data[4:]
        if len(word) < 4:
            word = word + b"\x00"*(4-len(word))
        wval, = struct.unpack(format, word)
        print('  %04x : %08x;'%( addr, wval ), file=fd)
        addr += 1
    return addr

def create(fd, width, depth, data, format='>L'):
    assert width%8 == 0, ValueError("width must be *8")
    wdepth = depth / (width / 8)
    if wdepth*(width / 8) < depth:
        wdepth += 1
    print("WIDTH=%d;" % width, file=fd)
    print("DEPTH=%d;" % wdepth, file=fd)
    print(file=fd)
    print("ADDRESS_RADIX=HEX;", file=fd)
    print("DATA_RADIX=HEX;", file=fd)
    print(file=fd)
    print("CONTENT BEGIN", file=fd)
    end_addr = emit_mif_internal(fd, data, format=format)
    if end_addr < depth/(width/8)-1:
        print("  [%04x .. %04x] : %08x;" % (end_addr, depth/(width/8)-1, 0), file=fd)
    print("END;", file=fd)


def _main():
    import sys
    create(sys.stdout,
           int(sys.argv[2]),
           int(sys.argv[3]),
           open(sys.argv[1]).read())

if __name__ == '__main__':
    _main()
    
