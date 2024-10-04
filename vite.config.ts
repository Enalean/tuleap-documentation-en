import { resolve } from "node:path";
import process from "node:process";
import { defineConfig } from "vite";
import { NodePackageImporter } from "sass";

export default defineConfig({
    base: "/_static/assets/",
    build: {
        reportCompressedSize: false,
        rollupOptions: {
            input: {
                scroll: resolve(__dirname, "languages/en/_themes/tuleap_org/js/scroll.js"),
                nav: resolve(__dirname, "languages/en/_themes/tuleap_org/js/nav.js"),
                theme: resolve(__dirname, "languages/en/_themes/tuleap_org/js/theme.js"),
                style: resolve(__dirname, "languages/en/_themes/tuleap_org/style/main.scss"),
            },
            output: {
                entryFileNames: "[name].js",
                chunkFileNames: "[name].js",
                assetFileNames: "[name].[ext]"
            }
        },
        outDir: resolve(__dirname, "languages/en/_themes/tuleap_org/static/assets/"),
        assetsDir: "",
    },
    css: {
        preprocessorOptions: {
            scss: {
                api: "modern",
                importers: [new NodePackageImporter(process.cwd())]
            }
        }
    },
});
