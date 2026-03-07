# typed: false
# frozen_string_literal: true

# Homebrew formula for clov - Clov Token Omitter
# To install: brew tap alexandephilia/clov && brew install clov
class Clov < Formula
  desc "High-performance CLI proxy to minimize LLM token consumption"
  homepage "https://github.com/alexandephilia/clov-ai"
  version "0.26.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/alexandephilia/clov-ai/releases/download/v#{version}/clov-x86_64-apple-darwin.tar.gz"
      sha256 "PLACEHOLDER_SHA256_INTEL"
    end

    on_arm do
      url "https://github.com/alexandephilia/clov-ai/releases/download/v#{version}/clov-aarch64-apple-darwin.tar.gz"
      sha256 "2d85cb0912fdf109a37355054b6e79cb1aef2d8955dbcbf7013c96633cc8c997"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/alexandephilia/clov-ai/releases/download/v#{version}/clov-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "PLACEHOLDER_SHA256_LINUX_INTEL"
    end

    on_arm do
      url "https://github.com/alexandephilia/clov-ai/releases/download/v#{version}/clov-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "PLACEHOLDER_SHA256_LINUX_ARM"
    end
  end

  def install
    bin.install "clov"
  end

  test do
    assert_match "clov #{version}", shell_output("#{bin}/clov --version")
  end
end
