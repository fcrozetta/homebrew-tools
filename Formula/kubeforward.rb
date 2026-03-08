class Kubeforward < Formula
  desc "Port-forward Kubernetes services/pods with a friendly workflow"
  homepage "https://github.com/fcrozetta/kubeforward"
  version "0.0.13"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/fcrozetta/kubeforward/releases/download/#{version}/kubeforward-#{version}-darwin-arm64.tar.gz"
      sha256 "3eab4cb7ae6564f335dd3881f91b25d579a72721f5534ba7719f04896f169eec"
    else
      odie "kubeforward is not released for darwin-amd64 yet"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/fcrozetta/kubeforward/releases/download/#{version}/kubeforward-#{version}-linux-amd64.tar.gz"
      sha256 "9dca78b54b11600239282aca2650799e136545837546b92a95be5e4f88be0aea"
    elsif Hardware::CPU.arm?
      url "https://github.com/fcrozetta/kubeforward/releases/download/#{version}/kubeforward-#{version}-linux-arm64.tar.gz"
      sha256 "4e9c28f4cc71007f1426f39220acbff6b6b2a5f8d8a89019539e0c01d64ca1c4"
    else
      odie "kubeforward is not released for this linux architecture yet"
    end
  end

  def install
    bin.install "kubeforward"
  end

  test do
    out = shell_output("#{bin}/kubeforward --version")
    assert_match version.to_s, out
  end

  livecheck do
    url :stable
    strategy :github_latest
  end
end
