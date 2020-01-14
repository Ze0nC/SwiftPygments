import PythonKit

public struct Pygments {
    private static let pygments = Python.import("pygments")
    private static var lexers = Python.import("pygments.lexers")
    private static let formatters = Python.import("pygments.formatters")
    
    /// Swift wrapper for lexers PythonObject
    public struct Lexer {
        public var pythonObject : PythonObject
        public var name: String
        public var alias: [String]
        public var filenames: [String]
        public var mimeTypes: [String]
        
        private init(_ pythonObject: PythonObject, name: String, alias: [String], filenames: [String], mimeTypes: [String]) {
            self.pythonObject = pythonObject
            self.name = name
            self.alias = alias
            self.filenames = filenames
            self.mimeTypes = mimeTypes
        }
        
        public static func named(_ name: String) -> Lexer? {
            switch name {
            case "ABAP", "abap", "text/x-abap": return .aBAP
            case "APL", "apl": return .aPL
            case "ABNF", "abnf", "text/x-abnf": return .abnf
            case "ActionScript", "as", "actionscript", "application/x-actionscript", "text/x-actionscript", "text/actionscript": return .actionScript
            case "Ada", "ada", "ada95", "ada2005", "text/x-ada": return .ada
            case "ADL", "adl": return .adl
            case "Agda", "agda", "text/x-agda": return .agda
            case "Aheui", "aheui": return .aheui
            case "Alloy", "alloy", "text/x-alloy": return .alloy
            case "AmbientTalk", "at", "ambienttalk", "ambienttalk/2", "text/x-ambienttalk": return .ambientTalk
            case "Ampl", "ampl": return .ampl
            case "ANTLR With ActionScript Target", "antlr-as", "antlr-actionscript": return .antlrActionScript
            case "ANTLR With C# Target", "antlr-csharp", "antlr-c#": return .antlrCSharp
            case "ANTLR With CPP Target", "antlr-cpp": return .antlrCpp
            case "ANTLR With Java Target", "antlr-java": return .antlrJava
            case "ANTLR", "antlr": return .antlr
            case "ANTLR With ObjectiveC Target", "antlr-objc": return .antlrObjectiveC
            case "ANTLR With Perl Target", "antlr-perl": return .antlrPerl
            case "ANTLR With Python Target", "antlr-python": return .antlrPython
            case "ANTLR With Ruby Target", "antlr-ruby", "antlr-rb": return .antlrRuby
            case "ApacheConf", "apacheconf", "aconf", "apache", ".htaccess", "apache.conf", "apache2.conf", "text/x-apacheconf": return .apacheConf
            case "AppleScript", "applescript": return .appleScript
            case "Arduino", "arduino", "text/x-arduino": return .arduino
            case "AspectJ", "aspectj", "text/x-aspectj": return .aspectJ
            case "Asymptote", "asy", "asymptote", "text/x-asymptote": return .asymptote
            case "AutoIt", "autoit", "text/x-autoit": return .autoIt
            case "autohotkey", "ahk", "text/x-autohotkey": return .autohotkey
            case "Awk", "awk", "gawk", "mawk", "nawk", "application/x-awk": return .awk
            case "BBCode", "bbcode", "text/x-bbcode": return .bBCode
            case "BC", "bc": return .bC
            case "BST", "bst", "bst-pybtex": return .bST
            case "Base Makefile", "basemake": return .baseMakefile
            case "Bash", "bash", "sh", "ksh", "zsh", "shell", ".bashrc", "bashrc", ".bash_*", "bash_*", "zshrc", ".zshrc", "PKGBUILD", "application/x-sh", "application/x-shellscript": return .bash
            case "Bash Session", "console", "shell-session", "application/x-shell-session", "application/x-sh-session": return .bashSession
            case "Batchfile", "bat", "batch", "dosbatch", "winbatch", "application/x-dos-batch": return .batch
            case "Befunge", "befunge", "application/x-befunge": return .befunge
            case "BibTeX", "bib", "bibtex", "text/x-bibtex": return .bibTeX
            case "BlitzBasic", "blitzbasic", "b3d", "bplus", "text/x-bb": return .blitzBasic
            case "BlitzMax", "blitzmax", "bmax", "text/x-bmx": return .blitzMax
            case "BNF", "bnf", "text/x-bnf": return .bnf
            case "Boo", "boo", "text/x-boo": return .boo
            case "Boogie", "boogie": return .boogie
            case "Brainfuck", "brainfuck", "bf", "application/x-brainfuck": return .brainfuck
            case "Bro", "bro": return .bro
            case "BUGS", "bugs", "winbugs", "openbugs": return .bugs
            case "CAmkES", "camkes", "idl4": return .cAmkES
            case "C", "c", "text/x-chdr", "text/x-csrc": return .c
            case "CMake", "cmake", "CMakeLists.txt", "text/x-cmake": return .cMake
            case "c-objdump", "text/x-c-objdump": return .cObjdump
            case "CPSA", "cpsa": return .cPSA
            case "aspx-cs": return .cSharpAspx
            case "C#", "csharp", "c#", "text/x-csharp": return .cSharp
            case "cADL", "cadl": return .cadl
            case "CapDL", "capdl": return .capDL
            case "Cap'n Proto", "capnp": return .capnProto
            case "Ceylon", "ceylon", "text/x-ceylon": return .ceylon
            case "ChaiScript", "chai", "chaiscript", "text/x-chaiscript", "application/x-chaiscript": return .chaiscript
            case "Chapel", "chapel", "chpl": return .chapel
            case "HTML+Cheetah", "html+cheetah", "html+spitfire", "htmlcheetah", "text/html+cheetah", "text/html+spitfire": return .cheetahHtml
            case "JavaScript+Cheetah", "js+cheetah", "javascript+cheetah", "js+spitfire", "javascript+spitfire", "application/x-javascript+cheetah", "text/x-javascript+cheetah", "text/javascript+cheetah", "application/x-javascript+spitfire", "text/x-javascript+spitfire", "text/javascript+spitfire": return .cheetahJavascript
            case "Cheetah", "cheetah", "spitfire", "application/x-cheetah", "application/x-spitfire": return .cheetah
            case "XML+Cheetah", "xml+cheetah", "xml+spitfire", "application/xml+cheetah", "application/xml+spitfire": return .cheetahXml
            case "Cirru", "cirru", "text/x-cirru": return .cirru
            case "Clay", "clay", "text/x-clay": return .clay
            case "Clean", "clean": return .clean
            case "Clojure", "clojure", "clj", "text/x-clojure", "application/x-clojure": return .clojure
            case "ClojureScript", "clojurescript", "cljs", "text/x-clojurescript", "application/x-clojurescript": return .clojureScript
            case "COBOLFree", "cobolfree": return .cobolFreeformat
            case "COBOL", "cobol", "text/x-cobol": return .cobol
            case "CoffeeScript", "coffee-script", "coffeescript", "coffee", "text/coffeescript": return .coffeeScript
            case "Coldfusion CFC", "cfc": return .coldfusionCFC
            case "Coldfusion HTML", "cfm", "application/x-coldfusion": return .coldfusionHtml
            case "cfstatement", "cfs": return .coldfusion
            case "Common Lisp", "common-lisp", "cl", "lisp", "text/x-common-lisp": return .commonLisp
            case "Component Pascal", "componentpascal", "cp", "text/x-component-pascal": return .componentPascal
            case "Coq", "coq", "text/x-coq": return .coq
            case "C++", "cpp", "c++", "text/x-c++hdr", "text/x-c++src": return .cpp
            case "cpp-objdump", "c++-objdumb", "cxx-objdump", "text/x-cpp-objdump": return .cppObjdump
            case "Crmsh", "crmsh", "pcmk": return .crmsh
            case "Croc", "croc", "text/x-crocsrc": return .croc
            case "Cryptol", "cryptol", "cry", "text/x-cryptol": return .cryptol
            case "Crystal", "cr", "crystal", "text/x-crystal": return .crystal
            case "Csound Document", "csound-document", "csound-csd": return .csoundDocument
            case "Csound Orchestra", "csound", "csound-orc": return .csoundOrchestra
            case "Csound Score", "csound-score", "csound-sco": return .csoundScore
            case "CSS+Django/Jinja", "css+django", "css+jinja", "text/css+django", "text/css+jinja": return .cssDjango
            case "CSS+Ruby", "css+erb", "css+ruby", "text/css+ruby": return .cssErb
            case "CSS+Genshi Text", "css+genshitext", "css+genshi", "text/css+genshi": return .cssGenshi
            case "CSS", "css", "text/css": return .css
            case "CSS+PHP", "css+php", "text/css+php": return .cssPhp
            case "CSS+Smarty", "css+smarty", "text/css+smarty": return .cssSmarty
            case "CUDA", "cuda", "cu", "text/x-cuda": return .cuda
            case "Cypher", "cypher": return .cypher
            case "Cython", "cython", "pyx", "pyrex", "text/x-cython", "application/x-cython": return .cython
            case "D", "d", "text/x-dsrc": return .d
            case "d-objdump", "text/x-d-objdump": return .dObjdump
            case "Darcs Patch", "dpatch": return .darcsPatch
            case "Dart", "dart", "text/x-dart": return .dart
            case "Debian Control file", "control", "debcontrol": return .debianControl
            case "Delphi", "delphi", "pas", "pascal", "objectpascal", "text/x-pascal": return .delphi
            case "dg", "text/x-dg": return .dg
            case "Diff", "diff", "udiff", "text/x-diff", "text/x-patch": return .diff
            case "Django/Jinja", "django", "jinja", "application/x-django-templating", "application/x-jinja": return .django
            case "Docker", "docker", "dockerfile", "Dockerfile", "text/x-dockerfile-config": return .docker
            case "DTD", "dtd", "application/xml-dtd": return .dtd
            case "Duel", "duel", "jbst", "jsonml+bst", "text/x-duel", "text/x-jbst": return .duel
            case "Dylan session", "dylan-console", "dylan-repl", "text/x-dylan-console": return .dylanConsole
            case "Dylan", "dylan", "text/x-dylan": return .dylan
            case "DylanLID", "dylan-lid", "lid", "text/x-dylan-lid": return .dylanLid
            case "ECL", "ecl", "application/x-ecl": return .eCL
            case "eC", "ec", "text/x-echdr", "text/x-ecsrc": return .eC
            case "Earl Grey", "earl-grey", "earlgrey", "eg", "text/x-earl-grey": return .earlGrey
            case "Easytrieve", "easytrieve", "text/x-easytrieve": return .easytrieve
            case "EBNF", "ebnf", "text/x-ebnf": return .ebnf
            case "Eiffel", "eiffel", "text/x-eiffel": return .eiffel
            case "Elixir iex session", "iex", "text/x-elixir-shellsession": return .elixirConsole
            case "Elixir", "elixir", "ex", "exs", "text/x-elixir": return .elixir
            case "Elm", "elm", "text/x-elm": return .elm
            case "EmacsLisp", "emacs", "elisp", "emacs-lisp", "text/x-elisp", "application/x-elisp": return .emacsLisp
            case "ERB", "erb", "application/x-ruby-templating": return .erb
            case "Erlang", "erlang", "text/x-erlang": return .erlang
            case "Erlang erl session", "erl", "text/x-erl-shellsession": return .erlangShell
            case "HTML+Evoque", "html+evoque", "text/html+evoque": return .evoqueHtml
            case "Evoque", "evoque", "application/x-evoque": return .evoque
            case "XML+Evoque", "xml+evoque", "application/xml+evoque": return .evoqueXml
            case "Ezhil", "ezhil", "text/x-ezhil": return .ezhil
            case "FSharp", "fsharp", "text/x-fsharp": return .fSharp
            case "Factor", "factor", "text/x-factor": return .factor
            case "Fancy", "fancy", "fy", "text/x-fancysrc": return .fancy
            case "Fantom", "fan", "application/x-fantom": return .fantom
            case "Felix", "felix", "flx", "text/x-felix": return .felix
            case "Fennel", "fennel", "fnl": return .fennel
            case "Fish", "fish", "fishshell", "application/x-fish": return .fishShell
            case "Flatline", "flatline", "text/x-flatline": return .flatline
            case "Forth", "forth", "application/x-forth": return .forth
            case "FortranFixed", "fortranfixed": return .fortranFixed
            case "Fortran", "fortran", "text/x-fortran": return .fortran
            case "FoxPro", "foxpro", "vfp", "clipper", "xbase": return .foxPro
            case "GAP", "gap": return .gAP
            case "GLSL", "glsl", "text/x-glslsrc": return .gLShader
            case "GAS", "gas", "asm", "text/x-gas": return .gas
            case "Genshi", "genshi", "kid", "xml+genshi", "xml+kid", "application/x-genshi", "application/x-kid": return .genshi
            case "Genshi Text", "genshitext", "application/x-genshi-text", "text/x-genshi": return .genshiText
            case "Gettext Catalog", "pot", "po", "application/x-gettext", "text/x-gettext", "text/gettext": return .gettext
            case "Gherkin", "cucumber", "gherkin", "text/x-gherkin": return .gherkin
            case "Gnuplot", "gnuplot", "text/x-gnuplot": return .gnuplot
            case "Go", "go", "text/x-gosrc": return .go
            case "Golo", "golo": return .golo
            case "GoodData-CL", "gooddata-cl", "text/x-gooddata-cl": return .goodDataCL
            case "Gosu", "gosu", "text/x-gosu": return .gosu
            case "Gosu Template", "gst", "text/x-gosu-template": return .gosuTemplate
            case "Groff", "groff", "nroff", "man", "application/x-troff", "text/troff": return .groff
            case "Groovy", "groovy", "text/x-groovy": return .groovy
            case "HLSL", "hlsl", "text/x-hlsl": return .hLSLShader
            case "Haml", "haml", "text/x-haml": return .haml
            case "HTML+Handlebars", "html+handlebars", "text/html+handlebars", "text/x-handlebars-template": return .handlebarsHtml
            case "Handlebars", "handlebars": return .handlebars
            case "Haskell", "haskell", "hs", "text/x-haskell": return .haskell
            case "Haxe", "hx", "haxe", "hxsl", "text/haxe", "text/x-haxe", "text/x-hx": return .haxe
            case "Hexdump", "hexdump": return .hexdump
            case "HSAIL", "hsail", "hsa", "text/x-hsail": return .hsail
            case "HTML+Django/Jinja", "html+django", "html+jinja", "htmldjango", "text/html+django", "text/html+jinja": return .htmlDjango
            case "HTML+Genshi", "html+genshi", "html+kid", "text/html+genshi": return .htmlGenshi
            case "HTML", "html", "text/html", "application/xhtml+xml": return .html
            case "HTML+PHP", "html+php", "application/x-php", "application/x-httpd-php", "application/x-httpd-php3", "application/x-httpd-php4", "application/x-httpd-php5": return .htmlPhp
            case "HTML+Smarty", "html+smarty", "text/html+smarty": return .htmlSmarty
            case "HTTP", "http": return .http
            case "Hxml", "haxeml", "hxml": return .hxml
            case "Hy", "hylang", "text/x-hy", "application/x-hy": return .hy
            case "Hybris", "hybris", "hy", "text/x-hybris", "application/x-hybris": return .hybris
            case "IDL", "idl", "text/idl": return .iDL
            case "Idris", "idris", "idr", "text/x-idris": return .idris
            case "Igor", "igor", "igorpro", "text/ipf": return .igor
            case "INI", "ini", "cfg", "dosini", "text/x-ini", "text/inf": return .ini
            case "Io", "io", "text/x-iosrc": return .io
            case "Ioke", "ioke", "ik", "text/x-iokesrc": return .ioke
            case "IRC logs", "irc", "text/x-irclog": return .ircLogs
            case "Isabelle", "isabelle", "text/x-isabelle": return .isabelle
            case "J", "j", "text/x-j": return .j
            case "JAGS", "jags": return .jags
            case "Jasmin", "jasmin", "jasminxt": return .jasmin
            case "Java", "java", "text/x-java": return .java
            case "JavaScript+Django/Jinja", "js+django", "javascript+django", "js+jinja", "javascript+jinja", "application/x-javascript+django", "application/x-javascript+jinja", "text/x-javascript+django", "text/x-javascript+jinja", "text/javascript+django", "text/javascript+jinja": return .javascriptDjango
            case "JavaScript+Ruby", "js+erb", "javascript+erb", "js+ruby", "javascript+ruby", "application/x-javascript+ruby", "text/x-javascript+ruby", "text/javascript+ruby": return .javascriptErb
            case "JavaScript+Genshi Text", "js+genshitext", "js+genshi", "javascript+genshitext", "javascript+genshi", "application/x-javascript+genshi", "text/x-javascript+genshi", "text/javascript+genshi": return .javascriptGenshi
            case "JavaScript", "js", "javascript", "application/javascript", "application/x-javascript", "text/x-javascript", "text/javascript": return .javascript
            case "JavaScript+PHP", "js+php", "javascript+php", "application/x-javascript+php", "text/x-javascript+php", "text/javascript+php": return .javascriptPhp
            case "JavaScript+Smarty", "js+smarty", "javascript+smarty", "application/x-javascript+smarty", "text/x-javascript+smarty", "text/javascript+smarty": return .javascriptSmarty
            case "JCL", "jcl", "text/x-jcl": return .jcl
            case "JSGF", "jsgf", "application/jsgf", "application/x-jsgf", "text/jsgf": return .jsgf
            case "JSONBareObject", "json-object", "application/json-object": return .jsonBareObject
            case "JSON-LD", "jsonld", "json-ld", "application/ld+json": return .jsonLd
            case "JSON", "json", "application/json": return .json
            case "Java Server Page", "jsp", "application/x-jsp": return .jsp
            case "Julia console", "jlcon": return .juliaConsole
            case "Julia", "julia", "jl", "text/x-julia", "application/x-julia": return .julia
            case "Juttle", "juttle", "application/juttle", "application/x-juttle", "text/x-juttle", "text/juttle": return .juttle
            case "Kal", "kal", "text/kal", "application/kal": return .kal
            case "Kconfig", "kconfig", "menuconfig", "linux-config", "kernel-config", "external.in*", "standard-modules.in", "text/x-kconfig": return .kconfig
            case "Koka", "koka", "text/x-koka": return .koka
            case "Kotlin", "kotlin", "text/x-kotlin": return .kotlin
            case "LSL", "lsl", "text/x-lsl": return .lSL
            case "CSS+Lasso", "css+lasso", "text/css+lasso": return .lassoCss
            case "HTML+Lasso", "html+lasso", "text/html+lasso", "application/x-httpd-lasso", "application/x-httpd-lasso[89]": return .lassoHtml
            case "JavaScript+Lasso", "js+lasso", "javascript+lasso", "application/x-javascript+lasso", "text/x-javascript+lasso", "text/javascript+lasso": return .lassoJavascript
            case "Lasso", "lasso", "lassoscript", "text/x-lasso": return .lasso
            case "XML+Lasso", "xml+lasso", "application/xml+lasso": return .lassoXml
            case "Lean", "lean", "text/x-lean": return .lean
            case "LessCss", "less", "text/x-less-css": return .lessCss
            case "Lighttpd configuration file", "lighty", "lighttpd", "text/x-lighttpd-conf": return .lighttpdConf
            case "Limbo", "limbo", "text/limbo": return .limbo
            case "liquid": return .liquid
            case "Literate Agda", "lagda", "literate-agda", "text/x-literate-agda": return .literateAgda
            case "Literate Cryptol", "lcry", "literate-cryptol", "lcryptol", "text/x-literate-cryptol": return .literateCryptol
            case "Literate Haskell", "lhs", "literate-haskell", "lhaskell", "text/x-literate-haskell": return .literateHaskell
            case "Literate Idris", "lidr", "literate-idris", "lidris", "text/x-literate-idris": return .literateIdris
            case "LiveScript", "live-script", "livescript", "text/livescript": return .liveScript
            case "LLVM", "llvm", "text/x-llvm": return .llvm
            case "Logos", "logos", "text/x-logos": return .logos
            case "Logtalk", "logtalk", "text/x-logtalk": return .logtalk
            case "Lua", "lua", "text/x-lua", "application/x-lua": return .lua
            case "MOOCode", "moocode", "moo", "text/x-moocode": return .mOOCode
            case "MSDOS Session", "doscon": return .mSDOSSession
            case "Makefile", "make", "makefile", "mf", "bsdmake", "Makefile.*", "GNUmakefile", "text/x-makefile": return .makefile
            case "CSS+Mako", "css+mako", "text/css+mako": return .makoCss
            case "HTML+Mako", "html+mako", "text/html+mako": return .makoHtml
            case "JavaScript+Mako", "js+mako", "javascript+mako", "application/x-javascript+mako", "text/x-javascript+mako", "text/javascript+mako": return .makoJavascript
            case "Mako", "mako", "application/x-mako": return .mako
            case "XML+Mako", "xml+mako", "application/xml+mako": return .makoXml
            case "MAQL", "maql", "text/x-gooddata-maql", "application/x-gooddata-maql": return .maql
            case "markdown", "md", "text/x-markdown": return .markdown
            case "Mask", "mask", "text/x-mask": return .mask
            case "Mason", "mason", "autohandler", "dhandler", "application/x-mason": return .mason
            case "Mathematica", "mathematica", "mma", "nb", "application/mathematica", "application/vnd.wolfram.mathematica", "application/vnd.wolfram.mathematica.package", "application/vnd.wolfram.cdf": return .mathematica
            case "Matlab", "matlab", "text/matlab": return .matlab
            case "Matlab session", "matlabsession": return .matlabSession
            case "MiniD", "minid", "text/x-minidsrc": return .miniD
            case "Modelica", "modelica", "text/x-modelica": return .modelica
            case "MoinMoin/Trac Wiki markup", "trac-wiki", "moin", "text/x-trac-wiki": return .moinWiki
            case "Monkey", "monkey", "text/x-monkey": return .monkey
            case "Monte", "monte": return .monte
            case "MoonScript", "moon", "moonscript", "text/x-moonscript", "application/x-moonscript": return .moonScript
            case "CSS+mozpreproc", "css+mozpreproc": return .mozPreprocCss
            case "mozhashpreproc": return .mozPreprocHash
            case "Javascript+mozpreproc", "javascript+mozpreproc": return .mozPreprocJavascript
            case "mozpercentpreproc": return .mozPreprocPercent
            case "XUL+mozpreproc", "xul+mozpreproc": return .mozPreprocXul
            case "MQL", "mql", "mq4", "mq5", "mql4", "mql5", "text/x-mql": return .mql
            case "Mscgen", "mscgen", "msc": return .mscgen
            case "MuPAD", "mupad": return .muPAD
            case "MXML", "mxml": return .mxml
            case "MySQL", "mysql", "text/x-mysql": return .mySql
            case "CSS+Myghty", "css+myghty", "text/css+myghty": return .myghtyCss
            case "HTML+Myghty", "html+myghty", "text/html+myghty": return .myghtyHtml
            case "JavaScript+Myghty", "js+myghty", "javascript+myghty", "application/x-javascript+myghty", "text/x-javascript+myghty", "text/javascript+mygthy": return .myghtyJavascript
            case "Myghty", "myghty", "autodelegate", "application/x-myghty": return .myghty
            case "XML+Myghty", "xml+myghty", "application/xml+myghty": return .myghtyXml
            case "NCL", "ncl", "text/ncl": return .nCL
            case "NSIS", "nsis", "nsi", "nsh", "text/x-nsis": return .nSIS
            case "NASM", "nasm", "text/x-nasm": return .nasm
            case "objdump-nasm", "text/x-nasm-objdump": return .nasmObjdump
            case "Nemerle", "nemerle", "text/x-nemerle": return .nemerle
            case "nesC", "nesc", "text/x-nescsrc": return .nesC
            case "NewLisp", "newlisp", "text/x-newlisp", "application/x-newlisp": return .newLisp
            case "Newspeak", "newspeak", "text/x-newspeak": return .newspeak
            case "Nginx configuration file", "nginx", "nginx.conf", "text/x-nginx-conf": return .nginxConf
            case "Nimrod", "nim", "nimrod", "text/x-nim": return .nimrod
            case "Nit", "nit": return .nit
            case "Nix", "nixos", "nix", "text/x-nix": return .nix
            case "NuSMV", "nusmv": return .nuSMV
            case "NumPy", "numpy": return .numPy
            case "objdump", "text/x-objdump": return .objdump
            case "Objective-C", "objective-c", "objectivec", "obj-c", "objc", "text/x-objective-c": return .objectiveC
            case "Objective-C++", "objective-c++", "objectivec++", "obj-c++", "objc++", "text/x-objective-c++": return .objectiveCpp
            case "Objective-J", "objective-j", "objectivej", "obj-j", "objj", "text/x-objective-j": return .objectiveJ
            case "OCaml", "ocaml", "text/x-ocaml": return .ocaml
            case "Octave", "octave", "text/octave": return .octave
            case "ODIN", "odin", "text/odin": return .odin
            case "Ooc", "ooc", "text/x-ooc": return .ooc
            case "Opa", "opa", "text/x-opa": return .opa
            case "OpenEdge ABL", "openedge", "abl", "progress", "text/x-openedge", "application/x-openedge": return .openEdge
            case "PacmanConf", "pacmanconf", "pacman.conf": return .pacmanConf
            case "Pan", "pan": return .pan
            case "ParaSail", "parasail", "text/x-parasail": return .paraSail
            case "Pawn", "pawn", "text/x-pawn": return .pawn
            case "Perl", "perl", "pl", "text/x-perl", "application/x-perl": return .perl
            case "PHP", "php", "php3", "php4", "php5", "text/x-php": return .php
            case "Pig", "pig", "text/x-pig": return .pig
            case "Pike", "pike", "text/x-pike": return .pike
            case "PkgConfig", "pkgconfig": return .pkgConfig
            case "PL/pgSQL", "plpgsql", "text/x-plpgsql": return .plPgsql
            case "PostScript", "postscript", "postscr", "application/postscript": return .postScript
            case "PostgreSQL console (psql)", "psql", "postgresql-console", "postgres-console", "text/x-postgresql-psql": return .postgresConsole
            case "PostgreSQL SQL dialect", "postgresql", "postgres", "text/x-postgresql": return .postgres
            case "POVRay", "pov", "text/x-povray": return .povray
            case "PowerShell", "ac", "asnp", "cat", "cd", "chdir", "clc", "clear", "clhy", "cli", "clp", "cls", "clv", "cnsn", "compare", "copy", "cpi", "curl", "cvpa", "dbp", "del", "dir", "dnsn", "ebp", "echo", "epal", "epcsv", "epsn", "erase", "etsn", "exsn", "fc", "fhx", "fl", "foreach", "ft", "fw", "gal", "gbp", "gc", "gci", "gcm", "gcs", "gdr", "ghy", "gi", "gjb", "gl", "gm", "gmo", "gp", "gps", "gpv", "group", "gsn", "gsnp", "gsv", "gu", "gv", "gwmi", "h", "history", "icm", "ipal", "ipcsv", "ipmo", "ipsn", "irm", "ise", "iwmi", "iwr", "kill", "lp", "ls", "measure", "mi", "mount", "move", "mp", "mv", "nal", "ndr", "ni", "nmo", "npssc", "nsn", "nv", "ogv", "oh", "popd", "ps", "pushd", "pwd", "rbp", "rcjb", "rcsn", "rdr", "ren", "ri", "rjb", "rm", "rmdir", "rmo", "rni", "rnp", "rp", "rsn", "rsnp", "rujb", "rv", "rvpa", "rwmi", "sajb", "sal", "saps", "sasv", "sbp", "select", "set", "shcm", "si", "sl", "sleep", "sort", "spjb", "spps", "spsv", "start", "sujb", "swmi", "tee", "trcm", "type", "wget", "where", "wjb", "write", "text/x-powershell": return .powerShell
            case "PowerShell Session", "ps1con": return .powerShellSession
            case "Praat", "praat": return .praat
            case "Prolog", "prolog", "text/x-prolog": return .prolog
            case "Properties", "properties", "jproperties", "text/x-java-properties": return .properties
            case "Protocol Buffer", "protobuf", "proto": return .protoBuf
            case "Pug", "pug", "jade", "text/x-pug", "text/x-jade": return .pug
            case "Puppet", "puppet": return .puppet
            case "PyPy Log", "pypylog", "pypy", "application/x-pypylog": return .pyPyLog
            case "Python console session", "pycon", "text/x-python-doctest": return .pythonConsole
            case "Python", "python", "py", "sage", "SConstruct", "SConscript", "text/x-python", "application/x-python": return .python
            case "Python Traceback", "pytb", "text/x-python-traceback": return .pythonTraceback
            case "QBasic", "qbasic", "basic", "text/basic": return .qBasic
            case "QVTO", "qvto", "qvt": return .qVTo
            case "QML", "qml", "qbs", "application/x-qml", "application/x-qt.qbs+qml": return .qml
            case "RConsole", "rconsole", "rout": return .rConsole
            case "Relax-NG Compact", "rnc", "rng-compact": return .rNCCompact
            case "RPMSpec", "spec", "text/x-rpm-spec": return .rPMSpec
            case "Racket", "racket", "rkt", "text/x-racket", "application/x-racket": return .racket
            case "Ragel in C Host", "ragel-c": return .ragelC
            case "Ragel in CPP Host", "ragel-cpp": return .ragelCpp
            case "Ragel in D Host", "ragel-d": return .ragelD
            case "Embedded Ragel", "ragel-em": return .ragelEmbedded
            case "Ragel in Java Host", "ragel-java": return .ragelJava
            case "Ragel", "ragel": return .ragel
            case "Ragel in Objective C Host", "ragel-objc": return .ragelObjectiveC
            case "Ragel in Ruby Host", "ragel-ruby", "ragel-rb": return .ragelRuby
            case "Raw token data", "raw", "application/x-pygments-tokens": return .rawToken
            case "Rd", "rd", "text/x-r-doc": return .rd
            case "REBOL", "rebol", "text/x-rebol": return .rebol
            case "Red", "red", "red/system", "text/x-red", "text/x-red-system": return .red
            case "Redcode", "redcode": return .redcode
            case "reg", "registry", "text/x-windows-registry": return .regedit
            case "ResourceBundle", "resource", "resourcebundle": return .resource
            case "Rexx", "rexx", "arexx", "text/x-rexx": return .rexx
            case "RHTML", "rhtml", "html+erb", "html+ruby", "text/html+ruby": return .rhtml
            case "Roboconf Graph", "roboconf-graph": return .roboconfGraph
            case "Roboconf Instances", "roboconf-instances": return .roboconfInstances
            case "RobotFramework", "robotframework", "text/x-robotframework": return .robotFramework
            case "RQL", "rql", "text/x-rql": return .rql
            case "RSL", "rsl", "text/rsl": return .rsl
            case "reStructuredText", "rst", "rest", "restructuredtext", "text/x-rst", "text/prs.fallenstein.rst": return .rst
            case "TrafficScript", "rts", "trafficscript": return .rts
            case "Ruby irb session", "rbcon", "irb", "text/x-ruby-shellsession": return .rubyConsole
            case "Ruby", "rb", "ruby", "duby", "Rakefile", "Gemfile", "text/x-ruby", "application/x-ruby": return .ruby
            case "Rust", "rust", "rs", "text/rust": return .rust
            case "SAS", "sas", "text/x-sas", "text/sas", "application/x-sas": return .sAS
            case "S", "splus", "s", "r", ".Rhistory", ".Rprofile", ".Renviron", "text/S-plus", "text/S", "text/x-r-source", "text/x-r", "text/x-R", "text/x-r-history", "text/x-r-profile": return .s
            case "Standard ML", "sml", "text/x-standardml", "application/x-standardml": return .sML
            case "Sass", "sass", "text/x-sass": return .sass
            case "Scala", "scala", "text/x-scala": return .scala
            case "Scaml", "scaml", "text/x-scaml": return .scaml
            case "Scheme", "scheme", "scm", "text/x-scheme", "application/x-scheme": return .scheme
            case "Scilab", "scilab", "text/scilab": return .scilab
            case "SCSS", "scss", "text/x-scss": return .scss
            case "Shen", "shen", "text/x-shen", "application/x-shen": return .shen
            case "Silver", "silver": return .silver
            case "Slim", "slim", "text/x-slim": return .slim
            case "Smali", "smali", "text/smali": return .smali
            case "Smalltalk", "smalltalk", "squeak", "st", "text/x-smalltalk": return .smalltalk
            case "Smarty", "smarty", "application/x-smarty": return .smarty
            case "Snobol", "snobol", "text/x-snobol": return .snobol
            case "Snowball", "snowball": return .snowball
            case "SourcePawn", "sp", "text/x-sourcepawn": return .sourcePawn
            case "Debian Sourcelist", "sourceslist", "sources.list", "debsources": return .sourcesList
            case "SPARQL", "sparql", "application/sparql-query": return .sparql
            case "SQL", "sql", "text/x-sql": return .sql
            case "sqlite3con", "sqlite3", "text/x-sqlite3-console": return .sqliteConsole
            case "SquidConf", "squidconf", "squid.conf", "squid", "text/x-squidconf": return .squidConf
            case "Scalate Server Page", "ssp", "application/x-ssp": return .ssp
            case "Stan", "stan": return .stan
            case "Stata", "stata", "do", "text/x-stata", "text/stata", "application/x-stata": return .stata
            case "SuperCollider", "sc", "supercollider", "application/supercollider", "text/supercollider": return .superCollider
            case "Swift", "swift", "text/x-swift": return .swift
            case "SWIG", "swig", "text/swig": return .swig
            case "systemverilog", "sv", "text/x-systemverilog": return .systemVerilog
            case "TAP", "tap": return .tAP
            case "TASM", "tasm", "text/x-tasm": return .tasm
            case "Tcl", "tcl", "text/x-tcl", "text/x-script.tcl", "application/x-tcl": return .tcl
            case "Tcsh", "tcsh", "csh", "application/x-csh": return .tcsh
            case "Tcsh Session", "tcshcon": return .tcshSession
            case "Tea", "tea", "text/x-tea": return .teaTemplate
            case "Termcap", "termcap", "termcap.src": return .termcap
            case "Terminfo", "terminfo", "terminfo.src": return .terminfo
            case "Terraform", "terraform", "tf", "application/x-tf", "application/x-terraform": return .terraform
            case "TeX", "tex", "latex", "text/x-tex", "text/x-latex": return .tex
            case "Text only", "text", "text/plain": return .text
            case "Thrift", "thrift", "application/x-thrift": return .thrift
            case "Todotxt", "todotxt", "todo.txt", "text/x-todo": return .todotxt
            case "Transact-SQL", "tsql", "t-sql", "text/x-tsql": return .transactSql
            case "Treetop", "treetop": return .treetop
            case "Turtle", "turtle", "text/turtle", "application/x-turtle": return .turtle
            case "HTML+Twig", "html+twig", "text/html+twig": return .twigHtml
            case "Twig", "twig", "application/x-twig": return .twig
            case "TypeScript", "ts", "typescript", "text/x-typescript": return .typeScript
            case "TypoScriptCssData", "typoscriptcssdata": return .typoScriptCssData
            case "TypoScriptHtmlData", "typoscripthtmldata": return .typoScriptHtmlData
            case "TypoScript", "typoscript", "text/x-typoscript": return .typoScript
            case "UrbiScript", "urbiscript", "application/x-urbiscript": return .urbiscript
            case "VCL", "vcl", "text/x-vclsrc": return .vCL
            case "VCLSnippets", "vclsnippets", "vclsnippet", "text/x-vclsnippet": return .vCLSnippet
            case "VCTreeStatus", "vctreestatus": return .vCTreeStatus
            case "VGL", "vgl": return .vGL
            case "Vala", "vala", "vapi", "text/x-vala": return .vala
            case "aspx-vb": return .vbNetAspx
            case "VB.net", "vb.net", "vbnet", "text/x-vbnet", "text/x-vba": return .vbNet
            case "HTML+Velocity", "html+velocity", "text/html+velocity": return .velocityHtml
            case "Velocity", "velocity": return .velocity
            case "XML+Velocity", "xml+velocity", "application/xml+velocity": return .velocityXml
            case "verilog", "v", "text/x-verilog": return .verilog
            case "vhdl", "text/x-vhdl": return .vhdl
            case "VimL", "vim", ".vimrc", ".exrc", ".gvimrc", "_vimrc", "_exrc", "_gvimrc", "vimrc", "gvimrc", "text/x-vim": return .vim
            case "WDiff", "wdiff": return .wDiff
            case "Whiley", "whiley", "text/x-whiley": return .whiley
            case "XQuery", "xquery", "xqy", "xq", "xql", "xqm", "text/xquery", "application/xquery": return .xQuery
            case "XML+Django/Jinja", "xml+django", "xml+jinja", "application/xml+django", "application/xml+jinja": return .xmlDjango
            case "XML+Ruby", "xml+erb", "xml+ruby", "application/xml+ruby": return .xmlErb
            case "XML", "xml", "text/xml", "application/xml", "image/svg+xml", "application/rss+xml", "application/atom+xml": return .xml
            case "XML+PHP", "xml+php", "application/xml+php": return .xmlPhp
            case "XML+Smarty", "xml+smarty", "application/xml+smarty": return .xmlSmarty
            case "Xorg", "xorg.conf": return .xorg
            case "XSLT", "xslt", "application/xsl+xml", "application/xslt+xml": return .xslt
            case "Xtend", "xtend", "text/x-xtend": return .xtend
            case "xtlang", "extempore": return .xtlang
            case "YAML+Jinja", "yaml+jinja", "salt", "sls", "text/x-yaml+jinja", "text/x-sls": return .yamlJinja
            case "YAML", "yaml", "text/x-yaml": return .yaml
            case "Zephir", "zephir": return .zephir
            default:
                return nil
            }
        }
        public static var aBAP = Lexer(lexers.ABAPLexer(), name: "ABAP", alias: ["abap"], filenames: ["*.abap", "*.ABAP"], mimeTypes: ["text/x-abap"])
        public static var aPL = Lexer(lexers.APLLexer(), name: "APL", alias: ["apl"], filenames: ["*.apl"], mimeTypes: [])
        public static var abnf = Lexer(lexers.AbnfLexer(), name: "ABNF", alias: ["abnf"], filenames: ["*.abnf"], mimeTypes: ["text/x-abnf"])
        public static var actionScript = Lexer(lexers.ActionScriptLexer(), name: "ActionScript", alias: ["as", "actionscript"], filenames: ["*.as"], mimeTypes: ["application/x-actionscript", "text/x-actionscript", "text/actionscript"])
        public static var ada = Lexer(lexers.AdaLexer(), name: "Ada", alias: ["ada", "ada95", "ada2005"], filenames: ["*.adb", "*.ads", "*.ada"], mimeTypes: ["text/x-ada"])
        public static var adl = Lexer(lexers.AdlLexer(), name: "ADL", alias: ["adl"], filenames: ["*.adl", "*.adls", "*.adlf", "*.adlx"], mimeTypes: [])
        public static var agda = Lexer(lexers.AgdaLexer(), name: "Agda", alias: ["agda"], filenames: ["*.agda"], mimeTypes: ["text/x-agda"])
        public static var aheui = Lexer(lexers.AheuiLexer(), name: "Aheui", alias: ["aheui"], filenames: ["*.aheui"], mimeTypes: [])
        public static var alloy = Lexer(lexers.AlloyLexer(), name: "Alloy", alias: ["alloy"], filenames: ["*.als"], mimeTypes: ["text/x-alloy"])
        public static var ambientTalk = Lexer(lexers.AmbientTalkLexer(), name: "AmbientTalk", alias: ["at", "ambienttalk", "ambienttalk/2"], filenames: ["*.at"], mimeTypes: ["text/x-ambienttalk"])
        public static var ampl = Lexer(lexers.AmplLexer(), name: "Ampl", alias: ["ampl"], filenames: ["*.run"], mimeTypes: [])
        public static var antlrActionScript = Lexer(lexers.AntlrActionScriptLexer(), name: "ANTLR With ActionScript Target", alias: ["antlr-as", "antlr-actionscript"], filenames: ["*.G", "*.g"], mimeTypes: [])
        public static var antlrCSharp = Lexer(lexers.AntlrCSharpLexer(), name: "ANTLR With C# Target", alias: ["antlr-csharp", "antlr-c#"], filenames: ["*.G", "*.g"], mimeTypes: [])
        public static var antlrCpp = Lexer(lexers.AntlrCppLexer(), name: "ANTLR With CPP Target", alias: ["antlr-cpp"], filenames: ["*.G", "*.g"], mimeTypes: [])
        public static var antlrJava = Lexer(lexers.AntlrJavaLexer(), name: "ANTLR With Java Target", alias: ["antlr-java"], filenames: ["*.G", "*.g"], mimeTypes: [])
        public static var antlr = Lexer(lexers.AntlrLexer(), name: "ANTLR", alias: ["antlr"], filenames: [], mimeTypes: [])
        public static var antlrObjectiveC = Lexer(lexers.AntlrObjectiveCLexer(), name: "ANTLR With ObjectiveC Target", alias: ["antlr-objc"], filenames: ["*.G", "*.g"], mimeTypes: [])
        public static var antlrPerl = Lexer(lexers.AntlrPerlLexer(), name: "ANTLR With Perl Target", alias: ["antlr-perl"], filenames: ["*.G", "*.g"], mimeTypes: [])
        public static var antlrPython = Lexer(lexers.AntlrPythonLexer(), name: "ANTLR With Python Target", alias: ["antlr-python"], filenames: ["*.G", "*.g"], mimeTypes: [])
        public static var antlrRuby = Lexer(lexers.AntlrRubyLexer(), name: "ANTLR With Ruby Target", alias: ["antlr-ruby", "antlr-rb"], filenames: ["*.G", "*.g"], mimeTypes: [])
        public static var apacheConf = Lexer(lexers.ApacheConfLexer(), name: "ApacheConf", alias: ["apacheconf", "aconf", "apache"], filenames: [".htaccess", "apache.conf", "apache2.conf"], mimeTypes: ["text/x-apacheconf"])
        public static var appleScript = Lexer(lexers.AppleScriptLexer(), name: "AppleScript", alias: ["applescript"], filenames: ["*.applescript"], mimeTypes: [])
        public static var arduino = Lexer(lexers.ArduinoLexer(), name: "Arduino", alias: ["arduino"], filenames: ["*.ino"], mimeTypes: ["text/x-arduino"])
        public static var aspectJ = Lexer(lexers.AspectJLexer(), name: "AspectJ", alias: ["aspectj"], filenames: ["*.aj"], mimeTypes: ["text/x-aspectj"])
        public static var asymptote = Lexer(lexers.AsymptoteLexer(), name: "Asymptote", alias: ["asy", "asymptote"], filenames: ["*.asy"], mimeTypes: ["text/x-asymptote"])
        public static var autoIt = Lexer(lexers.AutoItLexer(), name: "AutoIt", alias: ["autoit"], filenames: ["*.au3"], mimeTypes: ["text/x-autoit"])
        public static var autohotkey = Lexer(lexers.AutohotkeyLexer(), name: "autohotkey", alias: ["ahk", "autohotkey"], filenames: ["*.ahk", "*.ahkl"], mimeTypes: ["text/x-autohotkey"])
        public static var awk = Lexer(lexers.AwkLexer(), name: "Awk", alias: ["awk", "gawk", "mawk", "nawk"], filenames: ["*.awk"], mimeTypes: ["application/x-awk"])
        public static var bBCode = Lexer(lexers.BBCodeLexer(), name: "BBCode", alias: ["bbcode"], filenames: [], mimeTypes: ["text/x-bbcode"])
        public static var bC = Lexer(lexers.BCLexer(), name: "BC", alias: ["bc"], filenames: ["*.bc"], mimeTypes: [])
        public static var bST = Lexer(lexers.BSTLexer(), name: "BST", alias: ["bst", "bst-pybtex"], filenames: ["*.bst"], mimeTypes: [])
        public static var baseMakefile = Lexer(lexers.BaseMakefileLexer(), name: "Base Makefile", alias: ["basemake"], filenames: [], mimeTypes: [])
        public static var bash = Lexer(lexers.BashLexer(), name: "Bash", alias: ["bash", "sh", "ksh", "zsh", "shell"], filenames: ["*.sh", "*.ksh", "*.bash", "*.ebuild", "*.eclass", "*.exheres-0", "*.exlib", "*.zsh", ".bashrc", "bashrc", ".bash_*", "bash_*", "zshrc", ".zshrc", "PKGBUILD"], mimeTypes: ["application/x-sh", "application/x-shellscript"])
        public static var bashSession = Lexer(lexers.BashSessionLexer(), name: "Bash Session", alias: ["console", "shell-session"], filenames: ["*.sh-session", "*.shell-session"], mimeTypes: ["application/x-shell-session", "application/x-sh-session"])
        public static var batch = Lexer(lexers.BatchLexer(), name: "Batchfile", alias: ["bat", "batch", "dosbatch", "winbatch"], filenames: ["*.bat", "*.cmd"], mimeTypes: ["application/x-dos-batch"])
        public static var befunge = Lexer(lexers.BefungeLexer(), name: "Befunge", alias: ["befunge"], filenames: ["*.befunge"], mimeTypes: ["application/x-befunge"])
        public static var bibTeX = Lexer(lexers.BibTeXLexer(), name: "BibTeX", alias: ["bib", "bibtex"], filenames: ["*.bib"], mimeTypes: ["text/x-bibtex"])
        public static var blitzBasic = Lexer(lexers.BlitzBasicLexer(), name: "BlitzBasic", alias: ["blitzbasic", "b3d", "bplus"], filenames: ["*.bb", "*.decls"], mimeTypes: ["text/x-bb"])
        public static var blitzMax = Lexer(lexers.BlitzMaxLexer(), name: "BlitzMax", alias: ["blitzmax", "bmax"], filenames: ["*.bmx"], mimeTypes: ["text/x-bmx"])
        public static var bnf = Lexer(lexers.BnfLexer(), name: "BNF", alias: ["bnf"], filenames: ["*.bnf"], mimeTypes: ["text/x-bnf"])
        public static var boo = Lexer(lexers.BooLexer(), name: "Boo", alias: ["boo"], filenames: ["*.boo"], mimeTypes: ["text/x-boo"])
        public static var boogie = Lexer(lexers.BoogieLexer(), name: "Boogie", alias: ["boogie"], filenames: ["*.bpl"], mimeTypes: [])
        public static var brainfuck = Lexer(lexers.BrainfuckLexer(), name: "Brainfuck", alias: ["brainfuck", "bf"], filenames: ["*.bf", "*.b"], mimeTypes: ["application/x-brainfuck"])
        public static var bro = Lexer(lexers.BroLexer(), name: "Bro", alias: ["bro"], filenames: ["*.bro"], mimeTypes: [])
        public static var bugs = Lexer(lexers.BugsLexer(), name: "BUGS", alias: ["bugs", "winbugs", "openbugs"], filenames: ["*.bug"], mimeTypes: [])
        public static var cAmkES = Lexer(lexers.CAmkESLexer(), name: "CAmkES", alias: ["camkes", "idl4"], filenames: ["*.camkes", "*.idl4"], mimeTypes: [])
        public static var c = Lexer(lexers.CLexer(), name: "C", alias: ["c"], filenames: ["*.c", "*.h", "*.idc"], mimeTypes: ["text/x-chdr", "text/x-csrc"])
        public static var cMake = Lexer(lexers.CMakeLexer(), name: "CMake", alias: ["cmake"], filenames: ["*.cmake", "CMakeLists.txt"], mimeTypes: ["text/x-cmake"])
        public static var cObjdump = Lexer(lexers.CObjdumpLexer(), name: "c-objdump", alias: ["c-objdump"], filenames: ["*.c-objdump"], mimeTypes: ["text/x-c-objdump"])
        public static var cPSA = Lexer(lexers.CPSALexer(), name: "CPSA", alias: ["cpsa"], filenames: ["*.cpsa"], mimeTypes: [])
        public static var cSharpAspx = Lexer(lexers.CSharpAspxLexer(), name: "aspx-cs", alias: ["aspx-cs"], filenames: ["*.aspx", "*.asax", "*.ascx", "*.ashx", "*.asmx", "*.axd"], mimeTypes: [])
        public static var cSharp = Lexer(lexers.CSharpLexer(), name: "C#", alias: ["csharp", "c#"], filenames: ["*.cs"], mimeTypes: ["text/x-csharp"])
        public static var cadl = Lexer(lexers.CadlLexer(), name: "cADL", alias: ["cadl"], filenames: ["*.cadl"], mimeTypes: [])
        public static var capDL = Lexer(lexers.CapDLLexer(), name: "CapDL", alias: ["capdl"], filenames: ["*.cdl"], mimeTypes: [])
        public static var capnProto = Lexer(lexers.CapnProtoLexer(), name: "Cap'n Proto", alias: ["capnp"], filenames: ["*.capnp"], mimeTypes: [])
        public static var ceylon = Lexer(lexers.CeylonLexer(), name: "Ceylon", alias: ["ceylon"], filenames: ["*.ceylon"], mimeTypes: ["text/x-ceylon"])
        public static var chaiscript = Lexer(lexers.ChaiscriptLexer(), name: "ChaiScript", alias: ["chai", "chaiscript"], filenames: ["*.chai"], mimeTypes: ["text/x-chaiscript", "application/x-chaiscript"])
        public static var chapel = Lexer(lexers.ChapelLexer(), name: "Chapel", alias: ["chapel", "chpl"], filenames: ["*.chpl"], mimeTypes: [])
        public static var cheetahHtml = Lexer(lexers.CheetahHtmlLexer(), name: "HTML+Cheetah", alias: ["html+cheetah", "html+spitfire", "htmlcheetah"], filenames: [], mimeTypes: ["text/html+cheetah", "text/html+spitfire"])
        public static var cheetahJavascript = Lexer(lexers.CheetahJavascriptLexer(), name: "JavaScript+Cheetah", alias: ["js+cheetah", "javascript+cheetah", "js+spitfire", "javascript+spitfire"], filenames: [], mimeTypes: ["application/x-javascript+cheetah", "text/x-javascript+cheetah", "text/javascript+cheetah", "application/x-javascript+spitfire", "text/x-javascript+spitfire", "text/javascript+spitfire"])
        public static var cheetah = Lexer(lexers.CheetahLexer(), name: "Cheetah", alias: ["cheetah", "spitfire"], filenames: ["*.tmpl", "*.spt"], mimeTypes: ["application/x-cheetah", "application/x-spitfire"])
        public static var cheetahXml = Lexer(lexers.CheetahXmlLexer(), name: "XML+Cheetah", alias: ["xml+cheetah", "xml+spitfire"], filenames: [], mimeTypes: ["application/xml+cheetah", "application/xml+spitfire"])
        public static var cirru = Lexer(lexers.CirruLexer(), name: "Cirru", alias: ["cirru"], filenames: ["*.cirru"], mimeTypes: ["text/x-cirru"])
        public static var clay = Lexer(lexers.ClayLexer(), name: "Clay", alias: ["clay"], filenames: ["*.clay"], mimeTypes: ["text/x-clay"])
        public static var clean = Lexer(lexers.CleanLexer(), name: "Clean", alias: ["clean"], filenames: ["*.icl", "*.dcl"], mimeTypes: [])
        public static var clojure = Lexer(lexers.ClojureLexer(), name: "Clojure", alias: ["clojure", "clj"], filenames: ["*.clj"], mimeTypes: ["text/x-clojure", "application/x-clojure"])
        public static var clojureScript = Lexer(lexers.ClojureScriptLexer(), name: "ClojureScript", alias: ["clojurescript", "cljs"], filenames: ["*.cljs"], mimeTypes: ["text/x-clojurescript", "application/x-clojurescript"])
        public static var cobolFreeformat = Lexer(lexers.CobolFreeformatLexer(), name: "COBOLFree", alias: ["cobolfree"], filenames: ["*.cbl", "*.CBL"], mimeTypes: [])
        public static var cobol = Lexer(lexers.CobolLexer(), name: "COBOL", alias: ["cobol"], filenames: ["*.cob", "*.COB", "*.cpy", "*.CPY"], mimeTypes: ["text/x-cobol"])
        public static var coffeeScript = Lexer(lexers.CoffeeScriptLexer(), name: "CoffeeScript", alias: ["coffee-script", "coffeescript", "coffee"], filenames: ["*.coffee"], mimeTypes: ["text/coffeescript"])
        public static var coldfusionCFC = Lexer(lexers.ColdfusionCFCLexer(), name: "Coldfusion CFC", alias: ["cfc"], filenames: ["*.cfc"], mimeTypes: [])
        public static var coldfusionHtml = Lexer(lexers.ColdfusionHtmlLexer(), name: "Coldfusion HTML", alias: ["cfm"], filenames: ["*.cfm", "*.cfml"], mimeTypes: ["application/x-coldfusion"])
        public static var coldfusion = Lexer(lexers.ColdfusionLexer(), name: "cfstatement", alias: ["cfs"], filenames: [], mimeTypes: [])
        public static var commonLisp = Lexer(lexers.CommonLispLexer(), name: "Common Lisp", alias: ["common-lisp", "cl", "lisp"], filenames: ["*.cl", "*.lisp"], mimeTypes: ["text/x-common-lisp"])
        public static var componentPascal = Lexer(lexers.ComponentPascalLexer(), name: "Component Pascal", alias: ["componentpascal", "cp"], filenames: ["*.cp", "*.cps"], mimeTypes: ["text/x-component-pascal"])
        public static var coq = Lexer(lexers.CoqLexer(), name: "Coq", alias: ["coq"], filenames: ["*.v"], mimeTypes: ["text/x-coq"])
        public static var cpp = Lexer(lexers.CppLexer(), name: "C++", alias: ["cpp", "c++"], filenames: ["*.cpp", "*.hpp", "*.c++", "*.h++", "*.cc", "*.hh", "*.cxx", "*.hxx", "*.C", "*.H", "*.cp", "*.CPP"], mimeTypes: ["text/x-c++hdr", "text/x-c++src"])
        public static var cppObjdump = Lexer(lexers.CppObjdumpLexer(), name: "cpp-objdump", alias: ["cpp-objdump", "c++-objdumb", "cxx-objdump"], filenames: ["*.cpp-objdump", "*.c++-objdump", "*.cxx-objdump"], mimeTypes: ["text/x-cpp-objdump"])
        public static var crmsh = Lexer(lexers.CrmshLexer(), name: "Crmsh", alias: ["crmsh", "pcmk"], filenames: ["*.crmsh", "*.pcmk"], mimeTypes: [])
        public static var croc = Lexer(lexers.CrocLexer(), name: "Croc", alias: ["croc"], filenames: ["*.croc"], mimeTypes: ["text/x-crocsrc"])
        public static var cryptol = Lexer(lexers.CryptolLexer(), name: "Cryptol", alias: ["cryptol", "cry"], filenames: ["*.cry"], mimeTypes: ["text/x-cryptol"])
        public static var crystal = Lexer(lexers.CrystalLexer(), name: "Crystal", alias: ["cr", "crystal"], filenames: ["*.cr"], mimeTypes: ["text/x-crystal"])
        public static var csoundDocument = Lexer(lexers.CsoundDocumentLexer(), name: "Csound Document", alias: ["csound-document", "csound-csd"], filenames: ["*.csd"], mimeTypes: [])
        public static var csoundOrchestra = Lexer(lexers.CsoundOrchestraLexer(), name: "Csound Orchestra", alias: ["csound", "csound-orc"], filenames: ["*.orc", "*.udo"], mimeTypes: [])
        public static var csoundScore = Lexer(lexers.CsoundScoreLexer(), name: "Csound Score", alias: ["csound-score", "csound-sco"], filenames: ["*.sco"], mimeTypes: [])
        public static var cssDjango = Lexer(lexers.CssDjangoLexer(), name: "CSS+Django/Jinja", alias: ["css+django", "css+jinja"], filenames: [], mimeTypes: ["text/css+django", "text/css+jinja"])
        public static var cssErb = Lexer(lexers.CssErbLexer(), name: "CSS+Ruby", alias: ["css+erb", "css+ruby"], filenames: [], mimeTypes: ["text/css+ruby"])
        public static var cssGenshi = Lexer(lexers.CssGenshiLexer(), name: "CSS+Genshi Text", alias: ["css+genshitext", "css+genshi"], filenames: [], mimeTypes: ["text/css+genshi"])
        public static var css = Lexer(lexers.CssLexer(), name: "CSS", alias: ["css"], filenames: ["*.css"], mimeTypes: ["text/css"])
        public static var cssPhp = Lexer(lexers.CssPhpLexer(), name: "CSS+PHP", alias: ["css+php"], filenames: [], mimeTypes: ["text/css+php"])
        public static var cssSmarty = Lexer(lexers.CssSmartyLexer(), name: "CSS+Smarty", alias: ["css+smarty"], filenames: [], mimeTypes: ["text/css+smarty"])
        public static var cuda = Lexer(lexers.CudaLexer(), name: "CUDA", alias: ["cuda", "cu"], filenames: ["*.cu", "*.cuh"], mimeTypes: ["text/x-cuda"])
        public static var cypher = Lexer(lexers.CypherLexer(), name: "Cypher", alias: ["cypher"], filenames: ["*.cyp", "*.cypher"], mimeTypes: [])
        public static var cython = Lexer(lexers.CythonLexer(), name: "Cython", alias: ["cython", "pyx", "pyrex"], filenames: ["*.pyx", "*.pxd", "*.pxi"], mimeTypes: ["text/x-cython", "application/x-cython"])
        public static var d = Lexer(lexers.DLexer(), name: "D", alias: ["d"], filenames: ["*.d", "*.di"], mimeTypes: ["text/x-dsrc"])
        public static var dObjdump = Lexer(lexers.DObjdumpLexer(), name: "d-objdump", alias: ["d-objdump"], filenames: ["*.d-objdump"], mimeTypes: ["text/x-d-objdump"])
        public static var darcsPatch = Lexer(lexers.DarcsPatchLexer(), name: "Darcs Patch", alias: ["dpatch"], filenames: ["*.dpatch", "*.darcspatch"], mimeTypes: [])
        public static var dart = Lexer(lexers.DartLexer(), name: "Dart", alias: ["dart"], filenames: ["*.dart"], mimeTypes: ["text/x-dart"])
        public static var debianControl = Lexer(lexers.DebianControlLexer(), name: "Debian Control file", alias: ["control", "debcontrol"], filenames: ["control"], mimeTypes: [])
        public static var delphi = Lexer(lexers.DelphiLexer(), name: "Delphi", alias: ["delphi", "pas", "pascal", "objectpascal"], filenames: ["*.pas", "*.dpr"], mimeTypes: ["text/x-pascal"])
        public static var dg = Lexer(lexers.DgLexer(), name: "dg", alias: ["dg"], filenames: ["*.dg"], mimeTypes: ["text/x-dg"])
        public static var diff = Lexer(lexers.DiffLexer(), name: "Diff", alias: ["diff", "udiff"], filenames: ["*.diff", "*.patch"], mimeTypes: ["text/x-diff", "text/x-patch"])
        public static var django = Lexer(lexers.DjangoLexer(), name: "Django/Jinja", alias: ["django", "jinja"], filenames: [], mimeTypes: ["application/x-django-templating", "application/x-jinja"])
        public static var docker = Lexer(lexers.DockerLexer(), name: "Docker", alias: ["docker", "dockerfile"], filenames: ["Dockerfile", "*.docker"], mimeTypes: ["text/x-dockerfile-config"])
        public static var dtd = Lexer(lexers.DtdLexer(), name: "DTD", alias: ["dtd"], filenames: ["*.dtd"], mimeTypes: ["application/xml-dtd"])
        public static var duel = Lexer(lexers.DuelLexer(), name: "Duel", alias: ["duel", "jbst", "jsonml+bst"], filenames: ["*.duel", "*.jbst"], mimeTypes: ["text/x-duel", "text/x-jbst"])
        public static var dylanConsole = Lexer(lexers.DylanConsoleLexer(), name: "Dylan session", alias: ["dylan-console", "dylan-repl"], filenames: ["*.dylan-console"], mimeTypes: ["text/x-dylan-console"])
        public static var dylan = Lexer(lexers.DylanLexer(), name: "Dylan", alias: ["dylan"], filenames: ["*.dylan", "*.dyl", "*.intr"], mimeTypes: ["text/x-dylan"])
        public static var dylanLid = Lexer(lexers.DylanLidLexer(), name: "DylanLID", alias: ["dylan-lid", "lid"], filenames: ["*.lid", "*.hdp"], mimeTypes: ["text/x-dylan-lid"])
        public static var eCL = Lexer(lexers.ECLLexer(), name: "ECL", alias: ["ecl"], filenames: ["*.ecl"], mimeTypes: ["application/x-ecl"])
        public static var eC = Lexer(lexers.ECLexer(), name: "eC", alias: ["ec"], filenames: ["*.ec", "*.eh"], mimeTypes: ["text/x-echdr", "text/x-ecsrc"])
        public static var earlGrey = Lexer(lexers.EarlGreyLexer(), name: "Earl Grey", alias: ["earl-grey", "earlgrey", "eg"], filenames: ["*.eg"], mimeTypes: ["text/x-earl-grey"])
        public static var easytrieve = Lexer(lexers.EasytrieveLexer(), name: "Easytrieve", alias: ["easytrieve"], filenames: ["*.ezt", "*.mac"], mimeTypes: ["text/x-easytrieve"])
        public static var ebnf = Lexer(lexers.EbnfLexer(), name: "EBNF", alias: ["ebnf"], filenames: ["*.ebnf"], mimeTypes: ["text/x-ebnf"])
        public static var eiffel = Lexer(lexers.EiffelLexer(), name: "Eiffel", alias: ["eiffel"], filenames: ["*.e"], mimeTypes: ["text/x-eiffel"])
        public static var elixirConsole = Lexer(lexers.ElixirConsoleLexer(), name: "Elixir iex session", alias: ["iex"], filenames: [], mimeTypes: ["text/x-elixir-shellsession"])
        public static var elixir = Lexer(lexers.ElixirLexer(), name: "Elixir", alias: ["elixir", "ex", "exs"], filenames: ["*.ex", "*.exs"], mimeTypes: ["text/x-elixir"])
        public static var elm = Lexer(lexers.ElmLexer(), name: "Elm", alias: ["elm"], filenames: ["*.elm"], mimeTypes: ["text/x-elm"])
        public static var emacsLisp = Lexer(lexers.EmacsLispLexer(), name: "EmacsLisp", alias: ["emacs", "elisp", "emacs-lisp"], filenames: ["*.el"], mimeTypes: ["text/x-elisp", "application/x-elisp"])
        public static var erb = Lexer(lexers.ErbLexer(), name: "ERB", alias: ["erb"], filenames: [], mimeTypes: ["application/x-ruby-templating"])
        public static var erlang = Lexer(lexers.ErlangLexer(), name: "Erlang", alias: ["erlang"], filenames: ["*.erl", "*.hrl", "*.es", "*.escript"], mimeTypes: ["text/x-erlang"])
        public static var erlangShell = Lexer(lexers.ErlangShellLexer(), name: "Erlang erl session", alias: ["erl"], filenames: ["*.erl-sh"], mimeTypes: ["text/x-erl-shellsession"])
        public static var evoqueHtml = Lexer(lexers.EvoqueHtmlLexer(), name: "HTML+Evoque", alias: ["html+evoque"], filenames: ["*.html"], mimeTypes: ["text/html+evoque"])
        public static var evoque = Lexer(lexers.EvoqueLexer(), name: "Evoque", alias: ["evoque"], filenames: ["*.evoque"], mimeTypes: ["application/x-evoque"])
        public static var evoqueXml = Lexer(lexers.EvoqueXmlLexer(), name: "XML+Evoque", alias: ["xml+evoque"], filenames: ["*.xml"], mimeTypes: ["application/xml+evoque"])
        public static var ezhil = Lexer(lexers.EzhilLexer(), name: "Ezhil", alias: ["ezhil"], filenames: ["*.n"], mimeTypes: ["text/x-ezhil"])
        public static var fSharp = Lexer(lexers.FSharpLexer(), name: "FSharp", alias: ["fsharp"], filenames: ["*.fs", "*.fsi"], mimeTypes: ["text/x-fsharp"])
        public static var factor = Lexer(lexers.FactorLexer(), name: "Factor", alias: ["factor"], filenames: ["*.factor"], mimeTypes: ["text/x-factor"])
        public static var fancy = Lexer(lexers.FancyLexer(), name: "Fancy", alias: ["fancy", "fy"], filenames: ["*.fy", "*.fancypack"], mimeTypes: ["text/x-fancysrc"])
        public static var fantom = Lexer(lexers.FantomLexer(), name: "Fantom", alias: ["fan"], filenames: ["*.fan"], mimeTypes: ["application/x-fantom"])
        public static var felix = Lexer(lexers.FelixLexer(), name: "Felix", alias: ["felix", "flx"], filenames: ["*.flx", "*.flxh"], mimeTypes: ["text/x-felix"])
        public static var fennel = Lexer(lexers.FennelLexer(), name: "Fennel", alias: ["fennel", "fnl"], filenames: ["*.fnl"], mimeTypes: [])
        public static var fishShell = Lexer(lexers.FishShellLexer(), name: "Fish", alias: ["fish", "fishshell"], filenames: ["*.fish", "*.load"], mimeTypes: ["application/x-fish"])
        public static var flatline = Lexer(lexers.FlatlineLexer(), name: "Flatline", alias: ["flatline"], filenames: [], mimeTypes: ["text/x-flatline"])
        public static var forth = Lexer(lexers.ForthLexer(), name: "Forth", alias: ["forth"], filenames: ["*.frt", "*.fs"], mimeTypes: ["application/x-forth"])
        public static var fortranFixed = Lexer(lexers.FortranFixedLexer(), name: "FortranFixed", alias: ["fortranfixed"], filenames: ["*.f", "*.F"], mimeTypes: [])
        public static var fortran = Lexer(lexers.FortranLexer(), name: "Fortran", alias: ["fortran"], filenames: ["*.f03", "*.f90", "*.F03", "*.F90"], mimeTypes: ["text/x-fortran"])
        public static var foxPro = Lexer(lexers.FoxProLexer(), name: "FoxPro", alias: ["foxpro", "vfp", "clipper", "xbase"], filenames: ["*.PRG", "*.prg"], mimeTypes: [])
        public static var gAP = Lexer(lexers.GAPLexer(), name: "GAP", alias: ["gap"], filenames: ["*.g", "*.gd", "*.gi", "*.gap"], mimeTypes: [])
        public static var gLShader = Lexer(lexers.GLShaderLexer(), name: "GLSL", alias: ["glsl"], filenames: ["*.vert", "*.frag", "*.geo"], mimeTypes: ["text/x-glslsrc"])
        public static var gas = Lexer(lexers.GasLexer(), name: "GAS", alias: ["gas", "asm"], filenames: ["*.s", "*.S"], mimeTypes: ["text/x-gas"])
        public static var genshi = Lexer(lexers.GenshiLexer(), name: "Genshi", alias: ["genshi", "kid", "xml+genshi", "xml+kid"], filenames: ["*.kid"], mimeTypes: ["application/x-genshi", "application/x-kid"])
        public static var genshiText = Lexer(lexers.GenshiTextLexer(), name: "Genshi Text", alias: ["genshitext"], filenames: [], mimeTypes: ["application/x-genshi-text", "text/x-genshi"])
        public static var gettext = Lexer(lexers.GettextLexer(), name: "Gettext Catalog", alias: ["pot", "po"], filenames: ["*.pot", "*.po"], mimeTypes: ["application/x-gettext", "text/x-gettext", "text/gettext"])
        public static var gherkin = Lexer(lexers.GherkinLexer(), name: "Gherkin", alias: ["cucumber", "gherkin"], filenames: ["*.feature"], mimeTypes: ["text/x-gherkin"])
        public static var gnuplot = Lexer(lexers.GnuplotLexer(), name: "Gnuplot", alias: ["gnuplot"], filenames: ["*.plot", "*.plt"], mimeTypes: ["text/x-gnuplot"])
        public static var go = Lexer(lexers.GoLexer(), name: "Go", alias: ["go"], filenames: ["*.go"], mimeTypes: ["text/x-gosrc"])
        public static var golo = Lexer(lexers.GoloLexer(), name: "Golo", alias: ["golo"], filenames: ["*.golo"], mimeTypes: [])
        public static var goodDataCL = Lexer(lexers.GoodDataCLLexer(), name: "GoodData-CL", alias: ["gooddata-cl"], filenames: ["*.gdc"], mimeTypes: ["text/x-gooddata-cl"])
        public static var gosu = Lexer(lexers.GosuLexer(), name: "Gosu", alias: ["gosu"], filenames: ["*.gs", "*.gsx", "*.gsp", "*.vark"], mimeTypes: ["text/x-gosu"])
        public static var gosuTemplate = Lexer(lexers.GosuTemplateLexer(), name: "Gosu Template", alias: ["gst"], filenames: ["*.gst"], mimeTypes: ["text/x-gosu-template"])
        public static var groff = Lexer(lexers.GroffLexer(), name: "Groff", alias: ["groff", "nroff", "man"], filenames: ["*.[1234567]", "*.man"], mimeTypes: ["application/x-troff", "text/troff"])
        public static var groovy = Lexer(lexers.GroovyLexer(), name: "Groovy", alias: ["groovy"], filenames: ["*.groovy", "*.gradle"], mimeTypes: ["text/x-groovy"])
        public static var hLSLShader = Lexer(lexers.HLSLShaderLexer(), name: "HLSL", alias: ["hlsl"], filenames: ["*.hlsl", "*.hlsli"], mimeTypes: ["text/x-hlsl"])
        public static var haml = Lexer(lexers.HamlLexer(), name: "Haml", alias: ["haml"], filenames: ["*.haml"], mimeTypes: ["text/x-haml"])
        public static var handlebarsHtml = Lexer(lexers.HandlebarsHtmlLexer(), name: "HTML+Handlebars", alias: ["html+handlebars"], filenames: ["*.handlebars", "*.hbs"], mimeTypes: ["text/html+handlebars", "text/x-handlebars-template"])
        public static var handlebars = Lexer(lexers.HandlebarsLexer(), name: "Handlebars", alias: ["handlebars"], filenames: [], mimeTypes: [])
        public static var haskell = Lexer(lexers.HaskellLexer(), name: "Haskell", alias: ["haskell", "hs"], filenames: ["*.hs"], mimeTypes: ["text/x-haskell"])
        public static var haxe = Lexer(lexers.HaxeLexer(), name: "Haxe", alias: ["hx", "haxe", "hxsl"], filenames: ["*.hx", "*.hxsl"], mimeTypes: ["text/haxe", "text/x-haxe", "text/x-hx"])
        public static var hexdump = Lexer(lexers.HexdumpLexer(), name: "Hexdump", alias: ["hexdump"], filenames: [], mimeTypes: [])
        public static var hsail = Lexer(lexers.HsailLexer(), name: "HSAIL", alias: ["hsail", "hsa"], filenames: ["*.hsail"], mimeTypes: ["text/x-hsail"])
        public static var htmlDjango = Lexer(lexers.HtmlDjangoLexer(), name: "HTML+Django/Jinja", alias: ["html+django", "html+jinja", "htmldjango"], filenames: [], mimeTypes: ["text/html+django", "text/html+jinja"])
        public static var htmlGenshi = Lexer(lexers.HtmlGenshiLexer(), name: "HTML+Genshi", alias: ["html+genshi", "html+kid"], filenames: [], mimeTypes: ["text/html+genshi"])
        public static var html = Lexer(lexers.HtmlLexer(), name: "HTML", alias: ["html"], filenames: ["*.html", "*.htm", "*.xhtml", "*.xslt"], mimeTypes: ["text/html", "application/xhtml+xml"])
        public static var htmlPhp = Lexer(lexers.HtmlPhpLexer(), name: "HTML+PHP", alias: ["html+php"], filenames: ["*.phtml"], mimeTypes: ["application/x-php", "application/x-httpd-php", "application/x-httpd-php3", "application/x-httpd-php4", "application/x-httpd-php5"])
        public static var htmlSmarty = Lexer(lexers.HtmlSmartyLexer(), name: "HTML+Smarty", alias: ["html+smarty"], filenames: [], mimeTypes: ["text/html+smarty"])
        public static var http = Lexer(lexers.HttpLexer(), name: "HTTP", alias: ["http"], filenames: [], mimeTypes: [])
        public static var hxml = Lexer(lexers.HxmlLexer(), name: "Hxml", alias: ["haxeml", "hxml"], filenames: ["*.hxml"], mimeTypes: [])
        public static var hy = Lexer(lexers.HyLexer(), name: "Hy", alias: ["hylang"], filenames: ["*.hy"], mimeTypes: ["text/x-hy", "application/x-hy"])
        public static var hybris = Lexer(lexers.HybrisLexer(), name: "Hybris", alias: ["hybris", "hy"], filenames: ["*.hy", "*.hyb"], mimeTypes: ["text/x-hybris", "application/x-hybris"])
        public static var iDL = Lexer(lexers.IDLLexer(), name: "IDL", alias: ["idl"], filenames: ["*.pro"], mimeTypes: ["text/idl"])
        public static var idris = Lexer(lexers.IdrisLexer(), name: "Idris", alias: ["idris", "idr"], filenames: ["*.idr"], mimeTypes: ["text/x-idris"])
        public static var igor = Lexer(lexers.IgorLexer(), name: "Igor", alias: ["igor", "igorpro"], filenames: ["*.ipf"], mimeTypes: ["text/ipf"])
        public static var ini = Lexer(lexers.IniLexer(), name: "INI", alias: ["ini", "cfg", "dosini"], filenames: ["*.ini", "*.cfg", "*.inf"], mimeTypes: ["text/x-ini", "text/inf"])
        public static var io = Lexer(lexers.IoLexer(), name: "Io", alias: ["io"], filenames: ["*.io"], mimeTypes: ["text/x-iosrc"])
        public static var ioke = Lexer(lexers.IokeLexer(), name: "Ioke", alias: ["ioke", "ik"], filenames: ["*.ik"], mimeTypes: ["text/x-iokesrc"])
        public static var ircLogs = Lexer(lexers.IrcLogsLexer(), name: "IRC logs", alias: ["irc"], filenames: ["*.weechatlog"], mimeTypes: ["text/x-irclog"])
        public static var isabelle = Lexer(lexers.IsabelleLexer(), name: "Isabelle", alias: ["isabelle"], filenames: ["*.thy"], mimeTypes: ["text/x-isabelle"])
        public static var j = Lexer(lexers.JLexer(), name: "J", alias: ["j"], filenames: ["*.ijs"], mimeTypes: ["text/x-j"])
        public static var jags = Lexer(lexers.JagsLexer(), name: "JAGS", alias: ["jags"], filenames: ["*.jag", "*.bug"], mimeTypes: [])
        public static var jasmin = Lexer(lexers.JasminLexer(), name: "Jasmin", alias: ["jasmin", "jasminxt"], filenames: ["*.j"], mimeTypes: [])
        public static var java = Lexer(lexers.JavaLexer(), name: "Java", alias: ["java"], filenames: ["*.java"], mimeTypes: ["text/x-java"])
        public static var javascriptDjango = Lexer(lexers.JavascriptDjangoLexer(), name: "JavaScript+Django/Jinja", alias: ["js+django", "javascript+django", "js+jinja", "javascript+jinja"], filenames: [], mimeTypes: ["application/x-javascript+django", "application/x-javascript+jinja", "text/x-javascript+django", "text/x-javascript+jinja", "text/javascript+django", "text/javascript+jinja"])
        public static var javascriptErb = Lexer(lexers.JavascriptErbLexer(), name: "JavaScript+Ruby", alias: ["js+erb", "javascript+erb", "js+ruby", "javascript+ruby"], filenames: [], mimeTypes: ["application/x-javascript+ruby", "text/x-javascript+ruby", "text/javascript+ruby"])
        public static var javascriptGenshi = Lexer(lexers.JavascriptGenshiLexer(), name: "JavaScript+Genshi Text", alias: ["js+genshitext", "js+genshi", "javascript+genshitext", "javascript+genshi"], filenames: [], mimeTypes: ["application/x-javascript+genshi", "text/x-javascript+genshi", "text/javascript+genshi"])
        public static var javascript = Lexer(lexers.JavascriptLexer(), name: "JavaScript", alias: ["js", "javascript"], filenames: ["*.js", "*.jsm"], mimeTypes: ["application/javascript", "application/x-javascript", "text/x-javascript", "text/javascript"])
        public static var javascriptPhp = Lexer(lexers.JavascriptPhpLexer(), name: "JavaScript+PHP", alias: ["js+php", "javascript+php"], filenames: [], mimeTypes: ["application/x-javascript+php", "text/x-javascript+php", "text/javascript+php"])
        public static var javascriptSmarty = Lexer(lexers.JavascriptSmartyLexer(), name: "JavaScript+Smarty", alias: ["js+smarty", "javascript+smarty"], filenames: [], mimeTypes: ["application/x-javascript+smarty", "text/x-javascript+smarty", "text/javascript+smarty"])
        public static var jcl = Lexer(lexers.JclLexer(), name: "JCL", alias: ["jcl"], filenames: ["*.jcl"], mimeTypes: ["text/x-jcl"])
        public static var jsgf = Lexer(lexers.JsgfLexer(), name: "JSGF", alias: ["jsgf"], filenames: ["*.jsgf"], mimeTypes: ["application/jsgf", "application/x-jsgf", "text/jsgf"])
        public static var jsonBareObject = Lexer(lexers.JsonBareObjectLexer(), name: "JSONBareObject", alias: ["json-object"], filenames: [], mimeTypes: ["application/json-object"])
        public static var jsonLd = Lexer(lexers.JsonLdLexer(), name: "JSON-LD", alias: ["jsonld", "json-ld"], filenames: ["*.jsonld"], mimeTypes: ["application/ld+json"])
        public static var json = Lexer(lexers.JsonLexer(), name: "JSON", alias: ["json"], filenames: ["*.json"], mimeTypes: ["application/json"])
        public static var jsp = Lexer(lexers.JspLexer(), name: "Java Server Page", alias: ["jsp"], filenames: ["*.jsp"], mimeTypes: ["application/x-jsp"])
        public static var juliaConsole = Lexer(lexers.JuliaConsoleLexer(), name: "Julia console", alias: ["jlcon"], filenames: [], mimeTypes: [])
        public static var julia = Lexer(lexers.JuliaLexer(), name: "Julia", alias: ["julia", "jl"], filenames: ["*.jl"], mimeTypes: ["text/x-julia", "application/x-julia"])
        public static var juttle = Lexer(lexers.JuttleLexer(), name: "Juttle", alias: ["juttle", "juttle"], filenames: ["*.juttle"], mimeTypes: ["application/juttle", "application/x-juttle", "text/x-juttle", "text/juttle"])
        public static var kal = Lexer(lexers.KalLexer(), name: "Kal", alias: ["kal"], filenames: ["*.kal"], mimeTypes: ["text/kal", "application/kal"])
        public static var kconfig = Lexer(lexers.KconfigLexer(), name: "Kconfig", alias: ["kconfig", "menuconfig", "linux-config", "kernel-config"], filenames: ["Kconfig", "*Config.in*", "external.in*", "standard-modules.in"], mimeTypes: ["text/x-kconfig"])
        public static var koka = Lexer(lexers.KokaLexer(), name: "Koka", alias: ["koka"], filenames: ["*.kk", "*.kki"], mimeTypes: ["text/x-koka"])
        public static var kotlin = Lexer(lexers.KotlinLexer(), name: "Kotlin", alias: ["kotlin"], filenames: ["*.kt"], mimeTypes: ["text/x-kotlin"])
        public static var lSL = Lexer(lexers.LSLLexer(), name: "LSL", alias: ["lsl"], filenames: ["*.lsl"], mimeTypes: ["text/x-lsl"])
        public static var lassoCss = Lexer(lexers.LassoCssLexer(), name: "CSS+Lasso", alias: ["css+lasso"], filenames: [], mimeTypes: ["text/css+lasso"])
        public static var lassoHtml = Lexer(lexers.LassoHtmlLexer(), name: "HTML+Lasso", alias: ["html+lasso"], filenames: [], mimeTypes: ["text/html+lasso", "application/x-httpd-lasso", "application/x-httpd-lasso[89]"])
        public static var lassoJavascript = Lexer(lexers.LassoJavascriptLexer(), name: "JavaScript+Lasso", alias: ["js+lasso", "javascript+lasso"], filenames: [], mimeTypes: ["application/x-javascript+lasso", "text/x-javascript+lasso", "text/javascript+lasso"])
        public static var lasso = Lexer(lexers.LassoLexer(), name: "Lasso", alias: ["lasso", "lassoscript"], filenames: ["*.lasso", "*.lasso[89]"], mimeTypes: ["text/x-lasso"])
        public static var lassoXml = Lexer(lexers.LassoXmlLexer(), name: "XML+Lasso", alias: ["xml+lasso"], filenames: [], mimeTypes: ["application/xml+lasso"])
        public static var lean = Lexer(lexers.LeanLexer(), name: "Lean", alias: ["lean"], filenames: ["*.lean"], mimeTypes: ["text/x-lean"])
        public static var lessCss = Lexer(lexers.LessCssLexer(), name: "LessCss", alias: ["less"], filenames: ["*.less"], mimeTypes: ["text/x-less-css"])
        public static var lighttpdConf = Lexer(lexers.LighttpdConfLexer(), name: "Lighttpd configuration file", alias: ["lighty", "lighttpd"], filenames: [], mimeTypes: ["text/x-lighttpd-conf"])
        public static var limbo = Lexer(lexers.LimboLexer(), name: "Limbo", alias: ["limbo"], filenames: ["*.b"], mimeTypes: ["text/limbo"])
        public static var liquid = Lexer(lexers.LiquidLexer(), name: "liquid", alias: ["liquid"], filenames: ["*.liquid"], mimeTypes: [])
        public static var literateAgda = Lexer(lexers.LiterateAgdaLexer(), name: "Literate Agda", alias: ["lagda", "literate-agda"], filenames: ["*.lagda"], mimeTypes: ["text/x-literate-agda"])
        public static var literateCryptol = Lexer(lexers.LiterateCryptolLexer(), name: "Literate Cryptol", alias: ["lcry", "literate-cryptol", "lcryptol"], filenames: ["*.lcry"], mimeTypes: ["text/x-literate-cryptol"])
        public static var literateHaskell = Lexer(lexers.LiterateHaskellLexer(), name: "Literate Haskell", alias: ["lhs", "literate-haskell", "lhaskell"], filenames: ["*.lhs"], mimeTypes: ["text/x-literate-haskell"])
        public static var literateIdris = Lexer(lexers.LiterateIdrisLexer(), name: "Literate Idris", alias: ["lidr", "literate-idris", "lidris"], filenames: ["*.lidr"], mimeTypes: ["text/x-literate-idris"])
        public static var liveScript = Lexer(lexers.LiveScriptLexer(), name: "LiveScript", alias: ["live-script", "livescript"], filenames: ["*.ls"], mimeTypes: ["text/livescript"])
        public static var llvm = Lexer(lexers.LlvmLexer(), name: "LLVM", alias: ["llvm"], filenames: ["*.ll"], mimeTypes: ["text/x-llvm"])
        public static var logos = Lexer(lexers.LogosLexer(), name: "Logos", alias: ["logos"], filenames: ["*.x", "*.xi", "*.xm", "*.xmi"], mimeTypes: ["text/x-logos"])
        public static var logtalk = Lexer(lexers.LogtalkLexer(), name: "Logtalk", alias: ["logtalk"], filenames: ["*.lgt", "*.logtalk"], mimeTypes: ["text/x-logtalk"])
        public static var lua = Lexer(lexers.LuaLexer(), name: "Lua", alias: ["lua"], filenames: ["*.lua", "*.wlua"], mimeTypes: ["text/x-lua", "application/x-lua"])
        public static var mOOCode = Lexer(lexers.MOOCodeLexer(), name: "MOOCode", alias: ["moocode", "moo"], filenames: ["*.moo"], mimeTypes: ["text/x-moocode"])
        public static var mSDOSSession = Lexer(lexers.MSDOSSessionLexer(), name: "MSDOS Session", alias: ["doscon"], filenames: [], mimeTypes: [])
        public static var makefile = Lexer(lexers.MakefileLexer(), name: "Makefile", alias: ["make", "makefile", "mf", "bsdmake"], filenames: ["*.mak", "*.mk", "Makefile", "makefile", "Makefile.*", "GNUmakefile"], mimeTypes: ["text/x-makefile"])
        public static var makoCss = Lexer(lexers.MakoCssLexer(), name: "CSS+Mako", alias: ["css+mako"], filenames: [], mimeTypes: ["text/css+mako"])
        public static var makoHtml = Lexer(lexers.MakoHtmlLexer(), name: "HTML+Mako", alias: ["html+mako"], filenames: [], mimeTypes: ["text/html+mako"])
        public static var makoJavascript = Lexer(lexers.MakoJavascriptLexer(), name: "JavaScript+Mako", alias: ["js+mako", "javascript+mako"], filenames: [], mimeTypes: ["application/x-javascript+mako", "text/x-javascript+mako", "text/javascript+mako"])
        public static var mako = Lexer(lexers.MakoLexer(), name: "Mako", alias: ["mako"], filenames: ["*.mao"], mimeTypes: ["application/x-mako"])
        public static var makoXml = Lexer(lexers.MakoXmlLexer(), name: "XML+Mako", alias: ["xml+mako"], filenames: [], mimeTypes: ["application/xml+mako"])
        public static var maql = Lexer(lexers.MaqlLexer(), name: "MAQL", alias: ["maql"], filenames: ["*.maql"], mimeTypes: ["text/x-gooddata-maql", "application/x-gooddata-maql"])
        public static var markdown = Lexer(lexers.MarkdownLexer(), name: "markdown", alias: ["md"], filenames: ["*.md"], mimeTypes: ["text/x-markdown"])
        public static var mask = Lexer(lexers.MaskLexer(), name: "Mask", alias: ["mask"], filenames: ["*.mask"], mimeTypes: ["text/x-mask"])
        public static var mason = Lexer(lexers.MasonLexer(), name: "Mason", alias: ["mason"], filenames: ["*.m", "*.mhtml", "*.mc", "*.mi", "autohandler", "dhandler"], mimeTypes: ["application/x-mason"])
        public static var mathematica = Lexer(lexers.MathematicaLexer(), name: "Mathematica", alias: ["mathematica", "mma", "nb"], filenames: ["*.nb", "*.cdf", "*.nbp", "*.ma"], mimeTypes: ["application/mathematica", "application/vnd.wolfram.mathematica", "application/vnd.wolfram.mathematica.package", "application/vnd.wolfram.cdf"])
        public static var matlab = Lexer(lexers.MatlabLexer(), name: "Matlab", alias: ["matlab"], filenames: ["*.m"], mimeTypes: ["text/matlab"])
        public static var matlabSession = Lexer(lexers.MatlabSessionLexer(), name: "Matlab session", alias: ["matlabsession"], filenames: [], mimeTypes: [])
        public static var miniD = Lexer(lexers.MiniDLexer(), name: "MiniD", alias: ["minid"], filenames: [], mimeTypes: ["text/x-minidsrc"])
        public static var modelica = Lexer(lexers.ModelicaLexer(), name: "Modelica", alias: ["modelica"], filenames: ["*.mo"], mimeTypes: ["text/x-modelica"])
        public static var moinWiki = Lexer(lexers.MoinWikiLexer(), name: "MoinMoin/Trac Wiki markup", alias: ["trac-wiki", "moin"], filenames: [], mimeTypes: ["text/x-trac-wiki"])
        public static var monkey = Lexer(lexers.MonkeyLexer(), name: "Monkey", alias: ["monkey"], filenames: ["*.monkey"], mimeTypes: ["text/x-monkey"])
        public static var monte = Lexer(lexers.MonteLexer(), name: "Monte", alias: ["monte"], filenames: ["*.mt"], mimeTypes: [])
        public static var moonScript = Lexer(lexers.MoonScriptLexer(), name: "MoonScript", alias: ["moon", "moonscript"], filenames: ["*.moon"], mimeTypes: ["text/x-moonscript", "application/x-moonscript"])
        public static var mozPreprocCss = Lexer(lexers.MozPreprocCssLexer(), name: "CSS+mozpreproc", alias: ["css+mozpreproc"], filenames: ["*.css.in"], mimeTypes: [])
        public static var mozPreprocHash = Lexer(lexers.MozPreprocHashLexer(), name: "mozhashpreproc", alias: ["mozhashpreproc"], filenames: [], mimeTypes: [])
        public static var mozPreprocJavascript = Lexer(lexers.MozPreprocJavascriptLexer(), name: "Javascript+mozpreproc", alias: ["javascript+mozpreproc"], filenames: ["*.js.in"], mimeTypes: [])
        public static var mozPreprocPercent = Lexer(lexers.MozPreprocPercentLexer(), name: "mozpercentpreproc", alias: ["mozpercentpreproc"], filenames: [], mimeTypes: [])
        public static var mozPreprocXul = Lexer(lexers.MozPreprocXulLexer(), name: "XUL+mozpreproc", alias: ["xul+mozpreproc"], filenames: ["*.xul.in"], mimeTypes: [])
        public static var mql = Lexer(lexers.MqlLexer(), name: "MQL", alias: ["mql", "mq4", "mq5", "mql4", "mql5"], filenames: ["*.mq4", "*.mq5", "*.mqh"], mimeTypes: ["text/x-mql"])
        public static var mscgen = Lexer(lexers.MscgenLexer(), name: "Mscgen", alias: ["mscgen", "msc"], filenames: ["*.msc"], mimeTypes: [])
        public static var muPAD = Lexer(lexers.MuPADLexer(), name: "MuPAD", alias: ["mupad"], filenames: ["*.mu"], mimeTypes: [])
        public static var mxml = Lexer(lexers.MxmlLexer(), name: "MXML", alias: ["mxml"], filenames: ["*.mxml"], mimeTypes: [])
        public static var mySql = Lexer(lexers.MySqlLexer(), name: "MySQL", alias: ["mysql"], filenames: [], mimeTypes: ["text/x-mysql"])
        public static var myghtyCss = Lexer(lexers.MyghtyCssLexer(), name: "CSS+Myghty", alias: ["css+myghty"], filenames: [], mimeTypes: ["text/css+myghty"])
        public static var myghtyHtml = Lexer(lexers.MyghtyHtmlLexer(), name: "HTML+Myghty", alias: ["html+myghty"], filenames: [], mimeTypes: ["text/html+myghty"])
        public static var myghtyJavascript = Lexer(lexers.MyghtyJavascriptLexer(), name: "JavaScript+Myghty", alias: ["js+myghty", "javascript+myghty"], filenames: [], mimeTypes: ["application/x-javascript+myghty", "text/x-javascript+myghty", "text/javascript+mygthy"])
        public static var myghty = Lexer(lexers.MyghtyLexer(), name: "Myghty", alias: ["myghty"], filenames: ["*.myt", "autodelegate"], mimeTypes: ["application/x-myghty"])
        public static var myghtyXml = Lexer(lexers.MyghtyXmlLexer(), name: "XML+Myghty", alias: ["xml+myghty"], filenames: [], mimeTypes: ["application/xml+myghty"])
        public static var nCL = Lexer(lexers.NCLLexer(), name: "NCL", alias: ["ncl"], filenames: ["*.ncl"], mimeTypes: ["text/ncl"])
        public static var nSIS = Lexer(lexers.NSISLexer(), name: "NSIS", alias: ["nsis", "nsi", "nsh"], filenames: ["*.nsi", "*.nsh"], mimeTypes: ["text/x-nsis"])
        public static var nasm = Lexer(lexers.NasmLexer(), name: "NASM", alias: ["nasm"], filenames: ["*.asm", "*.ASM"], mimeTypes: ["text/x-nasm"])
        public static var nasmObjdump = Lexer(lexers.NasmObjdumpLexer(), name: "objdump-nasm", alias: ["objdump-nasm"], filenames: ["*.objdump-intel"], mimeTypes: ["text/x-nasm-objdump"])
        public static var nemerle = Lexer(lexers.NemerleLexer(), name: "Nemerle", alias: ["nemerle"], filenames: ["*.n"], mimeTypes: ["text/x-nemerle"])
        public static var nesC = Lexer(lexers.NesCLexer(), name: "nesC", alias: ["nesc"], filenames: ["*.nc"], mimeTypes: ["text/x-nescsrc"])
        public static var newLisp = Lexer(lexers.NewLispLexer(), name: "NewLisp", alias: ["newlisp"], filenames: ["*.lsp", "*.nl", "*.kif"], mimeTypes: ["text/x-newlisp", "application/x-newlisp"])
        public static var newspeak = Lexer(lexers.NewspeakLexer(), name: "Newspeak", alias: ["newspeak"], filenames: ["*.ns2"], mimeTypes: ["text/x-newspeak"])
        public static var nginxConf = Lexer(lexers.NginxConfLexer(), name: "Nginx configuration file", alias: ["nginx"], filenames: ["nginx.conf"], mimeTypes: ["text/x-nginx-conf"])
        public static var nimrod = Lexer(lexers.NimrodLexer(), name: "Nimrod", alias: ["nim", "nimrod"], filenames: ["*.nim", "*.nimrod"], mimeTypes: ["text/x-nim"])
        public static var nit = Lexer(lexers.NitLexer(), name: "Nit", alias: ["nit"], filenames: ["*.nit"], mimeTypes: [])
        public static var nix = Lexer(lexers.NixLexer(), name: "Nix", alias: ["nixos", "nix"], filenames: ["*.nix"], mimeTypes: ["text/x-nix"])
        public static var nuSMV = Lexer(lexers.NuSMVLexer(), name: "NuSMV", alias: ["nusmv"], filenames: ["*.smv"], mimeTypes: [])
        public static var numPy = Lexer(lexers.NumPyLexer(), name: "NumPy", alias: ["numpy"], filenames: [], mimeTypes: [])
        public static var objdump = Lexer(lexers.ObjdumpLexer(), name: "objdump", alias: ["objdump"], filenames: ["*.objdump"], mimeTypes: ["text/x-objdump"])
        public static var objectiveC = Lexer(lexers.ObjectiveCLexer(), name: "Objective-C", alias: ["objective-c", "objectivec", "obj-c", "objc"], filenames: ["*.m", "*.h"], mimeTypes: ["text/x-objective-c"])
        public static var objectiveCpp = Lexer(lexers.ObjectiveCppLexer(), name: "Objective-C++", alias: ["objective-c++", "objectivec++", "obj-c++", "objc++"], filenames: ["*.mm", "*.hh"], mimeTypes: ["text/x-objective-c++"])
        public static var objectiveJ = Lexer(lexers.ObjectiveJLexer(), name: "Objective-J", alias: ["objective-j", "objectivej", "obj-j", "objj"], filenames: ["*.j"], mimeTypes: ["text/x-objective-j"])
        public static var ocaml = Lexer(lexers.OcamlLexer(), name: "OCaml", alias: ["ocaml"], filenames: ["*.ml", "*.mli", "*.mll", "*.mly"], mimeTypes: ["text/x-ocaml"])
        public static var octave = Lexer(lexers.OctaveLexer(), name: "Octave", alias: ["octave"], filenames: ["*.m"], mimeTypes: ["text/octave"])
        public static var odin = Lexer(lexers.OdinLexer(), name: "ODIN", alias: ["odin"], filenames: ["*.odin"], mimeTypes: ["text/odin"])
        public static var ooc = Lexer(lexers.OocLexer(), name: "Ooc", alias: ["ooc"], filenames: ["*.ooc"], mimeTypes: ["text/x-ooc"])
        public static var opa = Lexer(lexers.OpaLexer(), name: "Opa", alias: ["opa"], filenames: ["*.opa"], mimeTypes: ["text/x-opa"])
        public static var openEdge = Lexer(lexers.OpenEdgeLexer(), name: "OpenEdge ABL", alias: ["openedge", "abl", "progress"], filenames: ["*.p", "*.cls"], mimeTypes: ["text/x-openedge", "application/x-openedge"])
        public static var pacmanConf = Lexer(lexers.PacmanConfLexer(), name: "PacmanConf", alias: ["pacmanconf"], filenames: ["pacman.conf"], mimeTypes: [])
        public static var pan = Lexer(lexers.PanLexer(), name: "Pan", alias: ["pan"], filenames: ["*.pan"], mimeTypes: [])
        public static var paraSail = Lexer(lexers.ParaSailLexer(), name: "ParaSail", alias: ["parasail"], filenames: ["*.psi", "*.psl"], mimeTypes: ["text/x-parasail"])
        public static var pawn = Lexer(lexers.PawnLexer(), name: "Pawn", alias: ["pawn"], filenames: ["*.p", "*.pwn", "*.inc"], mimeTypes: ["text/x-pawn"])
        public static var perl = Lexer(lexers.PerlLexer(), name: "Perl", alias: ["perl", "pl"], filenames: ["*.pl", "*.pm", "*.t"], mimeTypes: ["text/x-perl", "application/x-perl"])
        public static var php = Lexer(lexers.PhpLexer(), name: "PHP", alias: ["php", "php3", "php4", "php5"], filenames: ["*.php", "*.php[345]", "*.inc"], mimeTypes: ["text/x-php"])
        public static var pig = Lexer(lexers.PigLexer(), name: "Pig", alias: ["pig"], filenames: ["*.pig"], mimeTypes: ["text/x-pig"])
        public static var pike = Lexer(lexers.PikeLexer(), name: "Pike", alias: ["pike"], filenames: ["*.pike", "*.pmod"], mimeTypes: ["text/x-pike"])
        public static var pkgConfig = Lexer(lexers.PkgConfigLexer(), name: "PkgConfig", alias: ["pkgconfig"], filenames: ["*.pc"], mimeTypes: [])
        public static var plPgsql = Lexer(lexers.PlPgsqlLexer(), name: "PL/pgSQL", alias: ["plpgsql"], filenames: [], mimeTypes: ["text/x-plpgsql"])
        public static var postScript = Lexer(lexers.PostScriptLexer(), name: "PostScript", alias: ["postscript", "postscr"], filenames: ["*.ps", "*.eps"], mimeTypes: ["application/postscript"])
        public static var postgresConsole = Lexer(lexers.PostgresConsoleLexer(), name: "PostgreSQL console (psql)", alias: ["psql", "postgresql-console", "postgres-console"], filenames: [], mimeTypes: ["text/x-postgresql-psql"])
        public static var postgres = Lexer(lexers.PostgresLexer(), name: "PostgreSQL SQL dialect", alias: ["postgresql", "postgres"], filenames: [], mimeTypes: ["text/x-postgresql"])
        public static var povray = Lexer(lexers.PovrayLexer(), name: "POVRay", alias: ["pov"], filenames: ["*.pov", "*.inc"], mimeTypes: ["text/x-povray"])
        public static var powerShell = Lexer(lexers.PowerShellLexer(), name: "PowerShell", alias: ["ac", "asnp", "cat", "cd", "cfs", "chdir", "clc", "clear", "clhy", "cli", "clp", "cls", "clv", "cnsn", "compare", "copy", "cp", "cpi", "cpp", "curl", "cvpa", "dbp", "del", "diff", "dir", "dnsn", "ebp", "echo", "epal", "epcsv", "epsn", "erase", "etsn", "exsn", "fc", "fhx", "fl", "foreach", "ft", "fw", "gal", "gbp", "gc", "gci", "gcm", "gcs", "gdr", "ghy", "gi", "gjb", "gl", "gm", "gmo", "gp", "gps", "gpv", "group", "gsn", "gsnp", "gsv", "gu", "gv", "gwmi", "h", "history", "icm", "iex", "ihy", "ii", "ipal", "ipcsv", "ipmo", "ipsn", "irm", "ise", "iwmi", "iwr", "kill", "lp", "ls", "man", "md", "measure", "mi", "mount", "move", "mp", "mv", "nal", "ndr", "ni", "nmo", "npssc", "nsn", "nv", "ogv", "oh", "popd", "ps", "pushd", "pwd", "rbp", "rcjb", "rcsn", "rdr", "ren", "ri", "rjb", "rm", "rmdir", "rmo", "rni", "rnp", "rp", "rsn", "rsnp", "rujb", "rv", "rvpa", "rwmi", "sajb", "sal", "saps", "sasv", "sbp", "select", "set", "shcm", "si", "sl", "sleep", "sls", "sort", "sp", "spjb", "spps", "spsv", "start", "sujb", "sv", "swmi", "tee", "trcm", "type", "wget", "where", "wjb", "write"], filenames: ["*.ps1", "*.psm1"], mimeTypes: ["text/x-powershell"])
        public static var powerShellSession = Lexer(lexers.PowerShellSessionLexer(), name: "PowerShell Session", alias: ["ps1con"], filenames: [], mimeTypes: [])
        public static var praat = Lexer(lexers.PraatLexer(), name: "Praat", alias: ["praat"], filenames: ["*.praat", "*.proc", "*.psc"], mimeTypes: [])
        public static var prolog = Lexer(lexers.PrologLexer(), name: "Prolog", alias: ["prolog"], filenames: ["*.ecl", "*.prolog", "*.pro", "*.pl"], mimeTypes: ["text/x-prolog"])
        public static var properties = Lexer(lexers.PropertiesLexer(), name: "Properties", alias: ["properties", "jproperties"], filenames: ["*.properties"], mimeTypes: ["text/x-java-properties"])
        public static var protoBuf = Lexer(lexers.ProtoBufLexer(), name: "Protocol Buffer", alias: ["protobuf", "proto"], filenames: ["*.proto"], mimeTypes: [])
        public static var pug = Lexer(lexers.PugLexer(), name: "Pug", alias: ["pug", "jade"], filenames: ["*.pug", "*.jade"], mimeTypes: ["text/x-pug", "text/x-jade"])
        public static var puppet = Lexer(lexers.PuppetLexer(), name: "Puppet", alias: ["puppet"], filenames: ["*.pp"], mimeTypes: [])
        public static var pyPyLog = Lexer(lexers.PyPyLogLexer(), name: "PyPy Log", alias: ["pypylog", "pypy"], filenames: ["*.pypylog"], mimeTypes: ["application/x-pypylog"])
        public static var pythonConsole = Lexer(lexers.PythonConsoleLexer(), name: "Python console session", alias: ["pycon"], filenames: [], mimeTypes: ["text/x-python-doctest"])
        public static var python = Lexer(lexers.PythonLexer(), name: "Python", alias: ["python", "py", "sage"], filenames: ["*.py", "*.pyw", "*.sc", "SConstruct", "SConscript", "*.tac", "*.sage"], mimeTypes: ["text/x-python", "application/x-python"])
        public static var pythonTraceback = Lexer(lexers.PythonTracebackLexer(), name: "Python Traceback", alias: ["pytb"], filenames: ["*.pytb"], mimeTypes: ["text/x-python-traceback"])
        public static var qBasic = Lexer(lexers.QBasicLexer(), name: "QBasic", alias: ["qbasic", "basic"], filenames: ["*.BAS", "*.bas"], mimeTypes: ["text/basic"])
        public static var qVTo = Lexer(lexers.QVToLexer(), name: "QVTO", alias: ["qvto", "qvt"], filenames: ["*.qvto"], mimeTypes: [])
        public static var qml = Lexer(lexers.QmlLexer(), name: "QML", alias: ["qml", "qbs"], filenames: ["*.qml", "*.qbs"], mimeTypes: ["application/x-qml", "application/x-qt.qbs+qml"])
        public static var rConsole = Lexer(lexers.RConsoleLexer(), name: "RConsole", alias: ["rconsole", "rout"], filenames: ["*.Rout"], mimeTypes: [])
        public static var rNCCompact = Lexer(lexers.RNCCompactLexer(), name: "Relax-NG Compact", alias: ["rnc", "rng-compact"], filenames: ["*.rnc"], mimeTypes: [])
        public static var rPMSpec = Lexer(lexers.RPMSpecLexer(), name: "RPMSpec", alias: ["spec"], filenames: ["*.spec"], mimeTypes: ["text/x-rpm-spec"])
        public static var racket = Lexer(lexers.RacketLexer(), name: "Racket", alias: ["racket", "rkt"], filenames: ["*.rkt", "*.rktd", "*.rktl"], mimeTypes: ["text/x-racket", "application/x-racket"])
        public static var ragelC = Lexer(lexers.RagelCLexer(), name: "Ragel in C Host", alias: ["ragel-c"], filenames: ["*.rl"], mimeTypes: [])
        public static var ragelCpp = Lexer(lexers.RagelCppLexer(), name: "Ragel in CPP Host", alias: ["ragel-cpp"], filenames: ["*.rl"], mimeTypes: [])
        public static var ragelD = Lexer(lexers.RagelDLexer(), name: "Ragel in D Host", alias: ["ragel-d"], filenames: ["*.rl"], mimeTypes: [])
        public static var ragelEmbedded = Lexer(lexers.RagelEmbeddedLexer(), name: "Embedded Ragel", alias: ["ragel-em"], filenames: ["*.rl"], mimeTypes: [])
        public static var ragelJava = Lexer(lexers.RagelJavaLexer(), name: "Ragel in Java Host", alias: ["ragel-java"], filenames: ["*.rl"], mimeTypes: [])
        public static var ragel = Lexer(lexers.RagelLexer(), name: "Ragel", alias: ["ragel"], filenames: [], mimeTypes: [])
        public static var ragelObjectiveC = Lexer(lexers.RagelObjectiveCLexer(), name: "Ragel in Objective C Host", alias: ["ragel-objc"], filenames: ["*.rl"], mimeTypes: [])
        public static var ragelRuby = Lexer(lexers.RagelRubyLexer(), name: "Ragel in Ruby Host", alias: ["ragel-ruby", "ragel-rb"], filenames: ["*.rl"], mimeTypes: [])
        public static var rawToken = Lexer(lexers.RawTokenLexer(), name: "Raw token data", alias: ["raw"], filenames: [], mimeTypes: ["application/x-pygments-tokens"])
        public static var rd = Lexer(lexers.RdLexer(), name: "Rd", alias: ["rd"], filenames: ["*.Rd"], mimeTypes: ["text/x-r-doc"])
        public static var rebol = Lexer(lexers.RebolLexer(), name: "REBOL", alias: ["rebol"], filenames: ["*.r", "*.r3", "*.reb"], mimeTypes: ["text/x-rebol"])
        public static var red = Lexer(lexers.RedLexer(), name: "Red", alias: ["red", "red/system"], filenames: ["*.red", "*.reds"], mimeTypes: ["text/x-red", "text/x-red-system"])
        public static var redcode = Lexer(lexers.RedcodeLexer(), name: "Redcode", alias: ["redcode"], filenames: ["*.cw"], mimeTypes: [])
        public static var regedit = Lexer(lexers.RegeditLexer(), name: "reg", alias: ["registry"], filenames: ["*.reg"], mimeTypes: ["text/x-windows-registry"])
        public static var resource = Lexer(lexers.ResourceLexer(), name: "ResourceBundle", alias: ["resource", "resourcebundle"], filenames: ["*.txt"], mimeTypes: [])
        public static var rexx = Lexer(lexers.RexxLexer(), name: "Rexx", alias: ["rexx", "arexx"], filenames: ["*.rexx", "*.rex", "*.rx", "*.arexx"], mimeTypes: ["text/x-rexx"])
        public static var rhtml = Lexer(lexers.RhtmlLexer(), name: "RHTML", alias: ["rhtml", "html+erb", "html+ruby"], filenames: ["*.rhtml"], mimeTypes: ["text/html+ruby"])
        public static var roboconfGraph = Lexer(lexers.RoboconfGraphLexer(), name: "Roboconf Graph", alias: ["roboconf-graph"], filenames: ["*.graph"], mimeTypes: [])
        public static var roboconfInstances = Lexer(lexers.RoboconfInstancesLexer(), name: "Roboconf Instances", alias: ["roboconf-instances"], filenames: ["*.instances"], mimeTypes: [])
        public static var robotFramework = Lexer(lexers.RobotFrameworkLexer(), name: "RobotFramework", alias: ["robotframework"], filenames: ["*.txt", "*.robot"], mimeTypes: ["text/x-robotframework"])
        public static var rql = Lexer(lexers.RqlLexer(), name: "RQL", alias: ["rql"], filenames: ["*.rql"], mimeTypes: ["text/x-rql"])
        public static var rsl = Lexer(lexers.RslLexer(), name: "RSL", alias: ["rsl"], filenames: ["*.rsl"], mimeTypes: ["text/rsl"])
        public static var rst = Lexer(lexers.RstLexer(), name: "reStructuredText", alias: ["rst", "rest", "restructuredtext"], filenames: ["*.rst", "*.rest"], mimeTypes: ["text/x-rst", "text/prs.fallenstein.rst"])
        public static var rts = Lexer(lexers.RtsLexer(), name: "TrafficScript", alias: ["rts", "trafficscript"], filenames: ["*.rts"], mimeTypes: [])
        public static var rubyConsole = Lexer(lexers.RubyConsoleLexer(), name: "Ruby irb session", alias: ["rbcon", "irb"], filenames: [], mimeTypes: ["text/x-ruby-shellsession"])
        public static var ruby = Lexer(lexers.RubyLexer(), name: "Ruby", alias: ["rb", "ruby", "duby"], filenames: ["*.rb", "*.rbw", "Rakefile", "*.rake", "*.gemspec", "*.rbx", "*.duby", "Gemfile"], mimeTypes: ["text/x-ruby", "application/x-ruby"])
        public static var rust = Lexer(lexers.RustLexer(), name: "Rust", alias: ["rust", "rs"], filenames: ["*.rs", "*.rs.in"], mimeTypes: ["text/rust"])
        public static var sAS = Lexer(lexers.SASLexer(), name: "SAS", alias: ["sas"], filenames: ["*.SAS", "*.sas"], mimeTypes: ["text/x-sas", "text/sas", "application/x-sas"])
        public static var s = Lexer(lexers.SLexer(), name: "S", alias: ["splus", "s", "r"], filenames: ["*.S", "*.R", ".Rhistory", ".Rprofile", ".Renviron"], mimeTypes: ["text/S-plus", "text/S", "text/x-r-source", "text/x-r", "text/x-R", "text/x-r-history", "text/x-r-profile"])
        public static var sML = Lexer(lexers.SMLLexer(), name: "Standard ML", alias: ["sml"], filenames: ["*.sml", "*.sig", "*.fun"], mimeTypes: ["text/x-standardml", "application/x-standardml"])
        public static var sass = Lexer(lexers.SassLexer(), name: "Sass", alias: ["sass"], filenames: ["*.sass"], mimeTypes: ["text/x-sass"])
        public static var scala = Lexer(lexers.ScalaLexer(), name: "Scala", alias: ["scala"], filenames: ["*.scala"], mimeTypes: ["text/x-scala"])
        public static var scaml = Lexer(lexers.ScamlLexer(), name: "Scaml", alias: ["scaml"], filenames: ["*.scaml"], mimeTypes: ["text/x-scaml"])
        public static var scheme = Lexer(lexers.SchemeLexer(), name: "Scheme", alias: ["scheme", "scm"], filenames: ["*.scm", "*.ss"], mimeTypes: ["text/x-scheme", "application/x-scheme"])
        public static var scilab = Lexer(lexers.ScilabLexer(), name: "Scilab", alias: ["scilab"], filenames: ["*.sci", "*.sce", "*.tst"], mimeTypes: ["text/scilab"])
        public static var scss = Lexer(lexers.ScssLexer(), name: "SCSS", alias: ["scss"], filenames: ["*.scss"], mimeTypes: ["text/x-scss"])
        public static var shen = Lexer(lexers.ShenLexer(), name: "Shen", alias: ["shen"], filenames: ["*.shen"], mimeTypes: ["text/x-shen", "application/x-shen"])
        public static var silver = Lexer(lexers.SilverLexer(), name: "Silver", alias: ["silver"], filenames: ["*.sil", "*.vpr"], mimeTypes: [])
        public static var slim = Lexer(lexers.SlimLexer(), name: "Slim", alias: ["slim"], filenames: ["*.slim"], mimeTypes: ["text/x-slim"])
        public static var smali = Lexer(lexers.SmaliLexer(), name: "Smali", alias: ["smali"], filenames: ["*.smali"], mimeTypes: ["text/smali"])
        public static var smalltalk = Lexer(lexers.SmalltalkLexer(), name: "Smalltalk", alias: ["smalltalk", "squeak", "st"], filenames: ["*.st"], mimeTypes: ["text/x-smalltalk"])
        public static var smarty = Lexer(lexers.SmartyLexer(), name: "Smarty", alias: ["smarty"], filenames: ["*.tpl"], mimeTypes: ["application/x-smarty"])
        public static var snobol = Lexer(lexers.SnobolLexer(), name: "Snobol", alias: ["snobol"], filenames: ["*.snobol"], mimeTypes: ["text/x-snobol"])
        public static var snowball = Lexer(lexers.SnowballLexer(), name: "Snowball", alias: ["snowball"], filenames: ["*.sbl"], mimeTypes: [])
        public static var sourcePawn = Lexer(lexers.SourcePawnLexer(), name: "SourcePawn", alias: ["sp"], filenames: ["*.sp"], mimeTypes: ["text/x-sourcepawn"])
        public static var sourcesList = Lexer(lexers.SourcesListLexer(), name: "Debian Sourcelist", alias: ["sourceslist", "sources.list", "debsources"], filenames: ["sources.list"], mimeTypes: [])
        public static var sparql = Lexer(lexers.SparqlLexer(), name: "SPARQL", alias: ["sparql"], filenames: ["*.rq", "*.sparql"], mimeTypes: ["application/sparql-query"])
        public static var sql = Lexer(lexers.SqlLexer(), name: "SQL", alias: ["sql"], filenames: ["*.sql"], mimeTypes: ["text/x-sql"])
        public static var sqliteConsole = Lexer(lexers.SqliteConsoleLexer(), name: "sqlite3con", alias: ["sqlite3"], filenames: ["*.sqlite3-console"], mimeTypes: ["text/x-sqlite3-console"])
        public static var squidConf = Lexer(lexers.SquidConfLexer(), name: "SquidConf", alias: ["squidconf", "squid.conf", "squid"], filenames: ["squid.conf"], mimeTypes: ["text/x-squidconf"])
        public static var ssp = Lexer(lexers.SspLexer(), name: "Scalate Server Page", alias: ["ssp"], filenames: ["*.ssp"], mimeTypes: ["application/x-ssp"])
        public static var stan = Lexer(lexers.StanLexer(), name: "Stan", alias: ["stan"], filenames: ["*.stan"], mimeTypes: [])
        public static var stata = Lexer(lexers.StataLexer(), name: "Stata", alias: ["stata", "do"], filenames: ["*.do", "*.ado"], mimeTypes: ["text/x-stata", "text/stata", "application/x-stata"])
        public static var superCollider = Lexer(lexers.SuperColliderLexer(), name: "SuperCollider", alias: ["sc", "supercollider"], filenames: ["*.sc", "*.scd"], mimeTypes: ["application/supercollider", "text/supercollider"])
        public static var swift = Lexer(lexers.SwiftLexer(), name: "Swift", alias: ["swift"], filenames: ["*.swift"], mimeTypes: ["text/x-swift"])
        public static var swig = Lexer(lexers.SwigLexer(), name: "SWIG", alias: ["swig"], filenames: ["*.swg", "*.i"], mimeTypes: ["text/swig"])
        public static var systemVerilog = Lexer(lexers.SystemVerilogLexer(), name: "systemverilog", alias: ["systemverilog", "sv"], filenames: ["*.sv", "*.svh"], mimeTypes: ["text/x-systemverilog"])
        public static var tAP = Lexer(lexers.TAPLexer(), name: "TAP", alias: ["tap"], filenames: ["*.tap"], mimeTypes: [])
        public static var tasm = Lexer(lexers.TasmLexer(), name: "TASM", alias: ["tasm"], filenames: ["*.asm", "*.ASM", "*.tasm"], mimeTypes: ["text/x-tasm"])
        public static var tcl = Lexer(lexers.TclLexer(), name: "Tcl", alias: ["tcl"], filenames: ["*.tcl", "*.rvt"], mimeTypes: ["text/x-tcl", "text/x-script.tcl", "application/x-tcl"])
        public static var tcsh = Lexer(lexers.TcshLexer(), name: "Tcsh", alias: ["tcsh", "csh"], filenames: ["*.tcsh", "*.csh"], mimeTypes: ["application/x-csh"])
        public static var tcshSession = Lexer(lexers.TcshSessionLexer(), name: "Tcsh Session", alias: ["tcshcon"], filenames: [], mimeTypes: [])
        public static var teaTemplate = Lexer(lexers.TeaTemplateLexer(), name: "Tea", alias: ["tea"], filenames: ["*.tea"], mimeTypes: ["text/x-tea"])
        public static var termcap = Lexer(lexers.TermcapLexer(), name: "Termcap", alias: ["termcap"], filenames: ["termcap", "termcap.src"], mimeTypes: [])
        public static var terminfo = Lexer(lexers.TerminfoLexer(), name: "Terminfo", alias: ["terminfo"], filenames: ["terminfo", "terminfo.src"], mimeTypes: [])
        public static var terraform = Lexer(lexers.TerraformLexer(), name: "Terraform", alias: ["terraform", "tf"], filenames: ["*.tf"], mimeTypes: ["application/x-tf", "application/x-terraform"])
        public static var tex = Lexer(lexers.TexLexer(), name: "TeX", alias: ["tex", "latex"], filenames: ["*.tex", "*.aux", "*.toc"], mimeTypes: ["text/x-tex", "text/x-latex"])
        public static var text = Lexer(lexers.TextLexer(), name: "Text only", alias: ["text"], filenames: ["*.txt"], mimeTypes: ["text/plain"])
        public static var thrift = Lexer(lexers.ThriftLexer(), name: "Thrift", alias: ["thrift"], filenames: ["*.thrift"], mimeTypes: ["application/x-thrift"])
        public static var todotxt = Lexer(lexers.TodotxtLexer(), name: "Todotxt", alias: ["todotxt"], filenames: ["todo.txt", "*.todotxt"], mimeTypes: ["text/x-todo"])
        public static var transactSql = Lexer(lexers.TransactSqlLexer(), name: "Transact-SQL", alias: ["tsql", "t-sql"], filenames: ["*.sql"], mimeTypes: ["text/x-tsql"])
        public static var treetop = Lexer(lexers.TreetopLexer(), name: "Treetop", alias: ["treetop"], filenames: ["*.treetop", "*.tt"], mimeTypes: [])
        public static var turtle = Lexer(lexers.TurtleLexer(), name: "Turtle", alias: ["turtle"], filenames: ["*.ttl"], mimeTypes: ["text/turtle", "application/x-turtle"])
        public static var twigHtml = Lexer(lexers.TwigHtmlLexer(), name: "HTML+Twig", alias: ["html+twig"], filenames: ["*.twig"], mimeTypes: ["text/html+twig"])
        public static var twig = Lexer(lexers.TwigLexer(), name: "Twig", alias: ["twig"], filenames: [], mimeTypes: ["application/x-twig"])
        public static var typeScript = Lexer(lexers.TypeScriptLexer(), name: "TypeScript", alias: ["ts", "typescript"], filenames: ["*.ts", "*.tsx"], mimeTypes: ["text/x-typescript"])
        public static var typoScriptCssData = Lexer(lexers.TypoScriptCssDataLexer(), name: "TypoScriptCssData", alias: ["typoscriptcssdata"], filenames: [], mimeTypes: [])
        public static var typoScriptHtmlData = Lexer(lexers.TypoScriptHtmlDataLexer(), name: "TypoScriptHtmlData", alias: ["typoscripthtmldata"], filenames: [], mimeTypes: [])
        public static var typoScript = Lexer(lexers.TypoScriptLexer(), name: "TypoScript", alias: ["typoscript"], filenames: ["*.ts", "*.txt"], mimeTypes: ["text/x-typoscript"])
        public static var urbiscript = Lexer(lexers.UrbiscriptLexer(), name: "UrbiScript", alias: ["urbiscript"], filenames: ["*.u"], mimeTypes: ["application/x-urbiscript"])
        public static var vCL = Lexer(lexers.VCLLexer(), name: "VCL", alias: ["vcl"], filenames: ["*.vcl"], mimeTypes: ["text/x-vclsrc"])
        public static var vCLSnippet = Lexer(lexers.VCLSnippetLexer(), name: "VCLSnippets", alias: ["vclsnippets", "vclsnippet"], filenames: [], mimeTypes: ["text/x-vclsnippet"])
        public static var vCTreeStatus = Lexer(lexers.VCTreeStatusLexer(), name: "VCTreeStatus", alias: ["vctreestatus"], filenames: [], mimeTypes: [])
        public static var vGL = Lexer(lexers.VGLLexer(), name: "VGL", alias: ["vgl"], filenames: ["*.rpf"], mimeTypes: [])
        public static var vala = Lexer(lexers.ValaLexer(), name: "Vala", alias: ["vala", "vapi"], filenames: ["*.vala", "*.vapi"], mimeTypes: ["text/x-vala"])
        public static var vbNetAspx = Lexer(lexers.VbNetAspxLexer(), name: "aspx-vb", alias: ["aspx-vb"], filenames: ["*.aspx", "*.asax", "*.ascx", "*.ashx", "*.asmx", "*.axd"], mimeTypes: [])
        public static var vbNet = Lexer(lexers.VbNetLexer(), name: "VB.net", alias: ["vb.net", "vbnet"], filenames: ["*.vb", "*.bas"], mimeTypes: ["text/x-vbnet", "text/x-vba"])
        public static var velocityHtml = Lexer(lexers.VelocityHtmlLexer(), name: "HTML+Velocity", alias: ["html+velocity"], filenames: [], mimeTypes: ["text/html+velocity"])
        public static var velocity = Lexer(lexers.VelocityLexer(), name: "Velocity", alias: ["velocity"], filenames: ["*.vm", "*.fhtml"], mimeTypes: [])
        public static var velocityXml = Lexer(lexers.VelocityXmlLexer(), name: "XML+Velocity", alias: ["xml+velocity"], filenames: [], mimeTypes: ["application/xml+velocity"])
        public static var verilog = Lexer(lexers.VerilogLexer(), name: "verilog", alias: ["verilog", "v"], filenames: ["*.v"], mimeTypes: ["text/x-verilog"])
        public static var vhdl = Lexer(lexers.VhdlLexer(), name: "vhdl", alias: ["vhdl"], filenames: ["*.vhdl", "*.vhd"], mimeTypes: ["text/x-vhdl"])
        public static var vim = Lexer(lexers.VimLexer(), name: "VimL", alias: ["vim"], filenames: ["*.vim", ".vimrc", ".exrc", ".gvimrc", "_vimrc", "_exrc", "_gvimrc", "vimrc", "gvimrc"], mimeTypes: ["text/x-vim"])
        public static var wDiff = Lexer(lexers.WDiffLexer(), name: "WDiff", alias: ["wdiff"], filenames: ["*.wdiff"], mimeTypes: [])
        public static var whiley = Lexer(lexers.WhileyLexer(), name: "Whiley", alias: ["whiley"], filenames: ["*.whiley"], mimeTypes: ["text/x-whiley"])
        public static var xQuery = Lexer(lexers.XQueryLexer(), name: "XQuery", alias: ["xquery", "xqy", "xq", "xql", "xqm"], filenames: ["*.xqy", "*.xquery", "*.xq", "*.xql", "*.xqm"], mimeTypes: ["text/xquery", "application/xquery"])
        public static var xmlDjango = Lexer(lexers.XmlDjangoLexer(), name: "XML+Django/Jinja", alias: ["xml+django", "xml+jinja"], filenames: [], mimeTypes: ["application/xml+django", "application/xml+jinja"])
        public static var xmlErb = Lexer(lexers.XmlErbLexer(), name: "XML+Ruby", alias: ["xml+erb", "xml+ruby"], filenames: [], mimeTypes: ["application/xml+ruby"])
        public static var xml = Lexer(lexers.XmlLexer(), name: "XML", alias: ["xml"], filenames: ["*.xml", "*.xsl", "*.rss", "*.xslt", "*.xsd", "*.wsdl", "*.wsf"], mimeTypes: ["text/xml", "application/xml", "image/svg+xml", "application/rss+xml", "application/atom+xml"])
        public static var xmlPhp = Lexer(lexers.XmlPhpLexer(), name: "XML+PHP", alias: ["xml+php"], filenames: [], mimeTypes: ["application/xml+php"])
        public static var xmlSmarty = Lexer(lexers.XmlSmartyLexer(), name: "XML+Smarty", alias: ["xml+smarty"], filenames: [], mimeTypes: ["application/xml+smarty"])
        public static var xorg = Lexer(lexers.XorgLexer(), name: "Xorg", alias: ["xorg.conf"], filenames: ["xorg.conf"], mimeTypes: [])
        public static var xslt = Lexer(lexers.XsltLexer(), name: "XSLT", alias: ["xslt"], filenames: ["*.xsl", "*.xslt", "*.xpl"], mimeTypes: ["application/xsl+xml", "application/xslt+xml"])
        public static var xtend = Lexer(lexers.XtendLexer(), name: "Xtend", alias: ["xtend"], filenames: ["*.xtend"], mimeTypes: ["text/x-xtend"])
        public static var xtlang = Lexer(lexers.XtlangLexer(), name: "xtlang", alias: ["extempore"], filenames: ["*.xtm"], mimeTypes: [])
        public static var yamlJinja = Lexer(lexers.YamlJinjaLexer(), name: "YAML+Jinja", alias: ["yaml+jinja", "salt", "sls"], filenames: ["*.sls"], mimeTypes: ["text/x-yaml+jinja", "text/x-sls"])
        public static var yaml = Lexer(lexers.YamlLexer(), name: "YAML", alias: ["yaml"], filenames: ["*.yaml", "*.yml"], mimeTypes: ["text/x-yaml"])
        public static var zephir = Lexer(lexers.ZephirLexer(), name: "Zephir", alias: ["zephir"], filenames: ["*.zep"], mimeTypes: [])
        
        
    }
    
    public static func html(_ code: String, use lexer: Lexer) -> String {
        return "\(Pygments.pygments.highlight(code, lexer.pythonObject, Pygments.formatters.HtmlFormatter()))"
    }
}

