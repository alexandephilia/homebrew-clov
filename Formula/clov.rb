class Clov < Formula
  desc "Clov Token Omitter - High-performance CLI proxy to minimize LLM token consumption"
  homepage "https://github.com/alexandephilia/clov-ai"
  version "0.30.0"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/alexandephilia/clov-ai/releases/download/v0.30.0/clov-aarch64-apple-darwin.tar.gz"
    sha256 "5fac769f87a00a4109e6d58868fd1fa0424f934ab59e0a9bc609daf7fcfc70ea"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/alexandephilia/clov-ai/releases/download/v0.30.0/clov-x86_64-apple-darwin.tar.gz"
    sha256 "04f63f20f7b4dcc79c4758b2739f4c3d03cc8ceb825d24f8ce09c4ee0bbaf852"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/alexandephilia/clov-ai/releases/download/v0.30.0/clov-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "7a4427e09b0004ab5082fd6d1ef93da2cfb28875a0e94e5434197bc602263b36"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/alexandephilia/clov-ai/releases/download/v0.30.0/clov-x86_64-unknown-linux-musl.tar.gz"
    sha256 "6a430801e6a7258571f2ce81898939813374f4bebe3ea9f6b66bccca6406ef0f"
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
