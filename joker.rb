class Joker < Formula
  desc "Small Clojure interpreter and linter"
  homepage "https://github.com/candid82/joker"
  version "1.3.0"

  if OS.linux?
    url "https://github.com/candid82/joker/releases/download/v1.3.0/joker-linux-amd64.zip"
    sha256 "cdef9a9a04390b6b68a3fc94a726114597880a5f1f479891081801800c24c421"
  else
    url "https://github.com/candid82/joker/releases/download/v1.3.0/joker-mac-amd64.zip"
    sha256 "136f46f01624ec821630a459b0679ca55efa9b3008851fb54b8265c32f980245"
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
