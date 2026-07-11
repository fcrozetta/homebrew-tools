class Rctx < Formula
  desc "Repo ConTeXt: repository-bounded context and claims for coding agents"
  homepage "https://github.com/fcrozetta/rctx"
  version "0.3.0"
  license "GPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/fcrozetta/rctx/releases/download/#{version}/rctx-#{version}-darwin-arm64.tar.gz"
      sha256 "0bf32fd8e2ead98bd3fe7060aca054233d8c8d55cde52500b87f9698aab31666"
    else
      odie "rctx is not released for darwin-amd64 yet"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/fcrozetta/rctx/releases/download/#{version}/rctx-#{version}-linux-amd64.tar.gz"
      sha256 "84f161c3bd06ace32eba7ad64b6bfd8c0e22be5f51844f4feda446302145f4a4"
    elsif Hardware::CPU.arm?
      url "https://github.com/fcrozetta/rctx/releases/download/#{version}/rctx-#{version}-linux-arm64.tar.gz"
      sha256 "b5718ac68b73a96e780c29bccc5d2b575c09ffb584a537e5e96331c0420d1165"
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
