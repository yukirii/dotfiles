#!/usr/bin/env python
import os
import sys
import json

SCRIPT_DIR = os.path.abspath(os.path.dirname(__file__))

def install_dotfiles(dotfiles):
    if dotfiles is None : return
    print "Install dotfiles"

    for filename in dotfiles :
        conf = os.path.join(SCRIPT_DIR, 'conf', filename)
        if not os.path.exists(conf) :
            print "Error: Config file '%s' is not found. (%s)" % (filename, conf)
            quit()

        print "==> install %s" % filename
        target = os.path.join(os.getenv('HOME'), '.' + filename)
        if not os.path.exists(target) :
            cmd = 'ln -s %s %s' % (conf, target)
            print cmd
            os.system(cmd)
    print ""


def execute_scripts(scripts):
    if scripts is None : return
    print "Execute scripts"

    for filename in scripts :
        script = os.path.join(SCRIPT_DIR, 'scripts', filename)
        if not os.path.exists(script) :
            print "Error: Script file '%s' is not found. (%s)" % (filename, script)
            quit()

        print "==> execute %s" % filename
        os.system(script)
    print ""


def load_profile(profile):
    filepath = os.path.join(SCRIPT_DIR, 'profiles', profile + '.json')
    if not os.path.exists(filepath) :
        print "Error: Profile '%s' is not found. (%s)" % (profile, filepath)
        quit()
    return json.load(open(filepath))


def install(profile_name):
    profile = load_profile(profile_name)
    if profile.has_key("dotfiles") :
        install_dotfiles(profile.get("dotfiles"))
    if profile.has_key("scripts") :
        execute_scripts(profile.get("scripts"))


def main():
    if len(sys.argv) != 2 :
        print "Usage: %s [PROFILE_NAME]" % sys.argv[0]
        quit()
    install(sys.argv[1])

if __name__ == "__main__":
    main()
