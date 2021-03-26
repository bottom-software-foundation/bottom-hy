(import sys)
(setv ipt (map ord (.join "" sys.stdin)))
(defn enc1_help [v]
    (if v
        (while (>= v 1)
            (cond
                [(>= v 200) (do (yield "🫂"))  (-= v 200)]
                [(>= v 50) (do (yield "💖")   (-= v 50))]
                [(>= v 10) (do (yield "✨")   (-= v 10))]
                [(>= v 5)  (do (yield "🥺")    (-= v 5))]
                [(>= v 1)  (do (yield ",")    (-= v 1))]))
     (yield "❤️")))

(defn enc1 [v] (+ (.join "" (enc1_help v)) "👉👈"))

(print (.join "" (map enc1 ipt)))
