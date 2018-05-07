class Joker < Formula
  desc "Small Clojure interpreter and linter"
  homepage "https://github.com/candid82/joker"
  version "0.9.2"

  if OS.linux?
    url "https://github.com/candid82/joker/releases/download/v0.9.2/joker-0.9.2-linux-amd64.zip"
    sha256 "ce8f6f6ec1cbee6317d664a41d50d171540e9d5ee4d6a674bdaae7019a24a057"
  else
    url "https://github.com/candid82/joker/releases/download/v0.9.2/joker-0.9.2-mac-amd64.zip"
    sha256 "fac8479fe7b7b067c4435d758d766424a174666351f01c9f79dbe8a0e4f678af"
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
