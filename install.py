#!/usr/bin/env python

import os
import sys
import json

SCRIPT_DIR = os.path.abspath(os.path.dirname(__file__))
COLORS = {
    'red' : '\x1b[31m',
    'blue' : '\x1b[34m',
    'yellow' : '\x1b[33m',
    'green' : '\x1b[32m',
    'purple' : '\x1b[35m',
    'clear' : '\x1b[0m'
}

def colored_print(name, string):
    if not COLORS.has_key(name) : raise Exception("invalid color name")
    print COLORS[name] + string + COLORS['clear']


def install_dotfiles(dotfiles):
    if dotfiles is None : return
    colored_print("green", "Install dotfiles")

    for filename in dotfiles :
        conf = os.path.join(SCRIPT_DIR, 'conf', filename)
        if not os.path.exists(conf) :
            print "Error: Config file '%s' is not found. (%s)" % (filename, conf)
            quit()

        colored_print("yellow", "==> install %s" % filename)
        target = os.path.join(os.getenv('HOME'), '.' + filename)
        if not os.path.exists(target) :
            cmd = 'ln -s %s %s' % (conf, target)
            print cmd
            os.system(cmd)


def execute_scripts(scripts):
    if scripts is None : return
    colored_print("green", "Execute scripts")

    for filename in scripts :
        script = os.path.join(SCRIPT_DIR, 'scripts', filename)
        if not os.path.exists(script) :
            print "Error: Script file '%s' is not found. (%s)" % (filename, script)
            quit()

        colored_print("yellow", "==> execute %s" % filename)
        os.system(script)


def load_profile(profile):
    filepath = os.path.join(SCRIPT_DIR, 'profiles', profile + '.json')
    if not os.path.exists(filepath) :
        print "Error: Profile '%s' is not found. (%s)" % (profile, filepath)
        quit()
    return json.load(open(filepath))


def main():
    if len(sys.argv) != 2 :
        print "Usage: %s [PROFILE_NAME]\n" % sys.argv[0]
        print "PROFILES :"
        for profile in os.listdir(os.path.join(SCRIPT_DIR, 'profiles')):
            print "- %s" % profile.replace('.json', '')
        quit()

    profile = load_profile(sys.argv[1])

    if profile.has_key("dotfiles") :
        install_dotfiles(profile.get("dotfiles"))
    if profile.has_key("scripts") :
        execute_scripts(profile.get("scripts"))


if __name__ == "__main__":
    main()
