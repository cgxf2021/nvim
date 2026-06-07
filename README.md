# Neovim 配置

日常开发与学习使用的 Neovim 配置，基于 [lazy.nvim](https://github.com/folke/lazy.nvim) 插件管理器。

## 目录结构

```
.
├── init.lua                    # 入口：require core 模块
├── lua/
│   ├── core/
│   │   ├── basic.lua           # 基础设置（行号、缩进、折叠等）
│   │   ├── keymap.lua          # 统一快捷键定义（<leader> 全系列）
│   │   └── lazy.lua            # lazy.nvim 引导 & 插件入口
│   └── plugins/                # 每个文件一个插件 spec
│       ├── blink.lua           # 代码补全
│       ├── bufferline.lua      # 顶部缓冲栏
│       ├── catppuccin.lua      # 主题
│       ├── gitsigns.lua        # Git 更改标记
│       ├── lspsaga.lua         # LSP UI 增强
│       ├── lualine.lua         # 底部状态栏
│       ├── mason.lua           # LSP/formatter 管理 & 安装
│       ├── noice.lua           # 命令行 / 通知美化
│       ├── none-ls.lua         # 代码格式化（替代 null-ls）
│       ├── nvim-autopairs.lua  # 自动配对括号
│       ├── nvim-surround.lua   # 快速包围修改
│       ├── nvim-tree.lua       # 文件树
│       ├── nvim-treesitter.lua # 语法高亮 & 语法树
│       ├── opencode.lua        # AI 编程助手
│       ├── rainbow-delimiters.lua # 彩虹括号
│       ├── render-markdown.lua # Markdown 实时渲染
│       ├── supermaven-nvim.lua # AI 代码补全（已禁用）
│       ├── telescope.lua       # 模糊查找器
│       ├── toggleterm.lua      # 内置浮动终端
│       ├── transparent.lua     # 透明背景
│       └── which-key.lua       # 快捷键提示
├── format-setting/             # clang-format 自定义配置
├── remote-lsp/                 # 远程 Docker clangd 脚本
├── AGENTS.md                   # AI agent 指引
└── stylua.toml                 # Stylua 格式化规则
```

## 快捷键

Leader 键 = `<Space>`，本地 Leader = `,`。按下 `<Space>` 后等待可查看 which-key 提示面板。

| 分组 | 键 | 描述 | 图标 |
|------|------|------|------|
| **🍉 窗口** | `<leader>wh` | 切换到左边窗口 | |
| | `<leader>wl` | 切换到右边窗口 | |
| | `<leader>wk` | 切换到上边窗口 | |
| | `<leader>wj` | 切换到下边窗口 | |
| | `<leader>ws` | 水平分割 | |
| | `<leader>wv` | 垂直分割 | |
| | `<leader>wq` | 关闭当前窗口 | |
| **🍊 折叠** | `<leader>zc` | 折叠一层 | |
| | `<leader>zo` | 展开一层 | |
| | `<leader>zC` | 折叠全部 | |
| | `<leader>zO` | 展开全部 | |
| **🍑 缓冲** | `<leader>bh` | 上一缓冲区 | |
| | `<leader>bl` | 下一缓冲区 | |
| | `<leader>bd` | 删除当前缓冲 | |
| | `<leader>bp` | 选择缓冲区 | |
| **🐍 搜索** | `<leader>sf` | 查找文件 | |
| | `<leader>sg` | 实时 grep | |
| | `<leader>sb` | 缓冲区列表 | |
| | `<leader>sh` | 帮助标签 | |
| **🦇 LSP** | `<leader>lr` | 重命名 | |
| | `<leader>ld` | 跳转到定义 | |
| | `<leader>lc` | 代码操作 | |
| | `<leader>lh` | 悬停文档 | |
| | `<leader>lF` | 查找器 | |
| | `<leader>ln` | 下一诊断 | |
| | `<leader>lp` | 上一诊断 | |
| **🐢 文件树** | `<leader>te` | 开/关文件树 | |
| | `<leader>tc` | 折叠文件树 | |
| | `<leader>tf` | 定位当前文件 | |
| **🧹 格式化** | `<leader>ff` | 格式化代码 | |
| **🐢 透明** | `<leader>Te` | 开启透明 | |
| | `<leader>Td` | 关闭透明 | |
| | `<leader>Tt` | 切换透明 | |
| **🤖 opencode** | `<leader>oo` | 开/关浮动终端 | |
| | `<leader>oa` | 提问（附当前选区） | |
| | `<leader>os` | 选择命令 / 会话 | |
| | `<leader>or` | 添加范围（操作符） | |
| | `<leader>ol` | 添加当前行 | |
| | `<leader>ou` | 向上翻半页 | |
| | `<leader>od` | 向下翻半页 | |

### 全局快捷键

| 键 | 描述 |
|------|------|
| `<C-\>` | 开关浮动终端（toggleterm） |
| `<C-a>` | opencode 提问 |
| `<C-x>` | opencode 选择 |
| `<C-a>` (原功能) | `+` 号替代 |
| `<C-x>` (原功能) | `-` 号替代 |
| `<S-C-u>` / `<S-C-d>` | opencode 翻半页 |
| `go` / `goo` | opencode 添加范围 / 光标行 |

## 插件一览

### 主题 & UI

| 插件 | 用途 |
|------|------|
| catppuccin | Mocha 主题，透明背景 |
| bufferline | 顶部标签式缓冲栏 |
| lualine | 底部状态栏 |
| noice | 浮动命令行 & 通知框 |
| transparent | 窗口 / 树 / 弹窗透明化 |
| render-markdown | Markdown 内联渲染 |

### 编辑 & 导航

| 插件 | 用途 |
|------|------|
| telescope | 文件、内容、缓冲区模糊查找 |
| nvim-tree | 侧边栏文件树 |
| which-key | `<Space>` 快捷键菜单提示 |
| nvim-autopairs | 自动配对括号 / 引号 |
| nvim-surround | `ys`/`ds`/`cs` 快速包围修改 |
| rainbow-delimiters | 嵌套括号按层级着色 |
| toggleterm | 内置浮动终端（`<C-\>` 开关） |

### LSP & 语法

| 插件 | 用途 |
|------|------|
| mason | LSP 及 formatter 管理，安装到 `~/.local/share/nvim/mason` |
| nvim-treesitter | 语法树 + 精确高亮（lua / c / cpp） |
| blink.cmp | LSP 自动补全（来源：lsp、path、snippets、buffer） |
| lspsaga | LSP 增强 UI（重命名、跳转、hover、诊断导航） |
| none-ls | 格式化（stylua、clang-format、black、cmake-format、protobuf） |

### Git & AI

| 插件 | 用途 |
|------|------|
| gitsigns | 行号左侧显示 git 变更标记 |
| opencode | opencode AI 编程助手 |
| supermaven-nvim | AI 补全（`condition = false`，已禁用） |

### LSP 服务器（mason 自动安装）

| 语言 | LSP Server |
|------|------------|
| Lua | lua-language-server |
| C / C++ / CUDA | clangd（支持 Docker 远程） |
| Python | python-lsp-server |
| CMake | cmake-language-server |
| Protobuf | buf |
| Markdown | marksman |

### Formatter（mason 自动安装）

| 语言 | Formatter |
|------|-----------|
| Lua | stylua |
| C / C++ | clang-format（自定义 Microsoft 风格） |
| Python | black |
| CMake | cmake-format |
| Protobuf | buf format |

## 基本设置

| 选项 | 值 |
|------|------|
| 行号 | `number` + `relativenumber` |
| 缩进 | 2 空格（C/C++/Python/Proto/CMake 自动切换为 4 空格） |
| 折叠 | treesitter 折叠表达式，默认不折叠 |
| 搜索 | 忽略大小写 + 智能大小写 |
| 高亮光标行 | 开启 |
| 分屏方向 | 右（v） | 下（s） |

## 更多

- **clang-format 自定义样式**: 运行 `bash format-setting/add_custom_format.sh` 可为 none-ls 安装自定义 clang-format 规则
- **远程 clangd**: `.container-nvim` 文件定义容器名及路径映射，供 `remote-clangd.sh` 使用
