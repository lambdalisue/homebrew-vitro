# Rendered from packaging/homebrew/vitro.rb in lambdalisue/vitro by its release
# workflow, which fills in the version and the checksum of each archive the
# release attached. Edit it there: every release overwrites the tap's copy.
class Vitro < Formula
  desc "Disposable development VMs driven from a CLI"
  homepage "https://github.com/lambdalisue/vitro"
  version "0.5.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/lambdalisue/vitro/releases/download/v0.5.2/vitro-v0.5.2-aarch64-apple-darwin.tar.gz"
      sha256 "7e743f37978e55c50b1c06d2621f71fe1a7d6ba375a18e0f2d0faf7a91ac0ce2"
    end
    on_intel do
      url "https://github.com/lambdalisue/vitro/releases/download/v0.5.2/vitro-v0.5.2-x86_64-apple-darwin.tar.gz"
      sha256 "45432d00b154372802c97e6d9437867f49ed21ea92b63d31149cdf423df28e97"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/lambdalisue/vitro/releases/download/v0.5.2/vitro-v0.5.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "89bbbebc0206df7e0502452f7f6fae7c49d4c777408fed446c1c29476f01c941"
    end
    on_intel do
      url "https://github.com/lambdalisue/vitro/releases/download/v0.5.2/vitro-v0.5.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c34bf131b045dd9171088546c73922345076a52b285e449416f208dc57569ba0"
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
