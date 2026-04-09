class NvimConfig < Formula
  desc "Personal Neovim configuration"
  homepage "https://github.com/fcrozetta/nvim-config"
  url "https://github.com/fcrozetta/nvim-config/archive/refs/tags/0.0.12.tar.gz"
  sha256 "bfeaace641a6900271df7aaa4b1f27fe2ad06773e8dd668d042a50e524d223cc"
  license "MIT"

  depends_on "neovim"
  depends_on "ripgrep"
  depends_on "fd"
  depends_on "fzf"
  depends_on "lazygit"
  depends_on "tree-sitter"
  depends_on "node"
  depends_on "uv"
  depends_on "ghostscript"
  depends_on "imagemagick"
  depends_on "luarocks"
  depends_on "python@3.12"

  def install
    bin.install "setup.sh" => "nvim-config-setup"
    bin.install "scripts/uninstall.sh" => "nvim-config-uninstall"
    inreplace bin/"nvim-config-setup", /^SCRIPT_DIR=.*$/, "SCRIPT_DIR=\"#{pkgshare}\""
    pkgshare.install Dir["*"], ".gitignore", ".neoconf.json"
  end

  def post_install
    ENV["HOMEBREW_FORMULA"] = "1"
    system bin/"nvim-config-setup"
  end

  def uninstall
    system bin/"nvim-config-uninstall"
  end

  def caveats
    <<~EOS
      Config symlinked to ~/.config/nvim
      Run 'nvim-config-uninstall' before 'brew uninstall' for full cleanup.
    EOS
  end
end
