class Clov < Formula
  desc "Clov Token Omitter - High-performance CLI proxy to minimize LLM token consumption"
  homepage "https://github.com/alexandephilia/clov-ai"
  version "0.35.0"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/alexandephilia/clov-ai/releases/download/v0.35.0/clov-aarch64-apple-darwin.tar.gz"
    sha256 "0c96d5854426b54cb304fc68891c628e5d8405434086d550e59798f0e498d1c0"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/alexandephilia/clov-ai/releases/download/v0.35.0/clov-x86_64-apple-darwin.tar.gz"
    sha256 "60751ef395fce2c0fb6cf0b2bebad0cb946b133f15bf292bd9dd4db171cbdd27"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/alexandephilia/clov-ai/releases/download/v0.35.0/clov-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "48bcb8dfbfbbb5adaf3499c1bb40d1387a12291b2d9efef0dd7db93656f33d07"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/alexandephilia/clov-ai/releases/download/v0.35.0/clov-x86_64-unknown-linux-musl.tar.gz"
    sha256 "4a0f80082aaa3f76b728827db9535700d89c5fcae81dc55b5b763d34016b0b25"
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
