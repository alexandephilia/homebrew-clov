# typed: false
# frozen_string_literal: true

# Homebrew formula for clov - Clov Token Omitter
# To install: brew tap alexandephilia/clov && brew install clov
class Clov < Formula
  desc "High-performance CLI proxy to minimize LLM token consumption"
  homepage "https://github.com/alexandephilia/clov-ai"
  version "0.26.1"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/alexandephilia/clov-ai/releases/download/v#{version}/clov-x86_64-apple-darwin.tar.gz"
      sha256 "df7bd483e8b21a3dda54b6fc7754dc08d001d896cd9ac9172ec380702b45d1ca"
    end

    on_arm do
      url "https://github.com/alexandephilia/clov-ai/releases/download/v#{version}/clov-aarch64-apple-darwin.tar.gz"
      sha256 "52242918a32baf2ac704071899931d633a7aa1a98f9a9fa411e868e4221dfc67"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/alexandephilia/clov-ai/releases/download/v#{version}/clov-x86_64-unknown-linux-musl.tar.gz"
      sha256 "09b63f76cd733973c28cc1f21700232fdbc567e75f80fac668acef28e8edc4ab"
    end

    on_arm do
      url "https://github.com/alexandephilia/clov-ai/releases/download/v#{version}/clov-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6cb3ebc6b2590c86cf1cca8bcde9cfcf67fb953a6728676ebc4c2c14f805284f"
    end
  end

  def install
    bin.install "clov"
  end

  test do
    assert_match "clov #{version}", shell_output("#{bin}/clov --version")
  end
end
