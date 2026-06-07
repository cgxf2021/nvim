local h = require("null-ls.helpers")
local methods = require("null-ls.methods")

local FORMATTING = methods.internal.FORMATTING
local RANGE_FORMATTING = methods.internal.RANGE_FORMATTING

local function find_container_command()
  local dir = vim.loop.cwd()
  while dir and dir ~= "/" do
    local f = dir .. "/.container-nvim"
    if vim.loop.fs_stat(f) then
      local file = io.open(f, "r")
      if file then
        local name = file:read("*l")
        file:close()
        name = name and name:match("%S+")
        if name and name ~= "" then
          local check = vim.fn.system(
            "docker ps -q -f name=" .. name .. " -f status=running 2>/dev/null"
          )
          if check:match("%S") then
            return { "docker", "exec", "-i", name, "clang-format" }
          end
        end
      end
      break
    end
    dir = vim.fn.fnamemodify(dir, ":h")
  end
  return "clang-format"
end

return h.make_builtin({
  name = "custom_clang_format",
  meta = {
    url = "https://www.kernel.org/doc/html/latest/process/clang-format.html",
    description = "Tool to format C/C++ code. Uses Docker container if .container-nvim exists.",
  },
  method = { FORMATTING, RANGE_FORMATTING },
  filetypes = { "c", "cpp", "cs", "cuda" },
  generator_opts = {
    command = function()
      return find_container_command()
    end,
    args = h.range_formatting_args_factory(
      { "-assume-filename", "$FILENAME", "--style=Microsoft" },
      "--offset",
      "--length",
      { use_length = true, row_offset = -1, col_offset = -1 }
    ),
    to_stdin = true,
  },
  factory = h.formatter_factory,
})
