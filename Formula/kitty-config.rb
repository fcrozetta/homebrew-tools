class KittyConfig < Formula
  desc "Personal kitty terminal configuration"
  homepage "https://github.com/fcrozetta/kitty-config"
  url "https://github.com/fcrozetta/kitty-config/archive/refs/tags/0.0.12.tar.gz"
  sha256 "36bcef41981fca096b18d1a7ea511320ea787e82b35bdd49a231ef8d58ff102f"
  license "MIT"

  depends_on :macos

  def install
    bin.install "setup.sh" => "kitty-config-setup"
    bin.install "scripts/uninstall.sh" => "kitty-config-uninstall"
    inreplace bin/"kitty-config-setup", /^SCRIPT_DIR=.*$/, "SCRIPT_DIR=\"#{opt_pkgshare}\""
    pkgshare.install Dir["*"], ".gitignore"
  end

  def caveats
    <<~EOS
      Brew cannot write outside its prefix during install.
      Finish setup by running:

        kitty-config-setup

      This adds a managed BEGIN_KITTY_CONFIG block to your
      ~/.config/kitty/kitty.conf, symlinks themes/ and kittens/
      from this formula's pkgshare, and seeds current-theme.conf
      on first install.

      Re-run kitty-config-setup after each 'brew upgrade' to pick
      up new themes, kittens, or base.conf changes.

      Run 'kitty-config-uninstall' before 'brew uninstall' for a
      clean removal.
    EOS
  end
end
