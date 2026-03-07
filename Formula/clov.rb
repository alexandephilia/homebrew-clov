class Clov < Formula
  desc "Clov Token Omitter - High-performance CLI proxy to minimize LLM token consumption"
  homepage "https://github.com/alexandephilia/clov-ai"
  version "0.29.0"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/alexandephilia/clov-ai/releases/download/v0.29.0/clov-aarch64-apple-darwin.tar.gz"
    sha256 "5c635693a6682acedcc774ba391963105b8d9a214d2a1bf7c7f674ba49e540cd"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/alexandephilia/clov-ai/releases/download/v0.29.0/clov-x86_64-apple-darwin.tar.gz"
    sha256 "5bd06331cfc83e89f3be1681e6d76b3f53ea80a82b41f0311db72fbc19f11bb8"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/alexandephilia/clov-ai/releases/download/v0.29.0/clov-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "d5ef62846dab91ebaa7dc844fed588596c1c60ffdb7c7ef54eabfcb25bda6db6"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/alexandephilia/clov-ai/releases/download/v0.29.0/clov-x86_64-unknown-linux-musl.tar.gz"
    sha256 "5dc8f30d0bf86a0b40b21c338189f237135717060a6977d51ff654a8efd89b43"
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
