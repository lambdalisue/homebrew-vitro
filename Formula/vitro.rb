# Rendered from packaging/homebrew/vitro.rb in lambdalisue/vitro by its release
# workflow, which fills in the version and the checksum of each archive the
# release attached. Edit it there: every release overwrites the tap's copy.
class Vitro < Formula
  desc "Disposable development VMs driven from a CLI"
  homepage "https://github.com/lambdalisue/vitro"
  version "0.6.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/lambdalisue/vitro/releases/download/v0.6.0/vitro-v0.6.0-aarch64-apple-darwin.tar.gz"
      sha256 "4a20fc6948c33fb78a9c812f077f5202793897bacba8601224027a1e4baea442"
    end
    on_intel do
      url "https://github.com/lambdalisue/vitro/releases/download/v0.6.0/vitro-v0.6.0-x86_64-apple-darwin.tar.gz"
      sha256 "2aad1557a0c9bfb62f2a6bc22e8476204217b1b8fe161be091ea2730a79b08f8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/lambdalisue/vitro/releases/download/v0.6.0/vitro-v0.6.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5b2381d1907bc571e33a9d580c87cd0420fb7abc3f447a86c2d72ae9272afedf"
    end
    on_intel do
      url "https://github.com/lambdalisue/vitro/releases/download/v0.6.0/vitro-v0.6.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "89d48ef782abb5c659a6bfb8112945acda5e21707b23433fb4099d868f117b96"
    end
  end

  # Every QEMU guest needs it, and it brings the UEFI firmware an aarch64
  # guest boots from.
  depends_on "qemu"

  def install
    bin.install "vitro"
    generate_completions_from_executable(bin/"vitro", "completions")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/vitro --version")
  end
end
