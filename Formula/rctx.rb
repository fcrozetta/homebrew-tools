class Rctx < Formula
  desc "Repo ConTeXt: repository-bounded context and claims for coding agents"
  homepage "https://github.com/fcrozetta/rctx"
  version "0.4.0"
  license "GPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/fcrozetta/rctx/releases/download/#{version}/rctx-#{version}-darwin-arm64.tar.gz"
      sha256 "83095d666b95cf585a6b5bcb29dcd8a067de332bdd31e263d4ee4c106002035b"
    else
      odie "rctx is not released for darwin-amd64 yet"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/fcrozetta/rctx/releases/download/#{version}/rctx-#{version}-linux-amd64.tar.gz"
      sha256 "7b6c6cb528ad03fbdf0d1aecb18dd87fb32be25917091203c4a090973c9e5df5"
    elsif Hardware::CPU.arm?
      url "https://github.com/fcrozetta/rctx/releases/download/#{version}/rctx-#{version}-linux-arm64.tar.gz"
      sha256 "3a2e2360ad2a54bcb237935ce69d7716f6bcefa78c6df64ba394bad8f5276814"
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
