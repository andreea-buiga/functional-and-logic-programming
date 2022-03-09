; 14. Determine the list of nodes accesed in postorder in a tree of type (1).

; nv – number of vertices
; nm – number of edges
; left_subtree_traverse(l1l2...lk, nv, nm) = 
;   • Ø, if n = 0
;   • Ø, if nv = 1 + nm
;   • l1 ⊕ l2 ⊕ left_subtree_traverse(l3...lk, nv + 1, nm + l2), otherwise

; left_subtree_traverse(arb: list, nv: number, nm: number)

(defun left_subtree_traverse(arb nv nm)
    (cond
        ((null arb)         nil)
        ((= nv (+ 1 nm))    nil)
        (T                  (cons (car arb) (cons (cadr arb) (left_subtree_traverse (cddr arb) (+ 1 nv) (+ (cadr arb) nm)))))
    )
)

; wrapper function for determining the left subtree 

(defun left_subtree (arb)
    (left_subtree_traverse (cddr arb) 0 0)
)

; right_subtree_traverse(l1l2...lk, nv, nm) = 
;   • Ø, if n = 0
;   • l1l2...lk, if nv = 1 + nm
;   • right_subtree_traverse(l3...lk, nv + 1, nm + l2), otherwise

; right_subtree_traverse(arb: list, nv: number, nm: number)

(defun right_subtree_traverse(arb nv nm)
    (cond
        ((null arb)         nil)
        ((= nv (+ 1 nm))    arb)
        (T                  (right_subtree_traverse (cddr arb) (+ 1 nv) (+ (cadr arb) nm)))
    )
)

; wrapper function for determining the right subtree 

(defun right_subtree (arb)
    (right_subtree_traverse (cddr arb) 0 0)
)

; my_append(a1...am, b1...bn) = 
;   • b1...bn, if m = 0
;   • a1 ∪ my_append(a2...am, b1...bn), otherwise

; my_append(L1: list, L2: list)

(defun my_append (L1 L2)
    (cond
        ((null L1)  L2)
        (T          (cons (car L1) (my_append (cdr L1) L2)))
    )
)

; postorder(t1t2...tn) =
;   • Ø, if n = 0
;   • postorder(left_subtree(t1t2...tn)) ⊕ postorder(rigth_subtree(t1t2...tn)) ⊕ t1, otherwise

; postorder(tree: list)

(defun postorder(tree)
    (cond
        ((null tree) nil)
        (T (my_append 
                (postorder (left_subtree tree))
                (my_append 
                    (postorder (right_subtree tree)) 
                    (list(car tree))
                )
            )
        )
    )
)

;(print (left_subtree '(A 2 B 2 C 1 I 0 F 1 G 0 D 2 E 0 H 0)))
;(print (right_subtree '(A 2 B 2 C 1 I 0 F 1 G 0 D 2 E 0 H 0)))
(print "L2. 14. Determine the list of nodes accesed in postorder in a tree of type (1).")
(print "-----------------------------------------------------")
(print (postorder '(A 2 B 2 C 1 I 0 F 1 G 0 D 2 E 0 H 0)))
(print (postorder '(A 2 B 0 C 2 D 0 E 0)))
(print "-----------------------------------------------------")
