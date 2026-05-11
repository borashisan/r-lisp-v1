(define fib (lambda (n)
  (cond
    ((eq? n 0) 0)
    ((eq? n 1) 1)
    (else (+ (fib (- n 1)) (fib (- n 2)))))))

(define print-fib (lambda (i n)
  (if (> i n)
    (quote done)
    ((lambda (_)
       (print-fib (+ i 1) n))
     ((lambda (_) (newline))
      (display (fib i)))))))

(print-fib 0 30)
