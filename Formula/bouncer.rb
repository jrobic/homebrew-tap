# Supported: macOS Apple Silicon, Linux x64 — other platforms: build from the checkout (README)
class Bouncer < Formula
  desc "Guard coding-agent tool calls with declarative policy"
  homepage "https://github.com/jrobic/agent-bouncer"
  version "1.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/jrobic/agent-bouncer/releases/download/v1.1.0/bouncer-1.1.0-darwin-arm64.tar.gz"
      sha256 "35fafcbb4adde87ba38cdccf7f19bc91e601274ef308ad27813974ca783daa4f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/jrobic/agent-bouncer/releases/download/v1.1.0/bouncer-1.1.0-linux-x64.tar.gz"
      sha256 "6099f9b5a5c92936052dee457df68c3d5b30cdbe976d0b68131e3cc975c388de"
    end
  end

  def install
    bin.install "bouncer"
  end

  caveats do
    <<~EOS
      bouncer is installed at #{HOMEBREW_PREFIX}/bin/bouncer. Wire that path,
      never the Cellar path, into your harness (`bouncer doctor` checks it).
      pi/omp users: the printed extension bakes the absolute binary path; under
      Homebrew that path changes on upgrade. Export
      BOUNCER_BIN=#{HOMEBREW_PREFIX}/bin/bouncer in your shell, or reprint the
      extension after each upgrade (`bouncer harness shim pi-agent`).
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bouncer --version")
  end
end
