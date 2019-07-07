class Joker < Formula
  desc "Small Clojure interpreter and linter"
  homepage "https://github.com/candid82/joker"
  version "0.12.5"

  if OS.linux?
    url "https://github.com/candid82/joker/releases/download/v0.12.5/joker-0.12.5-linux-amd64.zip"
    sha256 "2a00881b87ae91eefcf7462c12a2de28436e5e66bbd51aad5e80d96bf9d1b5ad"
  else
    url "https://github.com/candid82/joker/releases/download/v0.12.5/joker-0.12.5-mac-amd64.zip"
    sha256 "3427af05c0107f4d503070c9ddadc375ef48b34f8fa04cf3f627425b5d8e192d"
  end

  bottle :unneeded

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
