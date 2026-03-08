class Clov < Formula
  desc "Clov Token Omitter - High-performance CLI proxy to minimize LLM token consumption"
  homepage "https://github.com/alexandephilia/clov-ai"
  version "0.34.2"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/alexandephilia/clov-ai/releases/download/v0.34.2/clov-aarch64-apple-darwin.tar.gz"
    sha256 "d4fa302f592c3339e6e5dfe9799623280d93993c13251d527f228f300c1787f7"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/alexandephilia/clov-ai/releases/download/v0.34.2/clov-x86_64-apple-darwin.tar.gz"
    sha256 "1fad5cd0a8aaec35b5552460f22439396b2156e085a75e9f9e19f5176614c497"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/alexandephilia/clov-ai/releases/download/v0.34.2/clov-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "d7def04758aeacf7cca42647a286836e4336c35b857ab051e24e9aff869a4615"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/alexandephilia/clov-ai/releases/download/v0.34.2/clov-x86_64-unknown-linux-musl.tar.gz"
    sha256 "923963917d69847947f4f23cad76d6606a0b10bdd48602d4913dd15b6d43e712"
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
