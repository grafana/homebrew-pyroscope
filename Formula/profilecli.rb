# Do not edit .rb file manually, edit .rb.tpl instead
class Profilecli < Formula
  desc "Open source continuous profiling software"
  homepage "https://grafana.com/oss/pyroscope/"
  version "2.2.1"
  license "AGPL-3.0-only"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/grafana/pyroscope/releases/download/v2.2.1/profilecli_2.2.1_darwin_amd64.tar.gz"
      sha256 "95f00a59e0f65877f0791d7a8d4306b357417a3d33ccb28bdd4413637de91bae"

      define_method :install do
        bin.install "profilecli"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/grafana/pyroscope/releases/download/v2.2.1/profilecli_2.2.1_darwin_arm64.tar.gz"
      sha256 "fca68a911e1b36a39b3eb4a43a531068312083c8d8ec5d835aa6a95d13847bf1"

      define_method :install do
        bin.install "profilecli"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/grafana/pyroscope/releases/download/v2.2.1/profilecli_2.2.1_linux_amd64.tar.gz"
      sha256 "13da7a181c45c9058b9fc2cb8914635a6b161e1a4b24ddd2c8fbaa8075566b78"

      define_method :install do
        bin.install "profilecli"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/grafana/pyroscope/releases/download/v2.2.1/profilecli_2.2.1_linux_arm64.tar.gz"
      sha256 "a35a2f13e82a8dd76b84588e853586124804d20c409969979ef51c55d74fb1f9"

      define_method :install do
        bin.install "profilecli"
      end
    end
  end

  test do
    system bin/"profilecli", "--version"
  end
end
