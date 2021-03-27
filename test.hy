(import [functools [partial]])
(import os)
(import shlex)


;; it's jank but it'll do until I move stuff to functions
(defn test [file input expected-output]
    (do
        (with [fout (open "tmpinp.txt" "w+")] (.write fout input))
        (os.system (.join "" ["cat tmpinp.txt | hy " (shlex.quote file) " > tmp.txt"]))
        (with [fin (open "tmp.txt")]
            (= expected-output (.read fin)))))

(setv test-encode (partial test "encode.hy"))
(setv test-decode (partial test "decode.hy"))

(assert (test-encode "Test" "💖✨✨✨,,,,👉👈💖💖,👉👈💖💖✨🥺👉👈💖💖✨🥺,👉👈"))
(assert (test-encode "h" "💖💖,,,,👉👈"))
(assert (test-decode "💖💖,,,," "h"))
(assert (test-decode "💖✨✨✨,,,,\u200B💖💖,\u200B💖💖✨🥺\u200B💖💖✨🥺,\u200B" "Test"))
(assert (test-decode "💖✨✨✨,,,,👉👈💖💖,👉👈💖💖✨🥺👉👈💖💖✨🥺,👉👈" "Test"))
(assert (test-encode "🥺" "🫂✨✨✨✨👉👈💖💖💖🥺,,,,👉👈💖💖💖✨🥺👉👈💖💖💖✨✨✨🥺,👉👈"))
(assert (test-encode "がんばれ" "🫂✨✨🥺,,👉👈💖💖✨✨🥺,,,,👉👈💖💖✨✨✨✨👉👈🫂✨✨🥺,,👉👈💖💖✨✨✨👉👈💖💖✨✨✨✨🥺,,👉👈🫂✨✨🥺,,👉👈💖💖✨✨🥺,,,,👉👈💖💖💖✨✨🥺,👉👈🫂✨✨🥺,,👉👈💖💖✨✨✨👉👈💖💖✨✨✨✨👉👈"))
(assert (test-decode "🫂✨✨✨✨👉👈💖💖💖🥺,,,,👉👈💖💖💖✨🥺👉👈💖💖💖✨✨✨🥺,👉👈" "🥺"))
(assert (test-decode "🫂✨✨🥺,,👉👈💖💖✨✨🥺,,,,👉👈💖💖✨✨✨✨👉👈🫂✨✨🥺,,👉👈💖💖✨✨✨👉👈💖💖✨✨✨✨🥺,,👉👈🫂✨✨🥺,,👉👈💖💖✨✨🥺,,,,👉👈💖💖💖✨✨🥺,👉👈🫂✨✨🥺,,👉👈💖💖✨✨✨👉👈💖💖✨✨✨✨👉👈" "がんばれ"))
(assert (test-encode "\0" "❤️👉👈"))
(assert (test-decode "❤️👉👈" "\0"))
