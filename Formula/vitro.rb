# Rendered from packaging/homebrew/vitro.rb in lambdalisue/vitro by its release
# workflow, which fills in the version and the checksum of each archive the
# release attached. Edit it there: every release overwrites the tap's copy.
class Vitro < Formula
  desc "Disposable development VMs driven from a CLI"
  homepage "https://github.com/lambdalisue/vitro"
  version "0.6.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/lambdalisue/vitro/releases/download/v0.6.2/vitro-v0.6.2-aarch64-apple-darwin.tar.gz"
      sha256 "de131180c62c0476e546fbc6ff439ba437e6fa5ec89c992ed246eddf72be78e8"
    end
    on_intel do
      url "https://github.com/lambdalisue/vitro/releases/download/v0.6.2/vitro-v0.6.2-x86_64-apple-darwin.tar.gz"
      sha256 "5581b4f1e1eb7aef75d7ff47177c91b042f8cc332ac66ce63bb3b85a548048fe"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/lambdalisue/vitro/releases/download/v0.6.2/vitro-v0.6.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "225485fa89f699c51baf49a35330cf6f7d0685736843248133ef8a5dc69f6d5f"
    end
    on_intel do
      url "https://github.com/lambdalisue/vitro/releases/download/v0.6.2/vitro-v0.6.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "48a24864fac43f83da47dfc756c12beb969eaca87a7d0b7900f42bf1fee09bb8"
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
