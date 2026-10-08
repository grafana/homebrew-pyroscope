# Do not edit .rb file manually, edit .rb.tpl instead
class Pyroscope < Formula
  desc "Open source continuous profiling software"
  homepage "https://grafana.com/oss/pyroscope/"
  license "AGPL-3.0-only"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/grafana/pyroscope/releases/download/v2.3.2/pyroscope_2.3.2_darwin_amd64.tar.gz"
      sha256 "a3877d18c0ce7554985f6baef9b6762ae161b8d30d08ce7fe6aeeb890dfd4914"

      define_method :install do
        bin.install "pyroscope"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/grafana/pyroscope/releases/download/v2.3.2/pyroscope_2.3.2_darwin_arm64.tar.gz"
      sha256 "2560e2fdd172dfeec0ceed7714959cb17cda452c481ed150269cb81b82977d38"

      define_method :install do
        bin.install "pyroscope"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/grafana/pyroscope/releases/download/v2.3.2/pyroscope_2.3.2_linux_amd64.tar.gz"
      sha256 "8ae160b070818f83445accb9e38e7b92e11d5ebe43a22262d9e2aa0357e68d98"

      define_method :install do
        bin.install "pyroscope"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/grafana/pyroscope/releases/download/v2.3.2/pyroscope_2.3.2_linux_arm64.tar.gz"
      sha256 "5a09b05bdb48ee1ebc0ab18caa9578e087e8d3ade30cfcad1cfb05f7ccc82d51"

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
