class FcJson < Formula
  desc "Inspect JSON and generate schemas, examples, and Pydantic classes"
  homepage "https://github.com/fcrozetta/fc-json"
  version "2.0.2"
  license "GPL-3.0-or-later"

  on_macos do
    # Universal binary (Apple Silicon + Intel) — one tarball for both arches.
    url "https://github.com/fcrozetta/fc-json/releases/download/#{version}/fc-json-#{version}-darwin-universal.tar.gz"
    sha256 "afcf93e00f124d4b3b6d43eda27b7800c8c615b344035a7ad89bf7e25a3622ca"
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/fcrozetta/fc-json/releases/download/#{version}/fc-json-#{version}-linux-amd64.tar.gz"
      sha256 "fed99de4be97d68dd3ad4cc487f51b69b0baa539358faa78ae44f32fdedb3d1c"
    elsif Hardware::CPU.arm?
      url "https://github.com/fcrozetta/fc-json/releases/download/#{version}/fc-json-#{version}-linux-arm64.tar.gz"
      sha256 "5de18026b8306c7adc87a9dd7bf5b36004cb58415538bc3d22c0e2a9f3034734"
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
