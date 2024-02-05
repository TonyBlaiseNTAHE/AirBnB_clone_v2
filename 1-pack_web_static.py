#!/usr/bin/python3

"""
fabric script that generate a .tgz archive
"""

from datetime import datetime
from fabric.api import *


def do_pack():
    """ function that create an archive file"""
    # creating the name of the archive
    time = datetime.now()
    archive_name = 'web_static_' + time.strftime("%Y%m%d%H%M%S") + '.' + 'tgz'
    # creating a local folder to store the archives
    local('mkdir -p versions')
    archive = local('tar -cvzf versions/{} web_static'.format(archive_name))

    if archive_name is None:
        return None
    else:
        return archive
