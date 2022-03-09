#include "lista.h"
#include <iostream>

/**
 * 2. a. Substitute the i-th element from a list, with a value v.
      b. Determine difference_rec of two sets represented as lists.
 */

/// a
/**
 * we substitute the element from the list on the position i by searching withing the list until we reach that position i,
 * replace it with the value v
 *
 * substitute_ith_element(l1...ln, v, i) =
 *      • [], if n = 0
 *      • v ∪ l2...ln, if i = 1
 *      • l1 ∪ substitute_ith_element(l2...ln, v, i - 1), otherwise
 */
Lista substitute_ith_element_rec(Lista l, int v, int i) {
    if(is_empty(l)) {
        return empty_list();
    }
    if(i == 1) {
        return add_first(sublist(l), v);
    }
    return add_first(substitute_ith_element_rec(sublist(l), v, i - 1), first_elem(l));
}

Lista substitute_ith_element(Lista l1, int v, int i) {
    Lista result = empty_list();
    result = substitute_ith_element_rec(l1, v, i);
    return result;
}

/// b
/**
 * searching an element in a list
 *
 * search(l1...ln, elem) =
 *      • false, if n = 0
 *      • true, if l1 = elem
 *      • search(l2...ln, elem), otherwise
 */
bool search(Lista list, TElem elem) {
    if (is_empty(list))
        return false;
    if (first_elem(list) == elem)
        return true;
    return search(sublist(list), elem);
}

/**
 * making a list a set by searching the element within the current list and making a set (with unique values)
 *
 * list_to_set(l1...ln) =
 *      • [], if n = 0
 *      • l1 ∪ list_to_set(l2...ln), if search(l1...ln, l1) = 1
 *      • list_to_set(l2...ln), otherwise
 */

Lista list_to_set(Lista list) {
    if (is_empty(list))
        return empty_list();
    TElem elem = first_elem(list);
    if (!search(sublist(list), elem)) {
        return add_first(list_to_set(sublist(list)),elem);
    }
    return list_to_set(sublist(list));
}

/**
 * the difference_rec between the two sets is done by searching each element from l1 in l2
 *
 * difference_rec(a1...an, b1...bm) =
 *      • [], if n = 0
 *      • a1...an, if m = 0
 *      • a1 ∪ difference_rec(a2...an, b1...bm), if search(b1...bm, a1) = 0
 *      • difference_rec(a2...an, b1...bm), otherwise
 */
Lista difference_rec(Lista l1, Lista l2) {
    if (is_empty(l1))
        return empty_list();
    if (is_empty(l2))
        return l1;
    TElem elem = first_elem(l1);
    if (!search(l2, elem)) {
        return add_first(difference_rec(sublist(l1), l2), elem);
    }
    return difference_rec(sublist(l1), l2);
}

Lista difference(Lista l1, Lista l2) {
    Lista result = empty_list();
    result = difference_rec(l1, l2);
    return result;
}

void print_menu() {
    std::cout << "\n\t1 | substitute the i-th element from a list, with a value v.\n";
    std::cout << "\t2 | determine difference_rec of two sets represented as lists.\n";
    std::cout << "\t0 | exit.\n";
}

void run_problem_2() {
    bool done = false;
    int command;
    Lista l1, l2, set1, set2, result;
    print_menu();
    while(!done) {
        std::cout << "\n> your command: ";
        std::cin >> command;
        if(command == 1) {
            int v, i;
            std::cout << "\t give values for l1\n";
            l1 = creare();
            std::cout << "\nv = ";
            std::cin >> v;
            std::cout << "\ni = ";
            std::cin >> i;
            std::cout << "\n";
            result = substitute_ith_element(l1, v, i);
            std::cout << "\n  the result\n";
            tipar(result);
            distruge(l1);
        }
        else
            if(command == 2) {
                std::cout << "\t give values for l1\n";
                l1 = creare();
                std::cout << "\t give values for l2\n";
                l2 = creare();
                set1 = list_to_set(l1);
                set2 = list_to_set(l2);
                std::cout << "\n  set 1 - set 2\n";
                result = difference(set1, set2);
                tipar(result);
                std::cout << "\n  set 2 - set 1\n";
                result = difference(set2, set1);
                tipar(result);
                distruge(l1);
                distruge(l2);
                distruge(set1);
                distruge(set2);
                distruge(result);
            }
            else
                if(command == 0) {
                    std::cout << "\nbye bye!\n";
                    done = true;
                }
                else {
                    std::cout << "\nbad command!\n";
                }
    }
}

int main() {
    run_problem_2();
    return 0;
}
