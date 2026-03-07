class Clov < Formula
  desc "Clov Token Omitter - High-performance CLI proxy to minimize LLM token consumption"
  homepage "https://github.com/alexandephilia/clov-ai"
  version "0.26.4"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/alexandephilia/clov-ai/releases/download/v0.26.4/clov-aarch64-apple-darwin.tar.gz"
    sha256 "4212f231eb1a24c28aebcfe8261d5c1fee6ab588afa78b6f7166a390b469f235"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/alexandephilia/clov-ai/releases/download/v0.26.4/clov-x86_64-apple-darwin.tar.gz"
    sha256 "7dd253316bb150f6802023df0e257e0a470793977575bb8361fcde3f184e1c57"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/alexandephilia/clov-ai/releases/download/v0.26.4/clov-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "4e430cd132028a3dd749b2e79a68c85aa059c7e4bd82212576cfdb9cc08e3692"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/alexandephilia/clov-ai/releases/download/v0.26.4/clov-x86_64-unknown-linux-musl.tar.gz"
    sha256 "7a964984171298e7294701ce26cb299f83928235d81657da871351d5fad5b4a7"
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
