# Do not edit .rb file manually, edit .rb.tpl instead
class Pyroscope < Formula
  desc "Open source continuous profiling software"
  homepage "https://grafana.com/oss/pyroscope/"
  license "AGPL-3.0-only"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/grafana/pyroscope/archive/refs/tags/v2.4.2.tar.gz"
      sha256 "ef9326fd4f861dee64612ac9bac13d75451cd84ad997883e1da60d3885517f3c"

      define_method :install do
        bin.install "pyroscope"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/grafana/pyroscope/releases/download/v2.4.2/pyroscope_2.4.2_darwin_arm64.tar.gz"
      sha256 "8ae482327999180fea2e17c93300423eb3a509da90a0d42888ca506b39804ed8"

      define_method :install do
        bin.install "pyroscope"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/grafana/pyroscope/releases/download/v2.4.2/pyroscope_2.4.2_linux_amd64.tar.gz"
      sha256 "454c2fb2de731f300c1c5da2d1cd1a9791eb4d1a040be056217e4d593d430c16"

      define_method :install do
        bin.install "pyroscope"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/grafana/pyroscope/releases/download/v2.4.2/pyroscope_2.4.2_linux_arm64.tar.gz"
      sha256 "94db8b00da25025d96c0086d2bc1637cdd8cd8f4fb3e0ca50832a47965be75ed"

      define_method :install do
        bin.install "pyroscope"
      end
    end
  end

  post_install_steps do
    mkdir_p "log/pyroscope", base: :var
    mkdir_p "lib/pyroscope", base: :var
    mkdir_p "pyroscope", base: :etc
    write_file "pyroscope/config.yaml", <<~EOS, base: :etc, overwrite: false
      ---
      pyroscopedb:
        data_path: {{var}}/lib/pyroscope
    EOS
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
