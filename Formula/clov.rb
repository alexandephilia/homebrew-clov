class Clov < Formula
  desc "Clov Token Omitter - High-performance CLI proxy to minimize LLM token consumption"
  homepage "https://github.com/alexandephilia/clov-ai"
  version "0.34.3"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/alexandephilia/clov-ai/releases/download/v0.34.3/clov-aarch64-apple-darwin.tar.gz"
    sha256 "2fc4645677e4c6690c2a8534a4de695fb1e057015ba2d9b2c8818bd24a7fe924"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/alexandephilia/clov-ai/releases/download/v0.34.3/clov-x86_64-apple-darwin.tar.gz"
    sha256 "39d174e939933f5deca5e511a7fd0a018f648de4ec77b1bed4da4d1159a5ef3d"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/alexandephilia/clov-ai/releases/download/v0.34.3/clov-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "0941562e79b92c326d2675bf616e6f37b26f13f80ad009a418d772fee0b714c2"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/alexandephilia/clov-ai/releases/download/v0.34.3/clov-x86_64-unknown-linux-musl.tar.gz"
    sha256 "b7f2a232e386b903602287e739fa108c3f838bcba5727eb69de6040b37833d6c"
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
