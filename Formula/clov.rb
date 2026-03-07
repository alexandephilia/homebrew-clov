class Clov < Formula
  desc "Clov Token Omitter - High-performance CLI proxy to minimize LLM token consumption"
  homepage "https://github.com/alexandephilia/clov-ai"
  version "0.29.1"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/alexandephilia/clov-ai/releases/download/v0.29.1/clov-aarch64-apple-darwin.tar.gz"
    sha256 "499ae8271bdc6ae963b009a37841a7ee3a1c6b00bc8f9d9f1f175c1043e8755f"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/alexandephilia/clov-ai/releases/download/v0.29.1/clov-x86_64-apple-darwin.tar.gz"
    sha256 "621e4d7d0f1531e4cc78cb1b3b3cc0de27c78b373debc1a48a749c14bec25453"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/alexandephilia/clov-ai/releases/download/v0.29.1/clov-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "bfdc84383916b464d60fa3b3cca5b6ceea0dc1421a5f9f0459983dec2240d72c"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/alexandephilia/clov-ai/releases/download/v0.29.1/clov-x86_64-unknown-linux-musl.tar.gz"
    sha256 "3d3695ce932e435f51a41fe413d2a9c50c988e374f19987721fddb2379da281d"
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
