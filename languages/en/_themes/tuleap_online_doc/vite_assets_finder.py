# 
# This file is part of the Tuleap Documentation
# Copyright (c) 2025-Present Enalean
#
# Tuleap Documentation is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# Tuleap Documentation is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with Tuleap Documentation. If not, see <https://www.gnu.org/licenses/>.
#

from sphinx.util.osutil import relative_uri
from urllib.parse import quote
import os
import json

def setup_vite_assets_finder(app, pagename, templatename, context, doctree):
    def path_to_theme_assets(asset_name):
        with open(os.path.dirname(os.path.abspath(__file__)) + '/static/assets/.vite/manifest.json') as json_data:
            manifest = json.load(json_data)
        return relative_uri(quote(pagename), '_static/assets/' + manifest['languages/en/_themes/tuleap_online_doc/' + asset_name]['file'])
    context['path_to_theme_assets'] = path_to_theme_assets

def setup(app):
    app.connect("html-page-context", setup_vite_assets_finder)
