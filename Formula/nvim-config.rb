class NvimConfig < Formula
  desc "Personal Neovim configuration"
  homepage "https://github.com/fcrozetta/nvim-config"
  url "https://github.com/fcrozetta/nvim-config/archive/refs/tags/0.0.15.tar.gz"
  sha256 "ee6450e73c518d1c1ce973077d529e351d58e04a029721e9ce0566b67e9fbce5"
  license "MIT"

  depends_on "neovim"
  depends_on "ripgrep"
  depends_on "fd"
  depends_on "fzf"
  depends_on "lazygit"
  depends_on "tree-sitter"
  depends_on "node"
  depends_on "pnpm"
  depends_on "uv"
  depends_on "ghostscript"
  depends_on "imagemagick"
  depends_on "luarocks"
  depends_on "python@3.12"

  def install
    bin.install "setup.sh" => "nvim-config-setup"
    bin.install "scripts/uninstall.sh" => "nvim-config-uninstall"
    inreplace bin/"nvim-config-setup", /^SCRIPT_DIR=.*$/, "SCRIPT_DIR=\"#{opt_pkgshare}\""
    pkgshare.install Dir["*"], ".gitignore", ".neoconf.json"
  end

  def caveats
    <<~EOS
      Brew cannot write outside its prefix during install.
      Finish setup by running:

        nvim-config-setup

      This symlinks ~/.config/nvim (backing up any existing config),
      installs pnpm packages, and bootstraps Neovim plugins.

      Run 'nvim-config-uninstall' before 'brew uninstall' for full cleanup.
    EOS
  end
end
