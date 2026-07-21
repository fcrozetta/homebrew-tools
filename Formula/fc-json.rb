class FcJson < Formula
  desc "Inspect JSON and generate schemas, examples, and Pydantic classes"
  homepage "https://github.com/fcrozetta/fc-json"
  version "2.0.1"
  license "GPL-3.0-or-later"

  on_macos do
    # Universal binary (Apple Silicon + Intel) — one tarball for both arches.
    url "https://github.com/fcrozetta/fc-json/releases/download/#{version}/fc-json-#{version}-darwin-universal.tar.gz"
    sha256 "5c44b764c14b0a5df53c429626d5798818bdb6e3d48a80053cb26665b57faba2"
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/fcrozetta/fc-json/releases/download/#{version}/fc-json-#{version}-linux-amd64.tar.gz"
      sha256 "e8fb358916d2324edc4b1c3f30c3400547c244b5fa1dd8c05ff53aae00e52471"
    elsif Hardware::CPU.arm?
      url "https://github.com/fcrozetta/fc-json/releases/download/#{version}/fc-json-#{version}-linux-arm64.tar.gz"
      sha256 "ff20e39b175890443593b2563ec75f98e88dc04a49a700cc2fb0555363644ab5"
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
