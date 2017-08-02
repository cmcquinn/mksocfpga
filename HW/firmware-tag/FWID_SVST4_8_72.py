from machinetalk.protobuf.firmware_pb2 import Firmware, Connector
from util import get_git_revision_short_hash, get_build_url


def gen_fwid(*args,**kwargs):
    # construct the descriptor object
    fw  = Firmware()
    fw.build_sha = get_git_revision_short_hash()
    fw.comment = get_build_url()

    fw.fpga_part_number = "7z020"
    fw.num_leds = 5
    fw.board_name = "Snickerdoodle black"

    c = fw.connector.add()
    c.name = "GPIO0.P2"
    c.pins = 17

    c = fw.connector.add()
    c.name = "GPIO0.P3"
    c.pins = 17

    c = fw.connector.add()
    c.name = "GPIO1.P2"
    c.pins = 17

    c = fw.connector.add()
    c.name = "GPIO1.P3"
    c.pins = 17

    return fw
