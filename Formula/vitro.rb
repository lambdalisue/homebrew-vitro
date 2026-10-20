# Rendered from packaging/homebrew/vitro.rb in lambdalisue/vitro by its release
# workflow, which fills in the version and the checksum of each archive the
# release attached. Edit it there: every release overwrites the tap's copy.
class Vitro < Formula
  desc "Disposable development VMs driven from a CLI"
  homepage "https://github.com/lambdalisue/vitro"
  version "0.6.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/lambdalisue/vitro/releases/download/v0.6.1/vitro-v0.6.1-aarch64-apple-darwin.tar.gz"
      sha256 "d9076efcd735af20dc999fea109cb20637decf39f4b0537a7a1bd5b116b8305c"
    end
    on_intel do
      url "https://github.com/lambdalisue/vitro/releases/download/v0.6.1/vitro-v0.6.1-x86_64-apple-darwin.tar.gz"
      sha256 "70fb88a21cce63f726063dbed1acf478e3ba8b120c96266dce3018fecd056e16"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/lambdalisue/vitro/releases/download/v0.6.1/vitro-v0.6.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "306345148fc9206f9587313d539bb3159fa1dd1d5c8c57bbc6176e87032ec5bc"
    end
    on_intel do
      url "https://github.com/lambdalisue/vitro/releases/download/v0.6.1/vitro-v0.6.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "fc6172ea6ac425feb112bce8ed817a3feff36950afa2468be36b4cb17ab81ee4"
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
