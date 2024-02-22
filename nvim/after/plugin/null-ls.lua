local null_ls = require("null-ls")
null_ls.setup({
    sources = {
        null_ls.builtins.diagnostics.pylint.with({
            command = "pylint",
            extra_args = {
                "--disable=C0103",
                "--disable=C0411",
                "--disable=C0413",
                "--disable=C0301",
                "--disable=C0114",
                "--disable=C0115",
                "--disable=C0116",
                "--disable=W0621",
                "--disable=C0206",
                "--disable=C0201",
            },
            diagnostics_postprocess = function(diagnostic)
                diagnostic.code = diagnostic.message_id
            end,
        })
    },
})
