class NvimConfig < Formula
  desc "Personal Neovim configuration"
  homepage "https://github.com/fcrozetta/nvim-config"
  url "https://github.com/fcrozetta/nvim-config/archive/refs/tags/0.1.0.tar.gz"
  sha256 "cacee02c8b8b23c73e2e5c605de0d28c210fe2271db877a686fce66d1a0f827e"
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
