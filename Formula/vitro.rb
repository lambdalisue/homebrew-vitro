# Rendered from packaging/homebrew/vitro.rb in lambdalisue/vitro by its release
# workflow, which fills in the version and the checksum of each archive the
# release attached. Edit it there: every release overwrites the tap's copy.
class Vitro < Formula
  desc "Disposable development VMs driven from a CLI"
  homepage "https://github.com/lambdalisue/vitro"
  version "0.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/lambdalisue/vitro/releases/download/v0.3.0/vitro-v0.3.0-aarch64-apple-darwin.tar.gz"
      sha256 "f2a004b4c5a198b1d93e19b758d792f50fec216a4cffa3ba556452084cd12463"
    end
    on_intel do
      url "https://github.com/lambdalisue/vitro/releases/download/v0.3.0/vitro-v0.3.0-x86_64-apple-darwin.tar.gz"
      sha256 "e8121959cf50efd8b190f670125313aca19d9ab3163e27bcca85ca8732ddf020"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/lambdalisue/vitro/releases/download/v0.3.0/vitro-v0.3.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "588637e39679741866784376fb406161f07c98529020292f316250838646dd9f"
    end
    on_intel do
      url "https://github.com/lambdalisue/vitro/releases/download/v0.3.0/vitro-v0.3.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4c562eae509431645aa8f41428e7c1a00a0ae566b27c324f6aa745d80860f827"
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
