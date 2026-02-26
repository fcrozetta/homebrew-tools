class Kubeforward < Formula
  desc "Port-forward Kubernetes services/pods with a friendly workflow"
  homepage "https://github.com/fcrozetta/kubeforward"
  version "0.0.2"
  license "Apache-2.0" # TODO: set correctly

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/fcrozetta/kubeforward/releases/download/#{version}/kubeforward-#{version}-darwin-arm64.tar.gz"
      sha256 "c8a870121e5dbd694d54267621bb199b9b0a19562b91fe7677be64590dbfbb94"
    else
      odie "kubeforward is not released for darwin-amd64 yet"
    end
  end

  on_linux do
  if Hardware::CPU.intel?
    url "https://github.com/fcrozetta/kubeforward/releases/download/#{version}/kubeforward-#{version}-linux-amd64.tar.gz"
    sha256 "b4c7064a3dba5676e001ccd4030f5ed8eabd157d5abf91b8a0df65c9bb396f92"
  elsif Hardware::CPU.arm?
    url "https://github.com/fcrozetta/kubeforward/releases/download/#{version}/kubeforward-#{version}-linux-arm64.tar.gz"
    sha256 "49c4a1928084b7544c2e2dbbd99c2071fbefe09bfa8d28f4519bc2ae385e6f9e"
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