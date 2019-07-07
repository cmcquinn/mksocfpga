from machinetalk.protobuf.firmware_pb2 import Firmware, Connector
from util import get_git_revision_short_hash, get_build_url


def gen_fwid(*args,**kwargs):
    # construct the descriptor object
    fw  = Firmware()
    fw.build_sha = get_git_revision_short_hash()
    fw.comment = get_build_url()

    # 1 hm2 LED 
    fw.fpga_part_number = "7z020"
    fw.num_leds = 1
    fw.board_name = "Prototype"

    # 24 pins called out in PIN_PROTOTYPE.vhd
    c = fw.connector.add()
    c.name = "JA1"
    c.pins = 24

    return fw
