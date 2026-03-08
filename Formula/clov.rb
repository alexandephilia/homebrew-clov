class Clov < Formula
  desc "Clov Token Omitter - High-performance CLI proxy to minimize LLM token consumption"
  homepage "https://github.com/alexandephilia/clov-ai"
  version "0.32.0"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/alexandephilia/clov-ai/releases/download/v0.32.0/clov-aarch64-apple-darwin.tar.gz"
    sha256 "695633591fad711c1759e776c1f530fb89818700140af38d6d4a9d74c3a5aa1d"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/alexandephilia/clov-ai/releases/download/v0.32.0/clov-x86_64-apple-darwin.tar.gz"
    sha256 "d2d444c2c26869873d3787ef5643b522db037db9e70777fca125967403da7175"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/alexandephilia/clov-ai/releases/download/v0.32.0/clov-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "1f7bd6081fdbeadb1e469c269042d62b1c37a3ce0bdad3b56a9d611a068ad002"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/alexandephilia/clov-ai/releases/download/v0.32.0/clov-x86_64-unknown-linux-musl.tar.gz"
    sha256 "3497c8c9adf0e18d7457aedeb414765a4eaff2b8ab49aa08a56dc280c94c8d12"
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
