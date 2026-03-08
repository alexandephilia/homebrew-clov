class Clov < Formula
  desc "Clov Token Omitter - High-performance CLI proxy to minimize LLM token consumption"
  homepage "https://github.com/alexandephilia/clov-ai"
  version "0.35.0"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/alexandephilia/clov-ai/releases/download/v0.35.0/clov-aarch64-apple-darwin.tar.gz"
    sha256 "45e120644be7ced4b4f938085139dc1f444b61a37beae1510b1f59f6eaefeb83"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/alexandephilia/clov-ai/releases/download/v0.35.0/clov-x86_64-apple-darwin.tar.gz"
    sha256 "dc69084707820c131f086a0be572b6f4200bd31d71967a8c1aba66e759ad43b1"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/alexandephilia/clov-ai/releases/download/v0.35.0/clov-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "582e0b9cde4bbd58d30cf2025a1e579ca427c55c179d16d357a5e60b59963f9d"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/alexandephilia/clov-ai/releases/download/v0.35.0/clov-x86_64-unknown-linux-musl.tar.gz"
    sha256 "73c84172d87785000fbb1ce1859ae7b392df1211ab7f13e983ab43143fd2880b"
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
