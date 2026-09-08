# Do not edit .rb file manually, edit .rb.tpl instead
class Profilecli < Formula
  desc "Open source continuous profiling software"
  homepage "https://grafana.com/oss/pyroscope/"
  license "AGPL-3.0-only"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/grafana/pyroscope/releases/download/v2.2.2/profilecli_2.2.2_darwin_amd64.tar.gz"
      sha256 "e00875ddbf552b2b7f6ee7444052731716b3cf0c5f19ab12816e59bf7ff84a89"

      define_method :install do
        bin.install "profilecli"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/grafana/pyroscope/releases/download/v2.2.2/profilecli_2.2.2_darwin_arm64.tar.gz"
      sha256 "0d2a5c9f489eaaa8f03047fcf9c8528964e7079e427add2657636406feb637ca"

      define_method :install do
        bin.install "profilecli"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/grafana/pyroscope/releases/download/v2.2.2/profilecli_2.2.2_linux_amd64.tar.gz"
      sha256 "ffa1102af9d4e80d8c4a23f1620e219d8afafda77bf6e334b2cce4ffe4cd8094"

      define_method :install do
        bin.install "profilecli"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/grafana/pyroscope/releases/download/v2.2.2/profilecli_2.2.2_linux_arm64.tar.gz"
      sha256 "08e1aa233fa3207aa61df1560d762a16a2b593804b3025d5d26fb2ca5549adab"

      define_method :install do
        bin.install "profilecli"
      end
    end
  end

  test do
    system bin/"profilecli", "--version"
  end
end
