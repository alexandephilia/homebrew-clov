class Clov < Formula
  desc "Clov Token Omitter - High-performance CLI proxy to minimize LLM token consumption"
  homepage "https://github.com/alexandephilia/clov-ai"
  version "0.29.4"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/alexandephilia/clov-ai/releases/download/v0.29.4/clov-aarch64-apple-darwin.tar.gz"
    sha256 "1864f211a2b5abd6f65199c4e5fc8911bf28721b1a642ddcc9316eefe6670899"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/alexandephilia/clov-ai/releases/download/v0.29.4/clov-x86_64-apple-darwin.tar.gz"
    sha256 "5a6db7a530899a5e8c53865cb20605ccce0a008bc300456e05154aa14e37e56d"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/alexandephilia/clov-ai/releases/download/v0.29.4/clov-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "273d3474c932f54d7b0ce69d7bb899146cd807c1e4844af52c58e7fb1a8dc713"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/alexandephilia/clov-ai/releases/download/v0.29.4/clov-x86_64-unknown-linux-musl.tar.gz"
    sha256 "c281f41d239e38e4cd5819f5001291447b9202cac356874a5dd4fd72376df92d"
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
