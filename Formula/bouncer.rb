# Supported: macOS Apple Silicon, Linux x64 — other platforms: build from the checkout (README)
class Bouncer < Formula
  desc "Guard coding-agent tool calls with declarative policy"
  homepage "https://github.com/jrobic/agent-bouncer"
  version "1.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/jrobic/agent-bouncer/releases/download/v1.2.0/bouncer-1.2.0-darwin-arm64.tar.gz"
      sha256 "09d91006162fccc31a81f916265b02bf24f25a5410fa6e928aa78da9e34ce04a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/jrobic/agent-bouncer/releases/download/v1.2.0/bouncer-1.2.0-linux-x64.tar.gz"
      sha256 "234471ab14f3eeae90039bd9afa4f74dc0b81b91dcd13494f43b7ca2b394bec3"
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
