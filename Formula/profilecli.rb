# Do not edit .rb file manually, edit .rb.tpl instead
class Profilecli < Formula
  desc "Open source continuous profiling software"
  homepage "https://grafana.com/oss/pyroscope/"
  license "AGPL-3.0-only"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/grafana/pyroscope/releases/download/v2.3.1/profilecli_2.3.1_darwin_amd64.tar.gz"
      sha256 "94339709928f197d81ff6bc5015720f2850f09761bb48eda58c3c5206e762469"

      define_method :install do
        bin.install "profilecli"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/grafana/pyroscope/releases/download/v2.3.1/profilecli_2.3.1_darwin_arm64.tar.gz"
      sha256 "0f764668a3b8c182a083ce88de5fb19603a4299b7365885d25f07fa1f74f4710"

      define_method :install do
        bin.install "profilecli"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/grafana/pyroscope/releases/download/v2.3.1/profilecli_2.3.1_linux_amd64.tar.gz"
      sha256 "c01eb19acce7a966d992117bbbd59aa7efacc58922b17450cdebfeb0c994308b"

      define_method :install do
        bin.install "profilecli"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/grafana/pyroscope/releases/download/v2.3.1/profilecli_2.3.1_linux_arm64.tar.gz"
      sha256 "790c3183f9ce8d4a8904a19588f23a32e8483a0970074696c6d662c636b8ace2"

      define_method :install do
        bin.install "profilecli"
      end
    end
  end

  test do
    system bin/"profilecli", "--version"
  end
end
