class Joker < Formula
  desc "Small Clojure interpreter and linter"
  homepage "https://github.com/candid82/joker"
  version "0.9.6"

  if OS.linux?
    url "https://github.com/candid82/joker/releases/download/v0.9.6/joker-0.9.6-linux-amd64.zip"
    sha256 "345752413e2eafcabc3646a298b239c276596d484d6d83ca63f2ab4697df5f06"
  else
    url "https://github.com/candid82/joker/releases/download/v0.9.6/joker-0.9.6-mac-amd64.zip"
    sha256 "8f1bbc3d897457463b54184463f4ab7a0df5f208163d98e2d9aa5741f378d36e"
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
