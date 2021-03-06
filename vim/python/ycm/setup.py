# Copyright (C) 2016 YouCompleteMe contributors
#
# This file is part of YouCompleteMe.
#
# YouCompleteMe is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# YouCompleteMe is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with YouCompleteMe.  If not, see <http://www.gnu.org/licenses/>.

from __future__ import unicode_literals
from __future__ import print_function
from __future__ import division
from __future__ import absolute_import
# No imports from `future` because when this is loaded, sys.path hasn't been set
# up yet!

import sys
import os

# Can't import these from paths.py because that uses `future` imports
DIR_OF_CURRENT_SCRIPT = os.path.dirname( os.path.abspath( __file__ ) )
DIR_OF_YCMD = os.path.join( DIR_OF_CURRENT_SCRIPT, '..', '..', 'third_party',
                            'ycmd' )


def SetUpSystemPaths():
  sys.path.insert( 0, os.path.join( DIR_OF_YCMD ) )



def SetUpYCM():
  from ycm import base, paths
  from ycmd import user_options_store, utils
  from ycm.youcompleteme import YouCompleteMe

  base.LoadJsonDefaultsIntoVim()

  user_options_store.SetAll( base.BuildServerConf() )

  popen_args = [ paths.PathToPythonInterpreter(),
                 paths.PathToCheckCoreVersion() ]

  if utils.SafePopen( popen_args ).wait() == 2:
    raise RuntimeError( 'YCM support libs too old, PLEASE RECOMPILE.' )

  return YouCompleteMe( user_options_store.GetAll() )
