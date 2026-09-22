# Supported: macOS Apple Silicon, Linux x64 — other platforms: build from the checkout (README)
class Bouncer < Formula
  desc "Guard coding-agent tool calls with declarative policy"
  homepage "https://github.com/jrobic/agent-bouncer"
  version "1.5.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/jrobic/agent-bouncer/releases/download/v1.5.0/bouncer-1.5.0-darwin-arm64.tar.gz"
      sha256 "f3780b51fbd84edb0308c574999a0dfe52eb90482a69b5a8b4968c54e50b6d6e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/jrobic/agent-bouncer/releases/download/v1.5.0/bouncer-1.5.0-linux-x64.tar.gz"
      sha256 "24c4e595b1cd6068186fac765a8d439e436ec8f1dacddfedca5277d388b4e77f"
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
