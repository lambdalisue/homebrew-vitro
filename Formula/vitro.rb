# Rendered from packaging/homebrew/vitro.rb in lambdalisue/vitro by its release
# workflow, which fills in the version and the checksum of each archive the
# release attached. Edit it there: every release overwrites the tap's copy.
class Vitro < Formula
  desc "Disposable development VMs driven from a CLI"
  homepage "https://github.com/lambdalisue/vitro"
  version "0.4.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/lambdalisue/vitro/releases/download/v0.4.0/vitro-v0.4.0-aarch64-apple-darwin.tar.gz"
      sha256 "6576f069ab911e604ec7be0f8c3894372df8624724bf7927a6c1cfc771ca9f85"
    end
    on_intel do
      url "https://github.com/lambdalisue/vitro/releases/download/v0.4.0/vitro-v0.4.0-x86_64-apple-darwin.tar.gz"
      sha256 "e8484481f8b68877886ca20401dcce8a9f22112245f29fc6d2f9a8fc21ab82b7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/lambdalisue/vitro/releases/download/v0.4.0/vitro-v0.4.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d4434fa1f4931bda1661d0c9c59c40484f6e7b2620fd4c0a3f3993be69a2ff20"
    end
    on_intel do
      url "https://github.com/lambdalisue/vitro/releases/download/v0.4.0/vitro-v0.4.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e68b55158a102d9a3da0125325433f240feb61620b2f1c221d93a5046e2ee5b0"
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
