npm init -y
npm install react react-dom

npm install --save-dev @types/react @types/react-dom

npm install --save-dev esbuild

esbuild sass


npm install --save-dev esbuild-sass-plugin

const esbuild = require("esbuild");
const { sassPlugin } = require("esbuild-sass-plugin");

esbuild
    .build({
        entryPoints: ["src/styles/style.css", "src/scripts/script.js"],
        outdir: "dist",
        bundle: true,
        watch: true,
        minify: true,
        plugins: [],
    })
    .then(() => console.log("⚡ Build complete! ⚡"))
    .catch(() => process.exit(1));


npm install --save react-router-dom

provide me some code for front end and back end authentication with jwt 
