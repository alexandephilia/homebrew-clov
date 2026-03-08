class Clov < Formula
  desc "Clov Token Omitter - High-performance CLI proxy to minimize LLM token consumption"
  homepage "https://github.com/alexandephilia/clov-ai"
  version "0.34.3"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/alexandephilia/clov-ai/releases/download/v0.34.3/clov-aarch64-apple-darwin.tar.gz"
    sha256 "8a1abdda3b5706afd53001ce7af0eec3a9cbec98f4fadd1079e1a58554efee45"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/alexandephilia/clov-ai/releases/download/v0.34.3/clov-x86_64-apple-darwin.tar.gz"
    sha256 "6f4bcf12f91ef16228228b6ae6c0275afdfadf742787f305590e6ead3ced66ce"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/alexandephilia/clov-ai/releases/download/v0.34.3/clov-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "a08b992f3773af4b27d7638a9976cdc03840f9b40dd5cd777a75baaac2355f7e"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/alexandephilia/clov-ai/releases/download/v0.34.3/clov-x86_64-unknown-linux-musl.tar.gz"
    sha256 "21aecc58aded2a082dba0a5c3959b945c3c0382c5c7f9d1ddb4e5ef310878530"
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
