(import sys)
(setv VALUES {
    "🫂" 200
    "💖" 50
    "✨" 10
    "🥺" 5
    ","  1
    "❤️" 0})
(setv separator "👉👈")
(setv ipt (filter (fn [x] x) (.split (.strip (.join "" sys.stdin)) separator)))

(.write sys.stdout (.join "" (map chr (map (fn [word] (sum (map VALUES.__getitem__ word))) ipt))))
