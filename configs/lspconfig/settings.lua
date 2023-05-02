local Settings = {}

Settings.rust_analyzer = {
  ['rust-analyzer'] = {
    cargo = {
      allFeatures = true,
    },
    procMacro = {
      enable = true,
    },
    -- checkOnSave = {
    --   allFeatures = true,
    --   overrideCommand = {
    --     'cargo',
    --     'clippy',
    --     '--workspace',
    --     '--message-format=json',
    --     '--all-targets',
    --     '--all-features',
    --   },
    -- },
  },
}

return Settings
