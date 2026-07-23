# Do not edit .rb file manually, edit .rb.tpl instead
class Profilecli < Formula
  desc "Open source continuous profiling software"
  homepage "https://grafana.com/oss/pyroscope/"
  version "2.2.0"
  license "AGPL-3.0-only"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/grafana/pyroscope/releases/download/v2.2.0/profilecli_2.2.0_darwin_amd64.tar.gz"
      sha256 "72b143d238559d3c3f7c494558c08ddcfcf6c97c3da20370b1a96fdb9655b94b"

      define_method :install do
        bin.install "profilecli"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/grafana/pyroscope/releases/download/v2.2.0/profilecli_2.2.0_darwin_arm64.tar.gz"
      sha256 "3db85f79e6443a1e58c93376b82ce5637517290cd0da71872ef36d342fe3094e"

      define_method :install do
        bin.install "profilecli"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/grafana/pyroscope/releases/download/v2.2.0/profilecli_2.2.0_linux_amd64.tar.gz"
      sha256 "b26424d2084e748d854db308a6f601c8dedf02761ba69b65ae62f141ffd43c69"

      define_method :install do
        bin.install "profilecli"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/grafana/pyroscope/releases/download/v2.2.0/profilecli_2.2.0_linux_arm64.tar.gz"
      sha256 "c501feeba9b02de1dc4eca7ee6f33612a62967d6fae1fb3e4d9353e52aa6ddab"

      define_method :install do
        bin.install "profilecli"
      end
    end
  end

  test do
    system bin/"profilecli", "--version"
  end
end
