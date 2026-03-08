class Clov < Formula
  desc "Clov Token Omitter - High-performance CLI proxy to minimize LLM token consumption"
  homepage "https://github.com/alexandephilia/clov-ai"
  version "0.34.0"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/alexandephilia/clov-ai/releases/download/v0.34.0/clov-aarch64-apple-darwin.tar.gz"
    sha256 "3ecf14fa869dfb8ab961e8d9b68fab8c91f79a8cb8d9499f7ca190f1968f007f"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/alexandephilia/clov-ai/releases/download/v0.34.0/clov-x86_64-apple-darwin.tar.gz"
    sha256 "8c9a845a341a4951cb347c043b11c60d128649fe9fde80d825015a95df98534c"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/alexandephilia/clov-ai/releases/download/v0.34.0/clov-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "84387bae0f314e3f40796f7fa3acc8df92b7686d4c3274af7c7eaad60414c6a7"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/alexandephilia/clov-ai/releases/download/v0.34.0/clov-x86_64-unknown-linux-musl.tar.gz"
    sha256 "6823af6bb541c329b171246fd71e562c533aa7d3354e6f18b16ab93952c6cdbe"
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
