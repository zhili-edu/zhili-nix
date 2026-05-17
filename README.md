# Zhili Nix

执理内部使用的 Nix flake，用于集中安装常用命令行工具。

## 安装

安装默认软件集合：

```sh
nix profile install github:zhili-edu/zhili-nix
```

本地测试安装：

```sh
nix profile install .#
```

## 目录结构

```text
.
├── flake.nix
└── README.md
```

## 添加软件

在 `flake.nix` 的 `paths` 列表里添加需要安装的软件：

```nix
paths = [
  pkgs.git
  pkgs.jq
  ...
];
```

`nix profile install github:zhili-edu/zhili-nix` 默认安装的是 `packages.default`。
