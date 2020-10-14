/*
 * Copyright (c) Enalean, 2019-Present. All Rights Reserved.
 *
 * This file is a part of Tuleap Documentation.
 *
 * Tuleap Documentation is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * Tuleap Documentation is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with Tuleap Documentation. If not, see <http://www.gnu.org/licenses/>.
 */

const path = require("path");
const { CleanWebpackPlugin } = require('clean-webpack-plugin');
const MiniCssExtractPlugin = require("mini-css-extract-plugin");

const { Compilation } = require('webpack');

class MiniCssExtractPluginCleanupJSEmptyChunk {
    apply(compiler) {
        compiler.hooks.compilation.tap(this.constructor.name, compilation => {
            compilation.hooks.processAssets.tapAsync(
                {
                    name: this.constructor.name,
                    stage: Compilation.PROCESS_ASSETS_STAGE_OPTIMIZE_COUNT
                },
                (assets, callback) => {
                    compilation.entrypoints.forEach((entrypoint) => {
                        entrypoint.chunks.forEach((chunk) => {
                            compilation.chunkGraph.getChunkModules(chunk).forEach((module) => {
                                if (module.constructor.name !== "NormalModule" || module.originalSource().source() !== "// extracted by mini-css-extract-plugin\nexport {};") {
                                    return;
                                }

                                chunk.files.forEach((file) => {
                                    if (/\.js$/.test(file)) {
                                        delete assets[file];
                                        chunk.files.delete(file);
                                    }
                                });
                            });
                        });
                    });

                    callback();
                }
            );
        });
    }
}

module.exports = {
    entry: {
        "scroll": "./js/scroll.js",
        "nav": "./js/nav.js",
        "theme": "./js/theme.js",
        "style": "./style/main.scss"
    },
    context: path.resolve(__dirname, "languages/en/_themes/tuleap_org/"),
    output: {
        path: path.resolve(__dirname, "languages/en/_themes/tuleap_org/static/assets"),
        filename: "[name].js",
        publicPath: "/_static/assets/",
    },
    target: ["web", "es5"], // Set as es5 to play nice with IE11...
    module: {
        rules: [
            {
                test: /\.js$/,
                exclude: [/node_modules/],
                use: [
                    {
                        loader: "babel-loader",
                        options: {
                            presets: [
                                [
                                    "@babel/preset-env",
                                    {
                                        "targets": "ie 11, last 2 chrome version, last 2 firefox version, last 2 edge version"
                                    }
                                ]
                            ]
                        }
                    }
                ]
            },
            {
                test: /\.scss$/,
                use: [
                    MiniCssExtractPlugin.loader,
                    "css-loader",
                    {
                        loader: 'sass-loader',
                        options: {
                            implementation: require('sass'),
                        },
                    }
                ]
            },
            {
                test: /(\.(eot|ttf|woff|woff2|svg))$/,
                use: [
                    {
                        loader: "file-loader",
                        options: {
                            name: "css-assets/[name]-[sha256:hash:hex:16].[ext]"
                        }
                    }
                ]
            }
        ]
    },
    plugins: [
        new CleanWebpackPlugin({
            cleanAfterEveryBuildPatterns: ["!css-assets/", "!css-assets/**"]
        }),
        new MiniCssExtractPluginCleanupJSEmptyChunk(),
        new MiniCssExtractPlugin(),
    ]
};