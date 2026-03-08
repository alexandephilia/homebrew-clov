class Clov < Formula
  desc "Clov Token Omitter - High-performance CLI proxy to minimize LLM token consumption"
  homepage "https://github.com/alexandephilia/clov-ai"
  version "0.34.4"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/alexandephilia/clov-ai/releases/download/v0.34.4/clov-aarch64-apple-darwin.tar.gz"
    sha256 "bb699fcc94be4ac5382ee490066810d74922c274c15c796ece92349adad76161"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/alexandephilia/clov-ai/releases/download/v0.34.4/clov-x86_64-apple-darwin.tar.gz"
    sha256 "dcd39bbce636b84cdb86a667c8e6a5a68075717f51d3c48672e8bde42b10756c"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/alexandephilia/clov-ai/releases/download/v0.34.4/clov-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "88bd85342535ced10cbb26a56f45bdfec95ed577a972821ad8ac0c869b14403e"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/alexandephilia/clov-ai/releases/download/v0.34.4/clov-x86_64-unknown-linux-musl.tar.gz"
    sha256 "1189594edbef468f2df15d9b64ac84e72ea84d1ad391e4d3735551b6a1eb0528"
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
