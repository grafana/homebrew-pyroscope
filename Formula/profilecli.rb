# Do not edit .rb file manually, edit .rb.tpl instead
class Profilecli < Formula
  desc "Open source continuous profiling software"
  homepage "https://grafana.com/oss/pyroscope/"
  license "AGPL-3.0-only"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/grafana/pyroscope/releases/download/v2.3.2/profilecli_2.3.2_darwin_amd64.tar.gz"
      sha256 "1b738c48d77ce862a4dc4f1e402cd6e4cf51fc4cbe4795efb0452e3ce4ad22fe"

      define_method :install do
        bin.install "profilecli"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/grafana/pyroscope/releases/download/v2.3.2/profilecli_2.3.2_darwin_arm64.tar.gz"
      sha256 "1ae608978afa1cc1e12ce3e992d72261feb8e69270ce625de386f61264805883"

      define_method :install do
        bin.install "profilecli"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/grafana/pyroscope/releases/download/v2.3.2/profilecli_2.3.2_linux_amd64.tar.gz"
      sha256 "76cbb3c67b1e00ef9a2a7e689f6775c825871bc0e645f24c533d9d1eb7e5710f"

      define_method :install do
        bin.install "profilecli"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/grafana/pyroscope/releases/download/v2.3.2/profilecli_2.3.2_linux_arm64.tar.gz"
      sha256 "c98b30f8dae4090e5fac3bbceebfd1c33cf0c5b39b9bd804bd3d5b0eb7bde275"

      define_method :install do
        bin.install "profilecli"
      end
    end
  end

  test do
    system bin/"profilecli", "--version"
  end
end
