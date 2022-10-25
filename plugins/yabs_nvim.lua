local terminal = function(cmd)
  vim.cmd 'wa'
  vim.cmd('term ' .. cmd)
  vim.cmd 'startinsert'
end

require('yabs'):setup {
  languages = {
    rust = {
      tasks = {
        run = {
          command = 'cargo run --all-features',
          output = terminal,
        },
        build = {
          command = 'cargo build --all-features',
          output = terminal,
        },
        test = {
          command = 'cargo test -- --nocapture',
          output = terminal,
        },
      },
    },
    lua = {
      tasks = {
        run = {
          command = 'luajit %',
          output = terminal,
        },
      },
    },
    c = {
      tasks = {
        run = {
          command = 'cmake --build build && ./build/main',
          output = terminal,
        },
      },
    },
    cmake = {
      tasks = {
        run = {
          command = 'cmake -S . -B build',
          output = terminal,
        },
      },
    },
    javascript = {
      tasks = {
        run = {
          command = 'node %',
          output = terminal,
        },
      },
    },
  },
}
