class Kubeforward < Formula
  desc "Port-forward Kubernetes services/pods with a friendly workflow"
  homepage "https://github.com/fcrozetta/kubeforward"
  version "0.0.11"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/fcrozetta/kubeforward/releases/download/#{version}/kubeforward-#{version}-darwin-arm64.tar.gz"
      sha256 "9d8b966724113aa394ea2e568295bb21ad1592417d4c0ed499f5db3038ee3d41"
    else
      odie "kubeforward is not released for darwin-amd64 yet"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/fcrozetta/kubeforward/releases/download/#{version}/kubeforward-#{version}-linux-amd64.tar.gz"
      sha256 "faa8da35f531059447fc14bdeb1de44ce5b83cf87c0ea2ee2f4474ae28f5ff08"
    elsif Hardware::CPU.arm?
      url "https://github.com/fcrozetta/kubeforward/releases/download/#{version}/kubeforward-#{version}-linux-arm64.tar.gz"
      sha256 "4d6a7ec8a1ce7b81a35cf190c8efbe5330f1f75a0cef997493de393330914fb7"
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
