# Do not edit .rb file manually, edit .rb.tpl instead
class Profilecli < Formula
  desc "Open source continuous profiling software"
  homepage "https://grafana.com/oss/pyroscope/"
  version "2.1.1"
  license "AGPL-3.0-only"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/grafana/pyroscope/releases/download/v2.1.1/profilecli_2.1.1_darwin_amd64.tar.gz"
      sha256 "56349748f80ccb266406a5437a8b8a0b467dc818885aa575dd1047962de6fe5f"

      define_method :install do
        bin.install "profilecli"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/grafana/pyroscope/releases/download/v2.1.1/profilecli_2.1.1_darwin_arm64.tar.gz"
      sha256 "e4e33e9c9443c8dcb15de536545909b2bf5eb7079efca430f19df2c43c021018"

      define_method :install do
        bin.install "profilecli"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/grafana/pyroscope/releases/download/v2.1.1/profilecli_2.1.1_linux_amd64.tar.gz"
      sha256 "31758c140e474687b0f8e37854e03e38aafac26a544082cee0e88e01af8b20a9"

      define_method :install do
        bin.install "profilecli"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/grafana/pyroscope/releases/download/v2.1.1/profilecli_2.1.1_linux_arm64.tar.gz"
      sha256 "b7db72e5ca4c425a0db854364636f1d61b29c14f167b4a6bdceab2b899da25a1"

      define_method :install do
        bin.install "profilecli"
      end
    end
  end

  test do
    system bin/"profilecli", "--version"
  end
end
