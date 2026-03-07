class Clov < Formula
  desc "Clov Token Omitter - High-performance CLI proxy to minimize LLM token consumption"
  homepage "https://github.com/alexandephilia/clov-ai"
  version "0.29.2"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/alexandephilia/clov-ai/releases/download/v0.29.2/clov-aarch64-apple-darwin.tar.gz"
    sha256 "e0bb3f793a027a4e6afe5a15df08f219fca53bf7f57eb8b4501327f762be4f33"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/alexandephilia/clov-ai/releases/download/v0.29.2/clov-x86_64-apple-darwin.tar.gz"
    sha256 "80311b603fe9916972d1646b912a00bea319323bf1022fa6dfe1444fb0809e3e"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/alexandephilia/clov-ai/releases/download/v0.29.2/clov-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "26387b67063b03e7c8ac147d190c9fbb8abed4edb0032e98e2dd5a6559067324"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/alexandephilia/clov-ai/releases/download/v0.29.2/clov-x86_64-unknown-linux-musl.tar.gz"
    sha256 "8626a822b51b4bad1e2b2e949600bc1ea3d2f1b8a03198da063bf6ff59f477c9"
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
