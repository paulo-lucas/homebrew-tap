class Maestria < Formula
  REPO = "paulo-lucas/maestria"

  desc "Self-hosted control panel and Maestro protocol CLI for Maestri workspaces"
  homepage "https://github.com/#{REPO}"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/#{REPO}/releases/download/v#{version}/maestria_#{version}_darwin_arm64.tar.gz"
      sha256 "b81c1b58bb5c367b0ee185f6a0bea4a9d07749ab3f5b8f99063aaee5095ed582"
    end

    on_intel do
      url "https://github.com/#{REPO}/releases/download/v#{version}/maestria_#{version}_darwin_amd64.tar.gz"
      sha256 "66a12b434d5f8e39ff7e14abb5a22d3d560a122906e3a6e55a48169c23599ede"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/#{REPO}/releases/download/v#{version}/maestria_#{version}_linux_arm64.tar.gz"
      sha256 "8f81c5d6ea9e3ea461eb05cb971e119eac9efc82cdfef1e4e07cf15867633bce"
    end

    on_intel do
      url "https://github.com/#{REPO}/releases/download/v#{version}/maestria_#{version}_linux_amd64.tar.gz"
      sha256 "dd43ce470b89425d202e8bc4c05a10f4d3b366f6e7e50dfa84c2185b5fbeeab4"
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
