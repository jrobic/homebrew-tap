# Supported: macOS Apple Silicon, Linux x64 — other platforms: build from the checkout (README)
class Bouncer < Formula
  desc "Guard coding-agent tool calls with declarative policy"
  homepage "https://github.com/jrobic/agent-bouncer"
  version "1.1.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/jrobic/agent-bouncer/releases/download/v1.1.2/bouncer-1.1.2-darwin-arm64.tar.gz"
      sha256 "82835fd60396fdf4bdecd1a14494f01447c680f5b1e1851fbe1df93ae1d31573"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/jrobic/agent-bouncer/releases/download/v1.1.2/bouncer-1.1.2-linux-x64.tar.gz"
      sha256 "c84423f38f1b51052360bc424e998ad609c50d809b3f8292159ceb6c303847c0"
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
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bouncer --version")
  end
end
