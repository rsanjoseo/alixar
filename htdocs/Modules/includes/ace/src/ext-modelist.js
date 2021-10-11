define("ace/ext/modelist", ["require", "exports", "module"], function (require, exports, module) {
    "use strict";

    var modes = [];

    function getModeForPath(path) {
        var mode = modesByName.text;
        var fileName = path.split(/[\/\\]/).pop();
        for (var i = 0; i < modes.length; i++) {
            if (modes[i].supportsFile(fileName)) {
                mode = modes[i];
                break;
            }
        }
        return mode;
    }

    var Mode = function (name, caption, extensions) {
        this.name = name;
        this.caption = caption;
        this.mode = "ace/mode/" + name;
        this.extensions = extensions;
        var re;
        if (/\^/.test(extensions)) {
            re = extensions.replace(/\|(\^)?/g, function (a, b) {
                return "$|" + (b ? "^" : "^.*\\.");
            }) + "$";
        } else {
            re = "^.*\\.(" + extensions + ")$";
        }

        this.extRe = new RegExp(re, "gi");
    };

    Mode.prototype.supportsFile = function (filename) {
        return filename.match(this.extRe);
    };
    var supportedModes = {
        ABAP: ["abap"],
        ABC: ["abc"],
        ActionScript: ["as"],
        ADA: ["ada|adb"],
        Apache_Conf: ["^htaccess|^htgroups|^htpasswd|^conf|htaccess|htgroups|htpasswd"],
        AsciiDoc: ["asciidoc|adoc"],
        ASL: ["dsl|asl"],
        Assembly_x86: ["asm|a"],
        AutoHotKey: ["ahk"],
        Apex: ["apex|cls|trigger|tgr"],
        AQL: ["aql"],
        BatchFile: ["bat|cmd"],
        C_Cpp: ["cpp|c|cc|cxx|h|hh|hpp|ino"],
        C9Search: ["c9search_results"],
        Crystal: ["cr"],
        Cirru: ["cirru|cr"],
        Clojure: ["clj|cljs"],
        Cobol: ["CBL|COB"],
        coffee: ["coffee|cf|cson|^Cakefile"],
        ColdFusion: ["cfm"],
        CSharp: ["cs"],
        Csound_Document: ["csd"],
        Csound_Orchestra: ["orc"],
        Csound_Score: ["sco"],
        CSS: ["css"],
        Curly: ["curly"],
        D: ["d|di"],
        Dart: ["dart"],
        Diff: ["diff|patch"],
        Dockerfile: ["^Dockerfile"],
        Dot: ["dot"],
        Drools: ["drl"],
        Edifact: ["edi"],
        Eiffel: ["e|ge"],
        EJS: ["ejs"],
        Elixir: ["ex|exs"],
        Elm: ["elm"],
        Erlang: ["erl|hrl"],
        Forth: ["frt|fs|ldr|fth|4th"],
        Fortran: ["f|f90"],
        FSharp: ["fsi|fs|ml|mli|fsx|fsscript"],
        FSL: ["fsl"],
        FTL: ["ftl"],
        Gcode: ["gcode"],
        Gherkin: ["feature"],
        Gitignore: ["^.gitignore"],
        Glsl: ["glsl|frag|vert"],
        Gobstones: ["gbs"],
        golang: ["go"],
        GraphQLSchema: ["gql"],
        Groovy: ["groovy"],
        HAML: ["haml"],
        Handlebars: ["hbs|handlebars|tpl|mustache"],
        Haskell: ["hs"],
        Haskell_Cabal: ["cabal"],
        haXe: ["hx"],
        Hjson: ["hjson"],
        HTML: ["html|htm|xhtml|vue|we|wpy"],
        HTML_Elixir: ["eex|html.eex"],
        HTML_Ruby: ["erb|rhtml|html.erb"],
        INI: ["ini|conf|cfg|prefs"],
        Io: ["io"],
        Jack: ["jack"],
        Jade: ["jade|pug"],
        Java: ["java"],
        JavaScript: ["js|jsm|jsx"],
        JSON5: ["json5"],
        JSON: ["json"],
        JSONiq: ["jq"],
        JSP: ["jsp"],
        JSSM: ["jssm|jssm_state"],
        JSX: ["jsx"],
        Julia: ["jl"],
        Kotlin: ["kt|kts"],
        LaTeX: ["tex|latex|ltx|bib"],
        LESS: ["less"],
        Liquid: ["liquid"],
        Lisp: ["lisp"],
        LiveScript: ["ls"],
        LogiQL: ["logic|lql"],
        LSL: ["lsl"],
        Lua: ["lua"],
        LuaPage: ["lp"],
        Lucene: ["lucene"],
        Makefile: ["^Makefile|^GNUmakefile|^makefile|^OCamlMakefile|make"],
        Markdown: ["md|markdown"],
        Mask: ["mask"],
        MATLAB: ["matlab"],
        Maze: ["mz"],
        MEL: ["mel"],
        MIXAL: ["mixal"],
        MUSHCode: ["mc|mush"],
        MySQL: ["mysql"],
        Nginx: ["nginx|conf"],
        Nix: ["nix"],
        Nim: ["nim"],
        NSIS: ["nsi|nsh"],
        Nunjucks: ["nunjucks|nunjs|nj|njk"],
        ObjectiveC: ["m|mm"],
        OCaml: ["ml|mli"],
        Pascal: ["pas|p"],
        Perl: ["pl|pm"],
        Perl6: ["p6|pl6|pm6"],
        pgSQL: ["pgsql"],
        PHP_Laravel_blade: ["blade.php"],
        PHP: ["php|inc|phtml|shtml|php3|php4|php5|phps|phpt|aw|ctp|module"],
        Puppet: ["epp|pp"],
        Pig: ["pig"],
        Powershell: ["ps1"],
        Praat: ["praat|praatscript|psc|proc"],
        Prolog: ["plg|prolog"],
        Properties: ["properties"],
        Protobuf: ["proto"],
        Python: ["py"],
        R: ["r"],
        Razor: ["cshtml|asp"],
        RDoc: ["Rd"],
        Red: ["red|reds"],
        RHTML: ["Rhtml"],
        RST: ["rst"],
        Ruby: ["rb|ru|gemspec|rake|^Guardfile|^Rakefile|^Gemfile"],
        Rust: ["rs"],
        SASS: ["sass"],
        SCAD: ["scad"],
        Scala: ["scala|sbt"],
        Scheme: ["scm|sm|rkt|oak|scheme"],
        SCSS: ["scss"],
        SH: ["sh|bash|^.bashrc"],
        SJS: ["sjs"],
        Slim: ["slim|skim"],
        Smarty: ["smarty|tpl"],
        snippets: ["snippets"],
        Soy_Template: ["soy"],
        Space: ["space"],
        SQL: ["sql"],
        SQLServer: ["sqlserver"],
        Stylus: ["styl|stylus"],
        SVG: ["svg"],
        Swift: ["swift"],
        Tcl: ["tcl"],
        Terraform: ["tf", "tfvars", "terragrunt"],
        Tex: ["tex"],
        Text: ["txt"],
        Textile: ["textile"],
        Toml: ["toml"],
        TSX: ["tsx"],
        Twig: ["latte|twig|swig"],
        Typescript: ["ts|typescript|str"],
        Vala: ["vala"],
        VBScript: ["vbs|vb"],
        Velocity: ["vm"],
        Verilog: ["v|vh|sv|svh"],
        VHDL: ["vhd|vhdl"],
        Visualforce: ["vfp|component|page"],
        Wollok: ["wlk|wpgm|wtest"],
        XML: ["xml|rdf|rss|wsdl|xslt|atom|mathml|mml|xul|xbl|xaml"],
        XQuery: ["xq"],
        YAML: ["yaml|yml"],
        Zeek: ["zeek|bro"],
        Django: ["html"]
    };

    var nameOverrides = {
        ObjectiveC: "Objective-C",
        CSharp: "C#",
        golang: "Go",
        C_Cpp: "C and C++",
        Csound_Document: "Csound Document",
        Csound_Orchestra: "Csound",
        Csound_Score: "Csound Score",
        coffee: "CoffeeScript",
        HTML_Ruby: "HTML (Ruby)",
        HTML_Elixir: "HTML (Elixir)",
        FTL: "FreeMarker",
        PHP_Laravel_blade: "PHP (Blade Template)",
        Perl6: "Perl 6",
        AutoHotKey: "AutoHotkey / AutoIt"
    };
    var modesByName = {};
    for (var name in supportedModes) {
        var data = supportedModes[name];
        var displayName = (nameOverrides[name] || name).replace(/_/g, " ");
        var filename = name.toLowerCase();
        var mode = new Mode(filename, displayName, data[0]);
        modesByName[filename] = mode;
        modes.push(mode);
    }

    module.exports = {
        getModeForPath: getModeForPath,
        modes: modes,
        modesByName: modesByName
    };

});
(function () {
    window.require(["ace/ext/modelist"], function (m) {
        if (typeof module == "object" && typeof exports == "object" && module) {
            module.exports = m;
        }
    });
})();
            