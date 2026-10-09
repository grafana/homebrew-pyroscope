# Do not edit .rb file manually, edit .rb.tpl instead
class Pyroscope < Formula
  desc "Open source continuous profiling software"
  homepage "https://grafana.com/oss/pyroscope/"
  license "AGPL-3.0-only"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/grafana/pyroscope/releases/download/v2.4.0/pyroscope_2.4.0_darwin_amd64.tar.gz"
      sha256 "ec7613bbfcd9b3e115cab1df5f9d50452460fbf10f35c35c1109cace2dd60cca"

      define_method :install do
        bin.install "pyroscope"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/grafana/pyroscope/releases/download/v2.4.0/pyroscope_2.4.0_darwin_arm64.tar.gz"
      sha256 "3b52cd203305f0de5082fad497b1eeb07524f8383d6aa272866e77c9f6f48ff2"

      define_method :install do
        bin.install "pyroscope"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/grafana/pyroscope/releases/download/v2.4.0/pyroscope_2.4.0_linux_amd64.tar.gz"
      sha256 "f9299f468d68f36da07f7fb5af412cc1327c8cd4140a223ce113c62a5172bfd9"

      define_method :install do
        bin.install "pyroscope"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/grafana/pyroscope/releases/download/v2.4.0/pyroscope_2.4.0_linux_arm64.tar.gz"
      sha256 "0ee457cfbe22dc842fc9764f91e99a821ed65dc1d210adeb048483aa8b35152a"

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
