# flake.nix
{
  description = "Typst editor with Rust core, Dart frontend";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import nixpkgs { inherit system; };
      in
      {
        devShells.default = pkgs.mkShell {
          packages = with pkgs; [
            # 核心技术栈
            # rust
            rustc
            cargo
            clippy
            rustfmt
            rust-analyzer
            cargo-watch # 热重载开发
            cargo-edit # 依赖管理 (cargo add/rm)
            cargo-outdated # 检查过期依赖
            cargo-audit # 安全检查

            #python
            python3
            uv

            #dart
            dart
            flutter

            # 运维工具链
            nushell
            git
            sqlite
            jq
            watchexec

          ];
          nativeBuildInputs = with pkgs; [
            pkg-config
            openssl
            openssl.dev
          ];

          shellHook = ''
            # 项目横幅

            # 路径配置
            export PNPM_HOME="./.pnpm-store"
            mkdir -p "$PNPM_HOME" 2>/dev/null || true
            export RUST_BACKTRACE=1
            export RUST_LOG=info

            echo "-----------------------------------------------"

            # 启动Nushell
            exec nu --no-config-file --no-history
          '';
        };
      }
    );
}
