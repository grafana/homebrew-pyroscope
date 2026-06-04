# Do not edit .rb file manually, edit .rb.tpl instead
class Profilecli < Formula
  desc "Open source continuous profiling software"
  homepage "https://grafana.com/oss/pyroscope/"
  version "2.0.3"
  license "AGPL-3.0-only"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/grafana/pyroscope/releases/download/v2.0.3/profilecli_2.0.3_darwin_amd64.tar.gz"
      sha256 "cc21d4189b6220d3d44b5e8d4e96523ed431929e8accf49a914b77a1026f8027"

      define_method :install do
        bin.install "profilecli"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/grafana/pyroscope/releases/download/v2.0.3/profilecli_2.0.3_darwin_arm64.tar.gz"
      sha256 "f3f1c5af9b4a45bffeb5e04fd9580a5745132cd7c4897a17e244c80ddd645cce"

      define_method :install do
        bin.install "profilecli"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/grafana/pyroscope/releases/download/v2.0.3/profilecli_2.0.3_linux_amd64.tar.gz"
      sha256 "9bf8cb0e73bc9e2db73302455f313f5dc2bcb9396fb71744d2ad9365fa0e015d"

      define_method :install do
        bin.install "profilecli"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/grafana/pyroscope/releases/download/v2.0.3/profilecli_2.0.3_linux_arm64.tar.gz"
      sha256 "c7b843a9bfff7dac81223e97fd32325749ae61c237a0019ab69fd7a75423d88b"

      define_method :install do
        bin.install "profilecli"
      end
    end
  end

  test do
    system bin/"profilecli", "--version"
  end
end
