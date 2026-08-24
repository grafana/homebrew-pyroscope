# Do not edit .rb file manually, edit .rb.tpl instead
class Profilecli < Formula
  desc "Open source continuous profiling software"
  homepage "https://grafana.com/oss/pyroscope/"
  license "AGPL-3.0-only"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/grafana/pyroscope/releases/download/v2.3.0/profilecli_2.3.0_darwin_amd64.tar.gz"
      sha256 "d5a8d695956f940bef633c89d42751353989ab6af6952701e1d6ca0541df0ce1"

      define_method :install do
        bin.install "profilecli"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/grafana/pyroscope/releases/download/v2.3.0/profilecli_2.3.0_darwin_arm64.tar.gz"
      sha256 "738350f79904b64c4a76bf918cfc727c958920ac71a4ce71ca067e29505980d2"

      define_method :install do
        bin.install "profilecli"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/grafana/pyroscope/releases/download/v2.3.0/profilecli_2.3.0_linux_amd64.tar.gz"
      sha256 "b43520a9cc63ab8c2b5f622f15be18b5f903146b99b0656267c319f1e5c389bb"

      define_method :install do
        bin.install "profilecli"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/grafana/pyroscope/releases/download/v2.3.0/profilecli_2.3.0_linux_arm64.tar.gz"
      sha256 "6b00d7eb43dbdc98083c036317d6385bd12e24c31dbad41ddcec0f98366696c8"

      define_method :install do
        bin.install "profilecli"
      end
    end
  end

  test do
    system bin/"profilecli", "--version"
  end
end
