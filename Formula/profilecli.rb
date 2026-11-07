# Do not edit .rb file manually, edit .rb.tpl instead
class Profilecli < Formula
  desc "Open source continuous profiling software"
  homepage "https://grafana.com/oss/pyroscope/"
  license "AGPL-3.0-only"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/grafana/pyroscope/archive/refs/tags/v2.4.2.tar.gz"
      sha256 "ef9326fd4f861dee64612ac9bac13d75451cd84ad997883e1da60d3885517f3c"

      define_method :install do
        bin.install "profilecli"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/grafana/pyroscope/releases/download/v2.4.2/profilecli_2.4.2_darwin_arm64.tar.gz"
      sha256 "505488752df407f4d53251179edada6655c72de7138bbe75933551a4fa5d0fbd"

      define_method :install do
        bin.install "profilecli"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/grafana/pyroscope/releases/download/v2.4.2/profilecli_2.4.2_linux_amd64.tar.gz"
      sha256 "f6bd6e2f1f4c8ba2ae010602797eb9a9c2f68edd7d9eb2062945bb6e4e2b46b4"

      define_method :install do
        bin.install "profilecli"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/grafana/pyroscope/releases/download/v2.4.2/profilecli_2.4.2_linux_arm64.tar.gz"
      sha256 "2947bcd65615b01da5ae4065ead264a6928dc6b0073ad1d1600122298b25e3a0"

      define_method :install do
        bin.install "profilecli"
      end
    end
  end

  test do
    system bin/"profilecli", "--version"
  end
end
