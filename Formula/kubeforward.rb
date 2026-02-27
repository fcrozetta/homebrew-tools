class Kubeforward < Formula
  desc "Port-forward Kubernetes services/pods with a friendly workflow"
  homepage "https://github.com/fcrozetta/kubeforward"
  version "0.0.10"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/fcrozetta/kubeforward/releases/download/#{version}/kubeforward-#{version}-darwin-arm64.tar.gz"
      sha256 "1c673cf310b14e4240eb9ca451307c044e008f1a0924d562c9a59a52a8014bc3"
    else
      odie "kubeforward is not released for darwin-amd64 yet"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/fcrozetta/kubeforward/releases/download/#{version}/kubeforward-#{version}-linux-amd64.tar.gz"
      sha256 "0f82fd3c94050a9430c718da59188a5a27b469c13e9a1bff7a6a01192dab89e8"
    elsif Hardware::CPU.arm?
      url "https://github.com/fcrozetta/kubeforward/releases/download/#{version}/kubeforward-#{version}-linux-arm64.tar.gz"
      sha256 "fcb3c91801fba9db999b513b2cbad7ea861742fe403f1eb8b6a00a813c16d296"
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
