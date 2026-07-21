class FcJson < Formula
  desc "Inspect JSON and generate schemas, examples, and Pydantic classes"
  homepage "https://github.com/fcrozetta/fc-json"
  version "2.0.1"
  license "GPL-3.0-or-later"

  on_macos do
    # Universal binary (Apple Silicon + Intel) — one tarball for both arches.
    url "https://github.com/fcrozetta/fc-json/releases/download/#{version}/fc-json-#{version}-darwin-universal.tar.gz"
    sha256 "0000000000000000000000000000000000000000000000000000000000000000"
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/fcrozetta/fc-json/releases/download/#{version}/fc-json-#{version}-linux-amd64.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    elsif Hardware::CPU.arm?
      url "https://github.com/fcrozetta/fc-json/releases/download/#{version}/fc-json-#{version}-linux-arm64.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    else
      odie "fc-json is not released for this linux architecture yet"
    end
  end

  def install
    bin.install "fc-json"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fc-json --version")
  end

  livecheck do
    url :stable
    strategy :github_latest
  end
end
