# Supported: macOS Apple Silicon, Linux x64 — other platforms: build from the checkout (README)
class Bouncer < Formula
  desc "Guard coding-agent tool calls with declarative policy"
  homepage "https://github.com/jrobic/agent-bouncer"
  version "1.7.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/jrobic/agent-bouncer/releases/download/v1.7.0/bouncer-1.7.0-darwin-arm64.tar.gz"
      sha256 "d0084746ea3efe676ad4480de6510f5642b12cbb44123a87afbf40384c4538e2"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/jrobic/agent-bouncer/releases/download/v1.7.0/bouncer-1.7.0-linux-x64.tar.gz"
      sha256 "cf495bfa7bf5a3892d260665c338b52acd01a64345bd69f44843fc3447f8e4f7"
    end
  end

  def install
    bin.install "bouncer"
  end

  def caveats
    <<~EOS
      bouncer is installed at #{HOMEBREW_PREFIX}/bin/bouncer. Wire that path,
      never the Cellar path, into your harness (`bouncer doctor` checks it).
      pi/omp users: print the extension through that path, never the Cellar path
      (`brew upgrade` removes it and every tool call then fails closed):
      `#{HOMEBREW_PREFIX}/bin/bouncer harness shim pi-agent`, or
      `bouncer harness shim pi-agent --bin #{HOMEBREW_PREFIX}/bin/bouncer`.
      `bouncer doctor --harness pi-agent` fails a shim that bakes a Cellar path.
      The bouncer-policy skill is printed by `bouncer skill policy`; reprint it after each upgrade.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bouncer --version")
  end
end
