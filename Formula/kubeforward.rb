class Kubeforward < Formula
  desc "Port-forward Kubernetes services/pods with a friendly workflow"
  homepage "https://github.com/fcrozetta/kubeforward"
  version "0.0.2"
  license "Apache-2.0" # TODO: set correctly

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/fcrozetta/kubeforward/releases/download/#{version}/kubeforward-#{version}-darwin-arm64.tar.gz"
      sha256 "ff1329ce27d5d4317ad17e69bb62a1b72a197583f1fe68385d50ad082325d008"
    else
      odie "kubeforward is not released for darwin-amd64 yet"
    end
  end

  on_linux do
  if Hardware::CPU.intel?
    url "https://github.com/fcrozetta/kubeforward/releases/download/#{version}/kubeforward-#{version}-linux-amd64.tar.gz"
    sha256 "<PLEASE_UPDATE_ME>"
  elsif Hardware::CPU.arm?
    url "https://github.com/fcrozetta/kubeforward/releases/download/#{version}/kubeforward-#{version}-linux-arm64.tar.gz"
    sha256 "<PLEASE_UPDATE_ME>"
  end
end

  def install
    bin.install "kubeforward"
  end

  test do
    # Pick a flag your CLI guarantees.
    # If you don't print version, change to "--help" with a stable match.
    out = shell_output("#{bin}/kubeforward --help")
    assert_match version.to_s, out
  end

  livecheck do
    url :stable
    strategy :github_latest
  end
end