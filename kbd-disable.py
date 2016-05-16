#!/usr/bin/python

import sh
import re
import json
from os.path import expanduser

line = sh.grep(sh.xinput('list'), "AT Translated Set 2 keyboard")

matches=re.match("^.*id=(\d+).*\((\d+)\).*$", line.__str__())

if matches:
    kbd_id, kbd_group = matches.groups()

    sh.xinput("float", kbd_id)

    with open(expanduser("~/.kbd-xinput"), 'w') as outfile:
        json.dump({"kbd_id" : kbd_id, "kbd_group" : kbd_group}, outfile)

    print "Disabled kbd: ", kbd_id, kbd_group

else:
    with open(expanduser("~/.kbd-xinput"), 'r') as conffile:
        conf = json.load(conffile)
        sh.xinput("reattach", conf['kbd_id'], conf['kbd_group'])
        print "Reattached kbd to ",  conf['kbd_id'], conf['kbd_group']
