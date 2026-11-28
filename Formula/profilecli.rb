# Do not edit .rb file manually, edit .rb.tpl instead
class Profilecli < Formula
  desc "Open source continuous profiling software"
  homepage "https://grafana.com/oss/pyroscope/"
  license "AGPL-3.0-only"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/grafana/pyroscope/archive/refs/tags/v2.4.4.tar.gz"
      sha256 "90afc054bb74a02125518c933d6e2b2df01ffb7fea448d69ae8174c25f4d49bc"

      define_method :install do
        bin.install "profilecli"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/grafana/pyroscope/releases/download/v2.4.4/profilecli_2.4.4_darwin_arm64.tar.gz"
      sha256 "78c423cf8fcd97376e38058b29c7014743ff4dc11983f8591f88a23bd886b8d6"

      define_method :install do
        bin.install "profilecli"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/grafana/pyroscope/releases/download/v2.4.4/profilecli_2.4.4_linux_amd64.tar.gz"
      sha256 "b0d1bb682577e2c81fb9af459961922f519af8045cb13f6301d676d76c6e21b4"

      define_method :install do
        bin.install "profilecli"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/grafana/pyroscope/releases/download/v2.4.4/profilecli_2.4.4_linux_arm64.tar.gz"
      sha256 "072dd3a32adca20722d09d4634e5db77f2bd15484f9de11bcfd4f5dbc9ba09af"

      define_method :install do
        bin.install "profilecli"
      end
    end
  end

  test do
    system bin/"profilecli", "--version"
  end
end
