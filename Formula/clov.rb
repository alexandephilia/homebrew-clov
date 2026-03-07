class Clov < Formula
  desc "Clov Token Omitter - High-performance CLI proxy to minimize LLM token consumption"
  homepage "https://github.com/alexandephilia/clov-ai"
  version "0.29.3"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/alexandephilia/clov-ai/releases/download/v0.29.3/clov-aarch64-apple-darwin.tar.gz"
    sha256 "7649e3e00aff014d1ec8f931a4cd6dff70ec492cf680fcec063d1a53cbe234cf"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/alexandephilia/clov-ai/releases/download/v0.29.3/clov-x86_64-apple-darwin.tar.gz"
    sha256 "88623e3856097426a860b4d385f67b44bc4bf5691508e9ceab171b9af9a01d22"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/alexandephilia/clov-ai/releases/download/v0.29.3/clov-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "e201f13089c31728522349c32eb1b5923b8583224a825df733564a4817f400cd"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/alexandephilia/clov-ai/releases/download/v0.29.3/clov-x86_64-unknown-linux-musl.tar.gz"
    sha256 "c8561733a4c20b1cb36f1f09a71a106a364ae53dcf771e33986bdbdae9d4488a"
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
