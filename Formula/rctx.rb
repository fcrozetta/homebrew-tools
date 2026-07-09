class Rctx < Formula
  desc "Repo ConTeXt: repository-bounded context and claims for coding agents"
  homepage "https://github.com/fcrozetta/rctx"
  version "0.1.0"
  license "GPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/fcrozetta/rctx/releases/download/#{version}/rctx-#{version}-darwin-arm64.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    else
      odie "rctx is not released for darwin-amd64 yet"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/fcrozetta/rctx/releases/download/#{version}/rctx-#{version}-linux-amd64.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    elsif Hardware::CPU.arm?
      url "https://github.com/fcrozetta/rctx/releases/download/#{version}/rctx-#{version}-linux-arm64.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    else
      odie "rctx is not released for this linux architecture yet"
    end
  end

  def install
    bin.install "rctx"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/rctx --version")
  end

  livecheck do
    url :stable
    strategy :github_latest
  end
end
