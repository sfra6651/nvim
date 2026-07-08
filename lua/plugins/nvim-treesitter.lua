return {
    "nvim-treesitter/nvim-treesitter",
    -- The old `master` branch is archived and incompatible with Neovim 0.12.
    -- `main` is the rewrite that supports Neovim 0.11+.
    branch = "main",

    dependencies = {
        "nvim-tree/nvim-web-devicons"
    },

    lazy = false,

    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter").setup()

        -- Parsers to keep installed. Installs asynchronously on first run and
        -- updates with `:TSUpdate`. (Replaces the old `ensure_installed`.)
        require("nvim-treesitter").install({
            "vimdoc", "javascript", "typescript", "tsx", "c", "lua", "rust",
            "jsdoc", "bash", "go", "toml", "wgsl",
        })

        -- On `main`, highlighting and indentation are no longer enabled via the
        -- config table — you start them per buffer. This turns them on whenever
        -- a parser is available for the buffer's filetype.
        vim.api.nvim_create_autocmd("FileType", {
            callback = function(args)
                local lang = vim.treesitter.language.get_lang(vim.bo[args.buf].filetype)
                if not lang then
                    return
                end

                local ok, added = pcall(vim.treesitter.language.add, lang)
                if not (ok and added) then
                    return
                end

                -- Tree-sitter highlighting.
                vim.treesitter.start(args.buf)

                -- Tree-sitter based indentation (experimental on `main`).
                vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
            end,
        })
    end
}
