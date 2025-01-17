class NarrowlinkTokenGenerator < Formula
  desc "Self-hosted solution for secure device connectivity across restricted networks"
  homepage "https://github.com/narrowlink/narrowlink"
  url "https://github.com/narrowlink/narrowlink/archive/refs/tags/0.2.6.tar.gz"
  sha256 "6682e742431fa3496cbfd550039c6fe46c87fbce6a74d0d2c227cae38e8e2dd3"
  license "MPL-2.0"

  # livecheck do
  #   url :stable
  #   regex(/^v?(\d+(?:\.\d+)+)$/i)
  # end

  # bottle do
  #   root_url "https://narrowlink.com/"
  #   sha256 cellar: :any_skip_relocation, arm64_sonoma:   ""
  #   sha256 cellar: :any_skip_relocation, arm64_ventura:  ""
  #   sha256 cellar: :any_skip_relocation, arm64_monterey: ""
  #   sha256 cellar: :any_skip_relocation, sonoma:         ""
  #   sha256 cellar: :any_skip_relocation, ventura:        ""
  #   sha256 cellar: :any_skip_relocation, monterey:       ""
  #   sha256 cellar: :any_skip_relocation, x86_64_linux:   ""
  # end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "token-generator")
  end

  test do
    assert_match "Narrowlink Token Generator", shell_output("#{bin}/narrowlink-token-generator --version")
  end
end
