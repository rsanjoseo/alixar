define("ace/snippets/jsx", ["require", "exports", "module"], function (require, exports, module) {
    "use strict";

    exports.snippetText = undefined;
    exports.scope = "jsx";

});
(function () {
    window.require(["ace/snippets/jsx"], function (m) {
        if (typeof module == "object" && typeof exports == "object" && module) {
            module.exports = m;
        }
    });
})();
            