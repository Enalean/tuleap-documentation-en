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
                scroll: resolve(__dirname, "languages/en/_themes/tuleap_online_doc/js/scroll.js"),
                nav: resolve(__dirname, "languages/en/_themes/tuleap_online_doc/js/nav.js"),
                theme: resolve(__dirname, "languages/en/_themes/tuleap_online_doc/js/theme.js"),
                "style": resolve(__dirname, "languages/en/_themes/tuleap_online_doc/style/main.scss"),
            },
        },
        outDir: resolve(__dirname, "languages/en/_themes/tuleap_online_doc/static/assets/"),
        assetsDir: "",
        manifest: true,
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
