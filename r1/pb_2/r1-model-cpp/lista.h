#ifndef LISTA_H
#define LISTA_H


//tip de data generic (pentru moment este intreg)
typedef int TElem;

//referire a structurii Nod;
struct Nod;

//se defineste tipul PNod ca fiind adresa unui Nod
typedef Nod *PNod;

typedef struct Nod{
    TElem e;
	PNod urm;
} Nod;

typedef struct{
//prim este adresa primului Nod din lista
	PNod _prim;
} Lista;

//operatii pe lista - INTERFATA

//crearea unei liste din valori citite pana la 0
    Lista creare();
//tiparirea elementelor unei liste
    void tipar(Lista l);
// destructorul listei
	void distruge(Lista l);

TElem first_elem(Lista l);
Lista empty_list();
bool is_empty(Lista l);
Lista sublist(Lista l);
Lista add_first(Lista l, TElem el);

#endif
