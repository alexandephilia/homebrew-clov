# typed: false
# frozen_string_literal: true

# Homebrew formula for clov - Clov Token Omitter
# To install: brew tap alexandephilia/clov && brew install clov
class Clov < Formula
  desc "High-performance CLI proxy to minimize LLM token consumption"
  homepage "https://github.com/alexandephilia/clov-ai"
  version "0.26.3"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/alexandephilia/clov-ai/releases/download/v#{version}/clov-x86_64-apple-darwin.tar.gz"
      sha256 "09018e16757f923f451de32fb01017f41588e9576f3f3e8ec462db28dadc6ab5"
    end

    on_arm do
      url "https://github.com/alexandephilia/clov-ai/releases/download/v#{version}/clov-aarch64-apple-darwin.tar.gz"
      sha256 "c405fb6a9768d940517c4c92bb4a1bbdc77f74956fd7f06145ca191e36e18937"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/alexandephilia/clov-ai/releases/download/v#{version}/clov-x86_64-unknown-linux-musl.tar.gz"
      sha256 "bc38ac5a29955da37a252188ce15979d578e608ccd1ab383500946a74a9f226a"
    end

    on_arm do
      url "https://github.com/alexandephilia/clov-ai/releases/download/v#{version}/clov-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "dbc210ad87a700881ad5b09cd6e0e341de6f279a1806586b10911ec7b23b17c0"
    end
  end

  def install
    bin.install "clov"
  end

  test do
    assert_match "clov #{version}", shell_output("#{bin}/clov --version")
  end
end
