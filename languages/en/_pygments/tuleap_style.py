def setup(app):
    return

from pygments.style import Style
from pygments.token import *

class TuleapStyle(Style):
    styles = {
        Token: '#282621',           # typo-default-text-color

        Keyword: '#005f90',         # class:'k'  deep-blue-text
        Name: '#6a14a7',            # class:'n'  plum-crazy-text
        Name.Constant: '#945600',   # class:'no' clockwork-orange-text
        Name.Other: '#774a0a',      # class:'nx' teddy-brown-text
        String: '#137900',          # class:'s'  neon-green-text
        Number: '#bf4747',          # class:'m'  coral-pink-text
        Literal: '#525252',         # class:'l'  inca-silver-text

        Comment: '#717171',         # class:'c'  dimmed-color
        Comment.Preproc: '#1b805e', # class:'cp' surf-green-text
        Punctuation: '#717171',     # class:'p'  dimmed-color
    }