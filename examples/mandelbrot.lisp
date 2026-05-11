(define SCALE 1000000)

(define quotient (lambda (a b)
  (if (< a 0)
    (- 0 (quotient (- 0 a) b))
    (if (< a b) 0
      (if (< a (+ b b))
        1
        ((lambda (q)
           (+ (+ q q) (quotient (- a (* (+ q q) b)) b)))
         (quotient a (+ b b))))))))

(define fix* (lambda (a b) (quotient (* a b) SCALE)))

(define mandelbrot-iter (lambda (cr ci zr zi count max-iter)
  ((lambda (zr2 zi2 zri)
     (if (>= (+ zr2 zi2) (* 4 SCALE))
       count
       (if (>= count max-iter)
         count
         (mandelbrot-iter cr ci
           (+ (- zr2 zi2) cr)
           (+ (* 2 zri) ci)
           (+ count 1)
           max-iter))))
   (fix* zr zr)
   (fix* zi zi)
   (fix* zr zi))))

(define mandelbrot (lambda (cr ci max-iter)
  (mandelbrot-iter cr ci 0 0 0 max-iter)))

(define char-for-count (lambda (count max-iter)
  ((lambda (q3)
    (cond
      ((eq? count max-iter) (quote @))
      ((> count (+ q3 q3)) (quote *))
      ((> count q3) (quote +))
      (else (quote -))))
   (quotient max-iter 3))))

(define print-row (lambda (x y x-end step max-iter)
  (if (> x x-end)
    (newline)
    ((lambda (_)
       (print-row (+ x step) y x-end step max-iter))
     (display (char-for-count (mandelbrot x y max-iter) max-iter))))))

(define render (lambda (y y-end x-start x-end step max-iter)
  (if (> y y-end)
    (quote done)
    ((lambda (_)
       (render (+ y step) y-end x-start x-end step max-iter))
     (print-row x-start y x-end step max-iter)))))

(render -1000000 1000000 -2000000 500000 50000 30)
