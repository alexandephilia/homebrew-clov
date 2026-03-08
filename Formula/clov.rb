class Clov < Formula
  desc "Clov Token Omitter - High-performance CLI proxy to minimize LLM token consumption"
  homepage "https://github.com/alexandephilia/clov-ai"
  version "0.34.1"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/alexandephilia/clov-ai/releases/download/v0.34.1/clov-aarch64-apple-darwin.tar.gz"
    sha256 "e9c8103b14f2c6e4d1984543a1f1640e63737bbd55df31dcf2dcbf3b38c883d5"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/alexandephilia/clov-ai/releases/download/v0.34.1/clov-x86_64-apple-darwin.tar.gz"
    sha256 "38a1826a3ef0662cd76faa7dd499f43af12daab7c42a0197fecd914f9fa958a1"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/alexandephilia/clov-ai/releases/download/v0.34.1/clov-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "433aa20187fa318bb2d917535e16a2a0141e8b53e64e68e2c0fc0f0ae5909c73"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/alexandephilia/clov-ai/releases/download/v0.34.1/clov-x86_64-unknown-linux-musl.tar.gz"
    sha256 "a0a98de655a6fff9329ace70c40e3141ec22fe4d19fa37cfbc2641fdf6c380eb"
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
