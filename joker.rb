class Joker < Formula
  desc "Small Clojure interpreter and linter"
  homepage "https://github.com/candid82/joker"
  version "1.7.0"

  if OS.linux?
    url "https://github.com/candid82/joker/releases/download/v1.7.0/joker-linux-amd64.zip"
    sha256 "21cf695c3adb58322244ae42afb95447b376bdf03176bdac58255fb3c585c46f" # linux-amd64
  elsif Hardware::CPU.arm?
    url "https://github.com/candid82/joker/releases/download/v1.7.0/joker-mac-arm64.zip"
    sha256 "9365d4232204c0b4698b7a3f274bb430a2e25f200d4bec69c9f0648b306a8ca5" # mac-arm64
  else
    url "https://github.com/candid82/joker/releases/download/v1.7.0/joker-mac-amd64.zip"
    sha256 "bbcc765885204e7c5079b564a26f09ab7abb4ec69816b9d8c7671135131fd3a1" # mac-amd64
  end

  def install
    bin.install "joker"
  end

  test do
    testfile = testpath/"test.clj"
    testfile.write "(let [x 1] (println 42))"

    assert_match "Parse warning: unused binding: x",
      shell_output("#{bin}/joker --lint --dialect clj #{testfile} 2>&1")
  end
end
