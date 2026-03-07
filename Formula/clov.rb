class Clov < Formula
  desc "Clov Token Omitter - High-performance CLI proxy to minimize LLM token consumption"
  homepage "https://github.com/alexandephilia/clov-ai"
  version "0.27.2"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/alexandephilia/clov-ai/releases/download/v0.27.2/clov-aarch64-apple-darwin.tar.gz"
    sha256 "3a2b7c43d28682e45e3b45d84caa5421cd2c58885559df7482714e1ff6d149e3"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/alexandephilia/clov-ai/releases/download/v0.27.2/clov-x86_64-apple-darwin.tar.gz"
    sha256 "782e4e95ca555b53385b374ee5169ad1538f933871d64d8dc2a5bb3d96671a00"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/alexandephilia/clov-ai/releases/download/v0.27.2/clov-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "57eac1d61efbfcbebc20571cbd7f947649139fbaff077960bae8c3553f859958"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/alexandephilia/clov-ai/releases/download/v0.27.2/clov-x86_64-unknown-linux-musl.tar.gz"
    sha256 "9487be0077421a3194560e7b8c10c27cd8c900331cd94ddf8a9bcda5b0437d8a"
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
