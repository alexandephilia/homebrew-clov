class Clov < Formula
  desc "Clov Token Omitter - High-performance CLI proxy to minimize LLM token consumption"
  homepage "https://github.com/alexandephilia/clov-ai"
  version "0.29.3"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/alexandephilia/clov-ai/releases/download/v0.29.3/clov-aarch64-apple-darwin.tar.gz"
    sha256 "3e6ac19196bd07089d63c66e543f9c7a14b58600d3cf4b53e1162afff1b2e538"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/alexandephilia/clov-ai/releases/download/v0.29.3/clov-x86_64-apple-darwin.tar.gz"
    sha256 "f34e3c1ffa41b0ba42fdb694cc17b38479ff134dead21ab6d198661b9ddb8296"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/alexandephilia/clov-ai/releases/download/v0.29.3/clov-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "9db7d54697124e950b1a64c8dce173af61d2d63ce2b0d03005d92b235f2bece7"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/alexandephilia/clov-ai/releases/download/v0.29.3/clov-x86_64-unknown-linux-musl.tar.gz"
    sha256 "1daf94cfec130d2be03ef361aacef7065bd36b242ed762ae2e92dc228c686649"
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
