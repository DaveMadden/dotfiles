return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      taplo = {
        settings = {
          evenBetterToml = {
            schema = {
              associations = {
                [".air.toml"] = "", -- Disable schema for .air.toml
              },
            },
          },
        },
      },
    },
  },
}
