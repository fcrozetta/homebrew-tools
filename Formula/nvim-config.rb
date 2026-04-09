class NvimConfig < Formula
  desc "Personal Neovim configuration"
  homepage "https://github.com/fcrozetta/nvim-config"
  url "https://github.com/fcrozetta/nvim-config/archive/refs/tags/0.0.7.tar.gz"
  sha256 "be201f3594d10c6ea3b12d41bbd9d2dd096cf2536f42794f1f5e877331e0798e"
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
    pkgshare.install Dir["*"], ".gitignore", ".neoconf.json"
    bin.install "setup.sh" => "nvim-config-setup"
    inreplace bin/"nvim-config-setup", /^SCRIPT_DIR=.*$/, "SCRIPT_DIR=\"#{pkgshare}\""
  end

  def post_install
    ENV["HOMEBREW_FORMULA"] = "1"
    system bin/"nvim-config-setup"
  end

  def caveats
    <<~EOS
      Config symlinked to ~/.config/nvim
      Run 'nvim-config-setup' to re-link after upgrades.
    EOS
  end
end
