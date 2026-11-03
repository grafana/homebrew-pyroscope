# Do not edit .rb file manually, edit .rb.tpl instead
class Profilecli < Formula
  desc "Open source continuous profiling software"
  homepage "https://grafana.com/oss/pyroscope/"
  license "AGPL-3.0-only"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/grafana/pyroscope/releases/download/v2.4.3/profilecli_2.4.3_darwin_amd64.tar.gz"
      sha256 "41fc8bb3b66ba2386345f4dd07256cfd18ebc6592baa1b7705c681a5e4d64f81"

      define_method :install do
        bin.install "profilecli"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/grafana/pyroscope/releases/download/v2.4.3/profilecli_2.4.3_darwin_arm64.tar.gz"
      sha256 "773abfb5ea8deac8d3e24bea59c36d95ffdb625a6ffe4b0a5b52171020e1d809"

      define_method :install do
        bin.install "profilecli"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/grafana/pyroscope/releases/download/v2.4.3/profilecli_2.4.3_linux_amd64.tar.gz"
      sha256 "f527ea43702046e029d3f7b82439066632e8aba7b1b3fd0b29876701a106666b"

      define_method :install do
        bin.install "profilecli"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/grafana/pyroscope/releases/download/v2.4.3/profilecli_2.4.3_linux_arm64.tar.gz"
      sha256 "e2b6dd0a9e7a68a748fe844cf16ca1ac71fb8aecfded91f5cafcb5ce0ab89ef8"

      define_method :install do
        bin.install "profilecli"
      end
    end
  end

  test do
    system bin/"profilecli", "--version"
  end
end
