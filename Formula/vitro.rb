# Rendered from packaging/homebrew/vitro.rb in lambdalisue/vitro by its release
# workflow, which fills in the version and the checksum of each archive the
# release attached. Edit it there: every release overwrites the tap's copy.
class Vitro < Formula
  desc "Disposable development VMs driven from a CLI"
  homepage "https://github.com/lambdalisue/vitro"
  version "0.6.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/lambdalisue/vitro/releases/download/v0.6.3/vitro-v0.6.3-aarch64-apple-darwin.tar.gz"
      sha256 "31b37a3c0e1c785f75b1223231434c727e4faf55a3c7dd3746ea7e30401f2a6a"
    end
    on_intel do
      url "https://github.com/lambdalisue/vitro/releases/download/v0.6.3/vitro-v0.6.3-x86_64-apple-darwin.tar.gz"
      sha256 "9e0c0932a62a3a311ff5502a3fc401722314e40eb81a6e4f953e2e80f7756509"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/lambdalisue/vitro/releases/download/v0.6.3/vitro-v0.6.3-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "08ea43612e4b8637fff5fc924f7ac3e7d796d6a2c53086fca40d3adccd1d0719"
    end
    on_intel do
      url "https://github.com/lambdalisue/vitro/releases/download/v0.6.3/vitro-v0.6.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "dd435147d68563db70e702671ec3e3747d0c6d04a7db9f93556ef5ffd9c88a1f"
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
