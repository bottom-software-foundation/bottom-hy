(import sys)
(import [re [split]])

(setv VALUES {
    "🫂" 200
    "💖" 50
    "✨" 10
    "🥺" 5
    ","  1
    "❤" 0})
(setv separator "👉👈|\u200B")
(setv ipt (filter (fn [x] x) (split separator (.strip (.join "" sys.stdin)))))

(.write sys.stdout (.decode (bytearray (map (fn [word] (sum (map (fn [x] (.get VALUES x 0)) word))) ipt))))
