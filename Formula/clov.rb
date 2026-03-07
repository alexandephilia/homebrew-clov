class Clov < Formula
  desc "Clov Token Omitter - High-performance CLI proxy to minimize LLM token consumption"
  homepage "https://github.com/alexandephilia/clov-ai"
  version "0.27.0"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/alexandephilia/clov-ai/releases/download/v0.27.0/clov-aarch64-apple-darwin.tar.gz"
    sha256 "b65500eb7ffe522016fbfc720cdd7dfcaac3a250fd4ec449afcbad7318d14ff2"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/alexandephilia/clov-ai/releases/download/v0.27.0/clov-x86_64-apple-darwin.tar.gz"
    sha256 "d274009c3e46e844bccdb1ef024b3410f6ca485501ac966eda2b08dbf9f00601"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/alexandephilia/clov-ai/releases/download/v0.27.0/clov-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "c627c3a90d1f4828b765eeba05f44421081ee6d9816c0b3fa90bdeee0efdb550"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/alexandephilia/clov-ai/releases/download/v0.27.0/clov-x86_64-unknown-linux-musl.tar.gz"
    sha256 "11748ec67e85dbdb959e35e49e23c39edb40abe9c6810a035be78658be0d8e5b"
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
