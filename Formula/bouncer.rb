# Supported: macOS Apple Silicon, Linux x64 — other platforms: build from the checkout (README)
class Bouncer < Formula
  desc "Guard coding-agent tool calls with declarative policy"
  homepage "https://github.com/jrobic/agent-bouncer"
  version "1.4.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/jrobic/agent-bouncer/releases/download/v1.4.0/bouncer-1.4.0-darwin-arm64.tar.gz"
      sha256 "6a0e49e9729ad5c8401c31128302906682e0ee14602738337e292a9a68784176"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/jrobic/agent-bouncer/releases/download/v1.4.0/bouncer-1.4.0-linux-x64.tar.gz"
      sha256 "ec2b98a7682042f2e633a2dd999f20669213df936df80ec7164036ed89f12046"
    end
  end

  def install
    bin.install "bouncer"
  end

  def caveats
    <<~EOS
      bouncer is installed at #{HOMEBREW_PREFIX}/bin/bouncer. Wire that path,
      never the Cellar path, into your harness (`bouncer doctor` checks it).
      pi/omp users: the printed extension bakes the absolute binary path; under
      Homebrew that path changes on upgrade. Export
      BOUNCER_BIN=#{HOMEBREW_PREFIX}/bin/bouncer in your shell, or reprint the
      extension after each upgrade (`bouncer harness shim pi-agent`).
      The bouncer-policy skill is printed by `bouncer skill policy`; reprint it after each upgrade.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bouncer --version")
  end
end
