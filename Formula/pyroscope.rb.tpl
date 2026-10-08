# Do not edit .rb file manually, edit .rb.tpl instead
class Pyroscope < Formula
  desc "Open source continuous profiling software"
  homepage "https://grafana.com/oss/pyroscope/"
  license "AGPL-3.0-only"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/grafana/pyroscope/releases/download/{{.Tag}}/pyroscope_{{.Version}}_darwin_amd64.tar.gz"
      sha256 "{{.DarwinAmd64}}"

      define_method :install do
        bin.install "pyroscope"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/grafana/pyroscope/releases/download/{{.Tag}}/pyroscope_{{.Version}}_darwin_arm64.tar.gz"
      sha256 "{{.DarwinArm64}}"

      define_method :install do
        bin.install "pyroscope"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/grafana/pyroscope/releases/download/{{.Tag}}/pyroscope_{{.Version}}_linux_amd64.tar.gz"
      sha256 "{{.LinuxAmd64}}"

      define_method :install do
        bin.install "pyroscope"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/grafana/pyroscope/releases/download/{{.Tag}}/pyroscope_{{.Version}}_linux_arm64.tar.gz"
      sha256 "{{.LinuxArm64}}"

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
        data_path: {{"{{var}}"}}/lib/pyroscope
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
