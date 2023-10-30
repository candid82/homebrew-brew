class Joker < Formula
  desc "Small Clojure interpreter and linter"
  homepage "https://github.com/candid82/joker"
  version "1.3.1"

  if OS.linux?
    url "https://github.com/candid82/joker/releases/download/v1.3.1/joker-linux-amd64.zip"
    sha256 "ea9c43f7b78403c9780cd4e1497883cb6be651db14a2258e541a40e05653e29e"
  else
    url "https://github.com/candid82/joker/releases/download/v1.3.1/joker-mac-amd64.zip"
    sha256 "8d090532335be26eb0ec7b9c9f1f7e97becac13139a3ddd70434271e129e463b"
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
