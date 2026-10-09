# Do not edit .rb file manually, edit .rb.tpl instead
class Profilecli < Formula
  desc "Open source continuous profiling software"
  homepage "https://grafana.com/oss/pyroscope/"
  license "AGPL-3.0-only"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/grafana/pyroscope/releases/download/v2.4.0/profilecli_2.4.0_darwin_amd64.tar.gz"
      sha256 "2a865efd13d6ae65d698fbe7515e83b8799fa01d2ba1e6d74fc819b646d871f3"

      define_method :install do
        bin.install "profilecli"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/grafana/pyroscope/releases/download/v2.4.0/profilecli_2.4.0_darwin_arm64.tar.gz"
      sha256 "0455208a63b45c365703d921be25df1242a38aa5a1f15b2f0e669138a4ee7032"

      define_method :install do
        bin.install "profilecli"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/grafana/pyroscope/releases/download/v2.4.0/profilecli_2.4.0_linux_amd64.tar.gz"
      sha256 "10b0952f9d2aaa56b504e09000f2629fe216e565bf072a8e9a0212091efaa862"

      define_method :install do
        bin.install "profilecli"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/grafana/pyroscope/releases/download/v2.4.0/profilecli_2.4.0_linux_arm64.tar.gz"
      sha256 "aa33ba9a80fb80f69e16dfac8309d0f9e1de62178cf698d1d0767d9969d7e360"

      define_method :install do
        bin.install "profilecli"
      end
    end
  end

  test do
    system bin/"profilecli", "--version"
  end
end
