# Do not edit .rb file manually, edit .rb.tpl instead
class Pyroscope < Formula
  desc "Open source continuous profiling software"
  homepage "https://grafana.com/oss/pyroscope/"
  license "AGPL-3.0-only"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/grafana/pyroscope/releases/download/v2.4.1/pyroscope_2.4.1_darwin_amd64.tar.gz"
      sha256 "1357e62709c6f12328a21291cd60f949cb391dbd8fe2a2ef0dedde16b532755d"

      define_method :install do
        bin.install "pyroscope"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/grafana/pyroscope/releases/download/v2.4.1/pyroscope_2.4.1_darwin_arm64.tar.gz"
      sha256 "945c617c9dd408e4bd29db236a27fc3bc00c8475b4d12b905da8b75148766c94"

      define_method :install do
        bin.install "pyroscope"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/grafana/pyroscope/releases/download/v2.4.1/pyroscope_2.4.1_linux_amd64.tar.gz"
      sha256 "ba345dc96cd390f300f245a92f4ccb459bb651824651098714c4262139d750b5"

      define_method :install do
        bin.install "pyroscope"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/grafana/pyroscope/releases/download/v2.4.1/pyroscope_2.4.1_linux_arm64.tar.gz"
      sha256 "86741127b66f85aea40f2a23427a6007a6eb1481235c703f54796f14d20ea924"

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
