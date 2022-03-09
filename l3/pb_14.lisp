; count_atoms(l) = 
;   • Ø, if n = 0
;   • 1, if l is an atom
;   • sum from i = 1 to n (li), otherwise 

; count_atoms(l: list)

(defun count_atoms(l)
    (cond 
        ((null l) 0)
        ((atom l) 1)
        (T (apply #'+(mapcar #' count_atoms l)))
    )
)

(print "L3. 14. Write a function that returns the number of atoms in a list, at any level.")
(print "-----------------------------------------------------")
(print (count_atoms '(1 A B (2 C (1)))))
(print (count_atoms '(1 A B (2 C (1)))))
(print (count_atoms '(1 A B (2 C (1 (2) (((2 4 A ()))))))))
(print (count_atoms '()))
(print (count_atoms '(() (()()))))