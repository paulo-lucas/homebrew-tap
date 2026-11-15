class Maestria < Formula
  REPO = "paulo-lucas/maestria"

  desc "Self-hosted control panel and Maestro protocol CLI for Maestri workspaces"
  homepage "https://github.com/#{REPO}"
  version "0.1.5"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/#{REPO}/releases/download/v#{version}/maestria_#{version}_darwin_arm64.tar.gz"
      sha256 "ac0e975b456d76be2ff24014952e506ac99f9d0b468cbbb1d0ca65e4a7b1953c"
    end

    on_intel do
      url "https://github.com/#{REPO}/releases/download/v#{version}/maestria_#{version}_darwin_amd64.tar.gz"
      sha256 "0d1cc9b3893f7c300d59ca9fb9d073f0162215456c752e55b68eecc7f524cf94"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/#{REPO}/releases/download/v#{version}/maestria_#{version}_linux_arm64.tar.gz"
      sha256 "61b7c3cbdd0afb847e9deb60c7d2329bd938b1955fe4b342f052ebf437fec7d1"
    end

    on_intel do
      url "https://github.com/#{REPO}/releases/download/v#{version}/maestria_#{version}_linux_amd64.tar.gz"
      sha256 "35b5d3c0c77aa8ae6b5452469b65182cf041efeb1edf741013ce7fbec7bde9a0"
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
