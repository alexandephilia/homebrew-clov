class Clov < Formula
  desc "Clov Token Omitter - High-performance CLI proxy to minimize LLM token consumption"
  homepage "https://github.com/alexandephilia/clov-ai"
  version "0.33.0"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/alexandephilia/clov-ai/releases/download/v0.33.0/clov-aarch64-apple-darwin.tar.gz"
    sha256 "00b63fd2b622127fe5c14680a196b7e6c3ab1d03117d8ff2684791613b10c89e"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/alexandephilia/clov-ai/releases/download/v0.33.0/clov-x86_64-apple-darwin.tar.gz"
    sha256 "a4e23e5dcd97a6df7d83c640721525d3ebe61fff4660f38f4d41f8a85b763727"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/alexandephilia/clov-ai/releases/download/v0.33.0/clov-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "d74e883e1c2a7e6a3a5f844c7d122f595c5f0cd34fb7f07b00be137d5472133a"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/alexandephilia/clov-ai/releases/download/v0.33.0/clov-x86_64-unknown-linux-musl.tar.gz"
    sha256 "3a4693b6f0aea5c9e71e63e1d5a71819422965e5567c27887de7c7d94762590a"
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
