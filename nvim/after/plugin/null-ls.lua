local null_ls = require("null-ls")
null_ls.setup({
    sources = {
        null_ls.builtins.diagnostics.pylint.with({
            command = "pylint",
            extra_args = {
                "--disable=C0103"
            },
            diagnostics_postprocess = function(diagnostic)
                diagnostic.code = diagnostic.message_id
            end,
        })
    },
})
