class Clov < Formula
  desc "Clov Token Omitter - High-performance CLI proxy to minimize LLM token consumption"
  homepage "https://github.com/alexandephilia/clov-ai"
  version "0.28.0"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/alexandephilia/clov-ai/releases/download/v0.28.0/clov-aarch64-apple-darwin.tar.gz"
    sha256 "564ba0c702acf62c825c62c0ee040eadbec7858f73b8e023d803104476feb1a9"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/alexandephilia/clov-ai/releases/download/v0.28.0/clov-x86_64-apple-darwin.tar.gz"
    sha256 "3270f35ff202c3fca3060f723ca376433229651cacf6ed7b7c4a2e04b93e5f98"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/alexandephilia/clov-ai/releases/download/v0.28.0/clov-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "4a28679464f77896c484183ad884122a1007467eaef03e0830bf0f42f34737b8"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/alexandephilia/clov-ai/releases/download/v0.28.0/clov-x86_64-unknown-linux-musl.tar.gz"
    sha256 "1cbcbd6c6633dffecbd57ea76fd72a858c79ccf8ada46515146eacb589947425"
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
