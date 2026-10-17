# Rendered from packaging/homebrew/vitro.rb in lambdalisue/vitro by its release
# workflow, which fills in the version and the checksum of each archive the
# release attached. Edit it there: every release overwrites the tap's copy.
class Vitro < Formula
  desc "Disposable development VMs driven from a CLI"
  homepage "https://github.com/lambdalisue/vitro"
  version "0.5.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/lambdalisue/vitro/releases/download/v0.5.0/vitro-v0.5.0-aarch64-apple-darwin.tar.gz"
      sha256 "e39f2e94dd041568b97921687db7c46e397dbae975037ddacf89c30e70a0394d"
    end
    on_intel do
      url "https://github.com/lambdalisue/vitro/releases/download/v0.5.0/vitro-v0.5.0-x86_64-apple-darwin.tar.gz"
      sha256 "f8de37e780802f0597eb4474dd19e90c62b739daa1f6c1dfd86569809e4d00d7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/lambdalisue/vitro/releases/download/v0.5.0/vitro-v0.5.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1eb6d099aa5444e274cfeb3e629cc23303ee5e8428c11fedfa80e788a9a4ec53"
    end
    on_intel do
      url "https://github.com/lambdalisue/vitro/releases/download/v0.5.0/vitro-v0.5.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4eb05df47fd9359ec65dbe49958b908ccaa64b0a08238cce95940b579765e8dc"
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
