def setup(app):
    return

from pygments.lexer import RegexLexer
from pygments.token import *
import re

class TqlLexer(RegexLexer):
    """
    A lexer for TQL (Tuleap Query Language)
    """
    name = 'TQL'
    flags = re.MULTILINE + re.IGNORECASE

    tokens = {
        'root': [
            (r'\s+', Whitespace),
            (r'\/{2}.*', Comment),

            (r"'(?:[^\\]|\\.)*?(?:'|$)", String),
            (r'"(?:[^\\]|\\.)*?(?:"|$)', String),

            (r'/\d+[dwmy]/i', Number),
            (r'\d+(?:\.\d+)?', Number),

            (r'(?:and|from|or|select|where|order\s*by)\b', Keyword),
            (r'(?:artifact|between|by|child|children|covered|covering|from|in|is|linked|myself|not|now|open|parent|to|tracker|type|with|without|linked\s*from|asc|ascending|desc|descending)\b', Name),

            (r'[=<>!+-]+', Operator),
            (r'[()]', Operator),

            (r'@[.\w-]+', Name.Constant),
            (r'[.\w-]+', Literal),

            (r',', Punctuation)
        ],
    }