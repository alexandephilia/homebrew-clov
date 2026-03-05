class Clov < Formula
  desc "High-performance CLI proxy to minimize LLM token consumption (Clov Token Omitter)"
  homepage "https://github.com/alexandephilia/clov-ai"
  version "0.25.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/alexandephilia/clov-ai/releases/download/v#{version}/clov-aarch64-apple-darwin.tar.gz"
      sha256 "ecb289919abee1e74abb502e2eaa34236fd68bb39c45db1773f498898bdeecc5"
    end
  end

  def install
    bin.install "clov"
  end

  test do
    assert_match "clov #{version}", shell_output("#{bin}/clov --version")
  end
end
