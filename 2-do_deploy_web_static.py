#!/usr/bin/python3
"""
fabric script that distributes an archive to web servers
"""
from os import environ
from fabric.api import *
import os
env.hosts = ['54.224.47.171', '100.26.157.231']



def do_deploy(archive_path):
    """ function that deploy archive file to servers"""
    if not os.path.exists(archive_path):
        return False
    try:
        file_ext = archive_path.split("/")[-1]
        file = file_ext.split('.')[0]
        path = '/data/web_static/releases/'
        put(archive_path, '/tmp/')
        run('mkdir -p {}{}'.format(path, file))
        run('tar -xzf /tmp/{} -C {}/{}/'.format(file_ext, path, file))
        run('rm /tmp/{}'.format(file_ext))
        run('mv {0}{1}/web_static/* {0}{1}/'.format(path, file))
        run('rm -rf {}{}/web_static'.format(path, file))
        run('rm -rf /data/web_static/current')
        run('ln -s {}{}/ /data/web_static/current'.format(path, file_ext))
        return True
    except:
        return True
