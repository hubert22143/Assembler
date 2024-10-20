.model tiny ; definiujemy model mikroprocesora
.data ; sluzy do definicji zmiennych
znak1 db 'K' ; rezerwujemy bajt pamięci na przechowanie słowa K w zmiennej znak1
 znak2 db 'P'; rezerwujemy bajt pamięci na przechowanie słowa P w zmiennej znak2
 znak3 db 'U'; rezerwujemy bajt pamięci na przechowanie słowa U w zmiennej znak3
.code
org 100h ; ustawiamy adres początkowy kodu na 100h
start: ; poczatek kodu

mov al,znak1 ; przenosimy zawartosc znak1 do al
mov dl,al ; przenosimy zawartosc al do dl co pozwoli nam na poprawne zczytanie wartosci
mov ah,2 ; uzywamy funkcji aby zczytac zawartosc dl
int 21h ; przerywnik systemu na interakcje z procesorem

mov ah, 86h ; funkcja pozwalajaca nam na zatrzymanie programu na okreslony czas
mov cx, 18 ; ustawienie sekundy na 18 cykli, z cx zczytywana jest wartosc na jaki odstep czasowy program ma sie zatrzymac
int 15h; wykorzystanie przerywnika ktory pozwoli nam skorzystac z funkcji oraz skontaktuje sie z procesorem na zrealizowanie tego celu

mov al,znak2 ; przenosimy zawartosc znak2 do al
mov dl,al ; przenosimy zawartosc al do dl co pozwoli nam na poprawne zczytanie wartosci
mov ah,2 ; uzywamy funkcji aby zczytac zawartosc dl
int 21h ; przerywnik systemu na interakcje z procesorem

mov ah, 86h ; funkcja pozwalajaca nam na zatrzymanie programu, nie definiujemy juz cx bo zostalo zdefiniowane a wartosc pozostaje niezmienna przez reszte programu
int 15h; wykorzystywanie przerywnika

mov al,znak3 ; przenosimy zawartosc znak3 do al
mov dl,al ; przenosimy zawartosc al do dl co pozwoli nam na poprawne zczytanie wartosci
mov ah,2 ; uzywamy funkcji aby zczytac zawartosc dl
int 21h ; przerywnik systemu na interakcje z procesorem

mov ah, 86h ; funkcja pozwalajaca nam na zatrzymanie programu na okreslony czas
int 15h; wykorzystanie przerywnika

mov ax,4C00h ; funkcja na zakonczenie programu
int 21h ; wykorzystanie przerywnika realizujace rozkaz

end start ; zakonczenie kodu
