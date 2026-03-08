class Kubeforward < Formula
  desc "Port-forward Kubernetes services/pods with a friendly workflow"
  homepage "https://github.com/fcrozetta/kubeforward"
  version "0.0.14"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/fcrozetta/kubeforward/releases/download/#{version}/kubeforward-#{version}-darwin-arm64.tar.gz"
      sha256 "1101d4a4f76ae2a4e4b00276f2603ca1f53070217bc352fad4ac781e30cef477"
    else
      odie "kubeforward is not released for darwin-amd64 yet"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/fcrozetta/kubeforward/releases/download/#{version}/kubeforward-#{version}-linux-amd64.tar.gz"
      sha256 "b185363ff459509fe31e858308132621adf8a65bf430bfd67711d43e642bf67b"
    elsif Hardware::CPU.arm?
      url "https://github.com/fcrozetta/kubeforward/releases/download/#{version}/kubeforward-#{version}-linux-arm64.tar.gz"
      sha256 "601b3229f505e307da9e9178747fc75bc846bf03876580df7d8ec25bca6ae2e3"
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
