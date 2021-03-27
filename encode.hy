(import sys)
(setv ipt (.encode (.join "" sys.stdin)))
(defn enc1_part [v]
    (if v
        (while (>= v 1)
            (cond
                [(>= v 200) (do (yield "🫂"))  (-= v 200)]
                [(>= v 50)  (do (yield "💖")   (-= v 50))]
                [(>= v 10)  (do (yield "✨")   (-= v 10))]
                [(>= v 5)   (do (yield "🥺")    (-= v 5))]
                [(>= v 1)   (do (yield ",")    (-= v 1))]))
     (yield "❤️")))

(.write sys.stdout (.join "" (map (fn [v] (+ (.join "" (enc1_part v)) "👉👈")) ipt)))
