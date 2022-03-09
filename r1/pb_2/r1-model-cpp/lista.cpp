#include "lista.h"
#include <iostream>

using namespace std;


PNod creare_rec(){
    TElem x;
    cout << "\nx = ";
    cin >> x;
    if (x == 0)
        return NULL;
    else{
        PNod p=new Nod();
        p->e=x;
        p->urm=creare_rec();
        return p;
    }
}

Lista creare() {
    Lista l;
    l._prim = creare_rec();
}

void tipar_rec(PNod p){
   if(p != NULL){
     cout << p->e << " ";
     tipar_rec(p->urm);
   }
}

void tipar(Lista l){
   tipar_rec(l._prim);
}

void distruge_rec(PNod p){
   if (p != NULL){
     distruge_rec(p->urm);
     delete p;
   }
}

void distruge(Lista l) {
    distruge_rec(l._prim);
}

TElem first_elem(Lista l) {
    return l._prim->e;
}

Lista empty_list() {
    Lista l;
    l._prim = NULL;
    return l;
}

bool is_empty(Lista l) {
    return l._prim == NULL;
}

Lista sublist(Lista l) {
    Lista new_list;
    new_list._prim = l._prim->urm;
    return new_list;
}

Lista add_first(Lista l, TElem el) {
    PNod node = new Nod();
    node->e = el;
    node->urm = l._prim;
    l._prim = node;
    return l;
}