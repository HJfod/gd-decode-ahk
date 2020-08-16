try {
    const f = require("fs").readFileSync("./decode-base64/decode-base64.string").toString().split("\n");
    const { inflate } = require("./pako-inflate.js");

    switch (f[0].trim().toLowerCase()) {
        case "base64":      console.log(Buffer.from(f[1].replace(/-/g, "+").replace(/_/g, "/"), "base64").toString()); break;
        case "base64-zlib": console.log(inflate(Buffer.from(f[1].replace(/-/g, "+").replace(/_/g, "/"), "base64"), { to: "string" }).toString()); break;
        case "all":         console.log(inflate(Buffer.from(f[1].split("").map(str => String.fromCharCode(11 ^ str.charCodeAt(0))).join("").replace(/-/g, "+").replace(/_/g, "/"), "base64"), { to: "string" }).toString()); break;
        default:            console.log(f[1]);
    }
} catch(e) {
    console.log(e);
}