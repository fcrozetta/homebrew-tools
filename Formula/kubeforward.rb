class Kubeforward < Formula
  desc "Port-forward Kubernetes services/pods with a friendly workflow"
  homepage "https://github.com/fcrozetta/kubeforward"
  version "0.0.15"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/fcrozetta/kubeforward/releases/download/#{version}/kubeforward-#{version}-darwin-arm64.tar.gz"
      sha256 "b5f287e6ad4860e2f138c17e747deeeef42a6c3227256d61c36dcb916afa2ac0"
    else
      odie "kubeforward is not released for darwin-amd64 yet"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/fcrozetta/kubeforward/releases/download/#{version}/kubeforward-#{version}-linux-amd64.tar.gz"
      sha256 "47eff730a62279ee6ef8b933b33e03d71a9acf2d20ede60a64d3cea5ca48f97d"
    elsif Hardware::CPU.arm?
      url "https://github.com/fcrozetta/kubeforward/releases/download/#{version}/kubeforward-#{version}-linux-arm64.tar.gz"
      sha256 "89ecd11e866725643a37519b8667d9d6957d841f1249077d3c5b99e79f0d1342"
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
