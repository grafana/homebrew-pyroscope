# Do not edit .rb file manually, edit .rb.tpl instead
class Pyroscope < Formula
  desc "Open source continuous profiling software"
  homepage "https://grafana.com/oss/pyroscope/"
  license "AGPL-3.0-only"

  def pyroscope_conf
    <<~EOS
      ---
      pyroscopedb:
        data_path: #{var}/lib/pyroscope
    EOS
  end

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/grafana/pyroscope/releases/download/v2.2.2/pyroscope_2.2.2_darwin_amd64.tar.gz"
      sha256 "505ea488a1e6195cea9d7fcafeef778b5ce1df8272a389a74b41c9c5e5b880ff"

      define_method :install do
        bin.install "pyroscope"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/grafana/pyroscope/releases/download/v2.2.2/pyroscope_2.2.2_darwin_arm64.tar.gz"
      sha256 "e79f70e3a0cb1ea5b86f99d85eb71f2f76ec28c0906c0013b1478fb3f8ff858d"

      define_method :install do
        bin.install "pyroscope"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/grafana/pyroscope/releases/download/v2.2.2/pyroscope_2.2.2_linux_amd64.tar.gz"
      sha256 "aaa54c164f8e9de2a753cb0925ae735270ffc45359cfb1c6517721f8a4545cc7"

      define_method :install do
        bin.install "pyroscope"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/grafana/pyroscope/releases/download/v2.2.2/pyroscope_2.2.2_linux_arm64.tar.gz"
      sha256 "ff25bc2745f9407c712768e0573bbaecf1f567ac05cddc66b0003278fc5193ff"

      define_method :install do
        bin.install "pyroscope"
      end
    end
  end

  def post_install
    (var/"log/pyroscope").mkpath
    (var/"lib/pyroscope").mkpath
    (etc/"pyroscope").mkpath
    (etc/"pyroscope/config.yaml").write pyroscope_conf unless File.exist?(etc/"pyroscope/config.yaml")
  end

  service do
    run [opt_bin/"pyroscope", "-config.file", "#{HOMEBREW_PREFIX}/etc/pyroscope/config.yaml"]
    environment_variables PATH: std_service_path_env
    keep_alive true
    error_log_path "#{var}/log/pyroscope/server-stderr.log"
    log_path "#{var}/log/pyroscope/server-stdout.log"
    process_type :background

    working_dir "#{var}/lib/pyroscope"
  end

  test do
    system bin/"pyroscope", "--version"
  end
end
