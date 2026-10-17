# Rendered from packaging/homebrew/vitro.rb in lambdalisue/vitro by its release
# workflow, which fills in the version and the checksum of each archive the
# release attached. Edit it there: every release overwrites the tap's copy.
class Vitro < Formula
  desc "Disposable development VMs driven from a CLI"
  homepage "https://github.com/lambdalisue/vitro"
  version "0.5.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/lambdalisue/vitro/releases/download/v0.5.1/vitro-v0.5.1-aarch64-apple-darwin.tar.gz"
      sha256 "30e235e46d48d9034e460c6f8e2faff3894ca73489accc71bf619b34f528d9d5"
    end
    on_intel do
      url "https://github.com/lambdalisue/vitro/releases/download/v0.5.1/vitro-v0.5.1-x86_64-apple-darwin.tar.gz"
      sha256 "41348a813aacf761fab322bd0cafb98bc6ceb6da4e12892c6456fc378c82486c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/lambdalisue/vitro/releases/download/v0.5.1/vitro-v0.5.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c07b6218b9140aaad7d0dc0230a160eabb188375d7613846083c5a1f3a04637e"
    end
    on_intel do
      url "https://github.com/lambdalisue/vitro/releases/download/v0.5.1/vitro-v0.5.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "723a3e70bfac8fc7e6983308563427ea68065770798a73a1fdc054f9418e0d5d"
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
