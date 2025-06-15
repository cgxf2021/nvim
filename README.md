# nvim

neovim配置, 用于日常的工作和学习.

## 目录结构

```tree
.
├── init.lua
├── lua
│   ├── core
│   │   ├── basic.lua
│   │   ├── keymap.lua
│   │   └── lazy.lua
│   └── plugins
│       ├── blink.lua
│       ├── bufferline.lua
│       ├── catppuccin.lua
│       ├── lspsaga.lua
│       ├── lualine.lua
│       ├── mason.lua
│       ├── none-ls.lua
│       ├── nvim-autopairs.lua
│       ├── nvim-surround.lua
│       ├── nvim-tree.lua
│       ├── nvim-treesitter.lua
│       └── telescope.lua
└── README.md
```

## 插件列表

### Themes

* catppuccin

### Plugins

* lazy: 插件管理
* bufferline: 显示顶部打开的缓冲区
* lualine: 底部状态栏
* nvim-autopairs: 自动闭合对, 例如括号
* nvim-surround: 更方便地添加括号、引号、标签
* nvim-tree: 显示文件树
* nvim-treesitter: 构建语法树并实现更好的高亮显示
* telescope: 文件或代码的查找、过滤、预览、选择等

### LSP

* mason: lsp管理
* none-ls: 代码格式化插件
* blink-cmp: 代码补全
* lspsaga: lsp补充功能, 例如查看帮助文档、进行跳转、对变量重命名
