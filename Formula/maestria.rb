class Maestria < Formula
  REPO = "paulo-lucas/maestria"

  desc "Self-hosted control panel and Maestro protocol CLI for Maestri workspaces"
  homepage "https://github.com/#{REPO}"
  version "0.1.6"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/#{REPO}/releases/download/v#{version}/maestria_#{version}_darwin_arm64.tar.gz"
      sha256 "9c1628ed2ed6f486e4fd762970125efdba0cd24300da4320620ba4fb670205b5"
    end

    on_intel do
      url "https://github.com/#{REPO}/releases/download/v#{version}/maestria_#{version}_darwin_amd64.tar.gz"
      sha256 "0eee001eb13e5f970afa864560f5755cfcd586945345149469cf3ff6db3d79ed"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/#{REPO}/releases/download/v#{version}/maestria_#{version}_linux_arm64.tar.gz"
      sha256 "3418a0d20c2fd5d6fb8c01382e3a00fad72b05b6d5aa85c6e93aef63ae93d7d8"
    end

    on_intel do
      url "https://github.com/#{REPO}/releases/download/v#{version}/maestria_#{version}_linux_amd64.tar.gz"
      sha256 "7abb48e7d99580540529ecd352ac21edb2366169feb73e9d9453273d4701f277"
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
