class Clov < Formula
  desc "Clov Token Omitter - High-performance CLI proxy to minimize LLM token consumption"
  homepage "https://github.com/alexandephilia/clov-ai"
  version "0.31.0"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/alexandephilia/clov-ai/releases/download/v0.31.0/clov-aarch64-apple-darwin.tar.gz"
    sha256 "b0f5df16b452adb9b665c11d3602a223bd562de032fa7cbc6536f033b783f260"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/alexandephilia/clov-ai/releases/download/v0.31.0/clov-x86_64-apple-darwin.tar.gz"
    sha256 "83fa6cce97873438f1db24512ad7a620030caa0ac9a4c3295d3cdefceda9866e"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/alexandephilia/clov-ai/releases/download/v0.31.0/clov-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "21ab40f11d56e8256ff7706ea78ad33f596cda5ca1744ae2844df5cfb79462db"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/alexandephilia/clov-ai/releases/download/v0.31.0/clov-x86_64-unknown-linux-musl.tar.gz"
    sha256 "02a335c66fd4af72583b86c07228c5783bbe0043b43c8744e09cc7ec0723bc47"
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
