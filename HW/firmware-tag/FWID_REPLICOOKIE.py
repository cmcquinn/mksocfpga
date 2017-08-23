from machinetalk.protobuf.firmware_pb2 import Firmware, Connector
from util import get_git_revision_short_hash, get_build_url


def gen_fwid(*args,**kwargs):
    # construct the descriptor object
    fw  = Firmware()
    fw.build_sha = get_git_revision_short_hash()
    fw.comment = get_build_url()

    # Of the 5 LEDs on the Snickerdoodle board,
    # 1 is accessable for user applications
    fw.fpga_part_number = "7z020"
    fw.num_leds = 1
    fw.board_name = "Replicookie"

    # The Snickerdoodle black has 5 FPGA connectors,
    # but only 1 of them is used for HM2 stuff
    c = fw.connector.add()
    c.name = "JA.GPIO1"
    c.pins = 40

    return fw
