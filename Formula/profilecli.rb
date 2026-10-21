# Do not edit .rb file manually, edit .rb.tpl instead
class Profilecli < Formula
  desc "Open source continuous profiling software"
  homepage "https://grafana.com/oss/pyroscope/"
  license "AGPL-3.0-only"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/grafana/pyroscope/releases/download/v2.4.1/profilecli_2.4.1_darwin_amd64.tar.gz"
      sha256 "7a0094c55ec9b523ef857d2ddab0d0a2b4731fe55aa4c89532a840cb21a9436c"

      define_method :install do
        bin.install "profilecli"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/grafana/pyroscope/releases/download/v2.4.1/profilecli_2.4.1_darwin_arm64.tar.gz"
      sha256 "e2835585b3601ab9db30483ad242e6ff403a8fb55e09f2f82c54d2525d901a44"

      define_method :install do
        bin.install "profilecli"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/grafana/pyroscope/releases/download/v2.4.1/profilecli_2.4.1_linux_amd64.tar.gz"
      sha256 "92515fc5a85ad550fdc9847bd58c7953e5ccc3692a519355dda45180c5bae793"

      define_method :install do
        bin.install "profilecli"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/grafana/pyroscope/releases/download/v2.4.1/profilecli_2.4.1_linux_arm64.tar.gz"
      sha256 "fb96ec720c8ac3d741628b19a14e4dd939eb53d328cc476f4ffd55ffbbdea659"

      define_method :install do
        bin.install "profilecli"
      end
    end
  end

  test do
    system bin/"profilecli", "--version"
  end
end
