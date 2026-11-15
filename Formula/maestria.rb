class Maestria < Formula
  REPO = "paulo-lucas/maestria"

  desc "Self-hosted control panel and Maestro protocol CLI for Maestri workspaces"
  homepage "https://github.com/#{REPO}"
  version "0.1.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/#{REPO}/releases/download/v#{version}/maestria_#{version}_darwin_arm64.tar.gz"
      sha256 "34990d9081c6853a877463d1e15585d8309b75c9704ce241765ae44c6b7c5bcd"
    end

    on_intel do
      url "https://github.com/#{REPO}/releases/download/v#{version}/maestria_#{version}_darwin_amd64.tar.gz"
      sha256 "9f923928844b66db439e1d902d0e7dac9d9e7aa62bffb84080af87ea13e6d2d8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/#{REPO}/releases/download/v#{version}/maestria_#{version}_linux_arm64.tar.gz"
      sha256 "f6b8ae8f94fa1ec1ac395b1ae1b3c90af867ecf0984ea9d02ed886d06b1e9ae6"
    end

    on_intel do
      url "https://github.com/#{REPO}/releases/download/v#{version}/maestria_#{version}_linux_amd64.tar.gz"
      sha256 "2bff533da7f7fa3f0679ab3cbb80b2e7972a9a5132dbeb7011e87a79c1fffa5b"
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
