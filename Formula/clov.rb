class Clov < Formula
  desc "Clov Token Omitter - High-performance CLI proxy to minimize LLM token consumption"
  homepage "https://github.com/alexandephilia/clov-ai"
  version "0.34.4"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/alexandephilia/clov-ai/releases/download/v0.34.4/clov-aarch64-apple-darwin.tar.gz"
    sha256 "73d4efaecf639255f15e57833d85c4ce7229b170b253a2efc8dc4faf42efd045"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/alexandephilia/clov-ai/releases/download/v0.34.4/clov-x86_64-apple-darwin.tar.gz"
    sha256 "21c4dd8db2d6837e4e0b629b6496b583366714a4db261fda7647020b54928c36"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/alexandephilia/clov-ai/releases/download/v0.34.4/clov-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "3ecb1a89a7ad38ec7f3600920e28e07b2123a36240a124f22edc5f18cb74963d"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/alexandephilia/clov-ai/releases/download/v0.34.4/clov-x86_64-unknown-linux-musl.tar.gz"
    sha256 "09e619cebe41e38f402ad3ea86b0bac32b92c7d5c6949ac1e2c2d4d8d644220b"
  end

  def install
    bin.install "clov"
  end

  def caveats
    <<~EOS
      clov is installed! Get started:

        # Initialize for Claude Code
        clov init -g          # Global hook-first setup (recommended)
        clov init             # Add to ./CLAUDE.md (this project only)

        # See all commands
        clov --help

        # Measure your token savings
        clov gain

      Full documentation: https://github.com/alexandephilia/clov-ai
    EOS
  end

  test do
    system "#{bin}/clov", "--version"
  end
end
