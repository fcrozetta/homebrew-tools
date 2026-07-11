class Rctx < Formula
  desc "Repo ConTeXt: repository-bounded context and claims for coding agents"
  homepage "https://github.com/fcrozetta/rctx"
  version "0.2.0"
  license "GPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/fcrozetta/rctx/releases/download/#{version}/rctx-#{version}-darwin-arm64.tar.gz"
      sha256 "c3616d1463624f7bd947327bdab778b3aa2712fb164317bebdff3a7ae9e0b27d"
    else
      odie "rctx is not released for darwin-amd64 yet"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/fcrozetta/rctx/releases/download/#{version}/rctx-#{version}-linux-amd64.tar.gz"
      sha256 "cc02210055cc449301a3901095f82b550be313469111f56af5819302199345d7"
    elsif Hardware::CPU.arm?
      url "https://github.com/fcrozetta/rctx/releases/download/#{version}/rctx-#{version}-linux-arm64.tar.gz"
      sha256 "e7b8b08328eab0e2b7e3971f6e3660988e6fc134dbe0d3bcbec1afa503a26937"
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
