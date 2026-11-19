class Maestria < Formula
  REPO = "paulo-lucas/maestria"

  desc "Self-hosted control panel and Maestro protocol CLI for Maestri workspaces"
  homepage "https://github.com/#{REPO}"
  version "0.1.7"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/#{REPO}/releases/download/v#{version}/maestria_#{version}_darwin_arm64.tar.gz"
      sha256 "496b798420b6381f0ce1d9138446a704a426c7b2c10f5bc237f3ddf588d0c708"
    end

    on_intel do
      url "https://github.com/#{REPO}/releases/download/v#{version}/maestria_#{version}_darwin_amd64.tar.gz"
      sha256 "4efdd1ccc6e8d77961a57724eb877079607c64d80a2b8b26d3bfd0d0e3947054"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/#{REPO}/releases/download/v#{version}/maestria_#{version}_linux_arm64.tar.gz"
      sha256 "d46ca0301b92d2f7dd36925fc6ffac26187e9aff7356205e4f1593bdb2d3343d"
    end

    on_intel do
      url "https://github.com/#{REPO}/releases/download/v#{version}/maestria_#{version}_linux_amd64.tar.gz"
      sha256 "021113f5f7deaa734f00942ddd08d036257e23cd9ed04883cf0ba6fd1ed2157b"
    end
  end

  def install
    bin.install "maestria"
  end

  def caveats
    <<~EOS
      Run the interactive setup wizard to configure credentials, workspaces, and optional background service:
        maestria init

      Or manage the per-user background service anytime:
        maestria service install
        maestria service start
    EOS
  end

  test do
    assert_match "maestria #{version}", shell_output("#{bin}/maestria version")
  end
end
