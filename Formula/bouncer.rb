# Supported: macOS Apple Silicon, Linux x64 — other platforms: build from the checkout (README)
class Bouncer < Formula
  desc "Guard coding-agent tool calls with declarative policy"
  homepage "https://github.com/jrobic/agent-bouncer"
  version "1.9.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/jrobic/agent-bouncer/releases/download/v1.9.0/bouncer-1.9.0-darwin-arm64.tar.gz"
      sha256 "696abf9d039ed18643b94d889b3b4ce878fecaaeae20bfbb6ba0d124eb9b506d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/jrobic/agent-bouncer/releases/download/v1.9.0/bouncer-1.9.0-linux-x64.tar.gz"
      sha256 "e75857a68532c75a4359a1ea1d9aeb5b3e87de0102c4441c7afd09d87c7bbecb"
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
