class Clov < Formula
  desc "Clov Token Omitter - High-performance CLI proxy to minimize LLM token consumption"
  homepage "https://github.com/alexandephilia/clov-ai"
  version "0.29.5"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/alexandephilia/clov-ai/releases/download/v0.29.5/clov-aarch64-apple-darwin.tar.gz"
    sha256 "1d1bc603ae205a2717ced3b7447d2fc7db78afaf188e378975277f65a71332b4"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/alexandephilia/clov-ai/releases/download/v0.29.5/clov-x86_64-apple-darwin.tar.gz"
    sha256 "c430d6a92e9b1010c3b948406762a8a2ba902745a5bad52b9c399a27c9b00aba"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/alexandephilia/clov-ai/releases/download/v0.29.5/clov-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "50bd213f0c4be3da9189e52c52923e1f40665c793ecbde85e539c567890b7acf"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/alexandephilia/clov-ai/releases/download/v0.29.5/clov-x86_64-unknown-linux-musl.tar.gz"
    sha256 "2160309eec024319ab53a06cd50ead0cb1e92b7fb131732be89fd316e332a514"
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
