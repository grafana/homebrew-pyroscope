# Do not edit .rb file manually, edit .rb.tpl instead
class Profilecli < Formula
  desc "Open source continuous profiling software"
  homepage "https://grafana.com/oss/pyroscope/"
  version "2.1.0"
  license "AGPL-3.0-only"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/grafana/pyroscope/releases/download/v2.1.0/profilecli_2.1.0_darwin_amd64.tar.gz"
      sha256 "599b3c7efd1bb8545b7bd3c1512630eb063b4871f0a8891dbce01b448105d08b"

      define_method :install do
        bin.install "profilecli"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/grafana/pyroscope/releases/download/v2.1.0/profilecli_2.1.0_darwin_arm64.tar.gz"
      sha256 "3949d4e6133fe05232c6e2814e4a6ab4fbaae0d807f66aa837ef8cf0d01bc582"

      define_method :install do
        bin.install "profilecli"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/grafana/pyroscope/releases/download/v2.1.0/profilecli_2.1.0_linux_amd64.tar.gz"
      sha256 "6b93cfd907d72e7c843cd7363cd80332c3486818eecac69008ec476a768bbedf"

      define_method :install do
        bin.install "profilecli"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/grafana/pyroscope/releases/download/v2.1.0/profilecli_2.1.0_linux_arm64.tar.gz"
      sha256 "02715d09f81763c5aa8e014c0d26bd9310a942c9ee6ca24820d1018f434a66aa"

      define_method :install do
        bin.install "profilecli"
      end
    end
  end

  test do
    system bin/"profilecli", "--version"
  end
end
