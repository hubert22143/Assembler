.model tiny ; definiujemy model mikroprocesora
.code
org 100h ; ustawiamy adres początkowy kodu na 100h
start: ; poczatek kodu
mov ah,2ah ; pobieramy date systemowa
int 21h ; wykorzystujemy przerywnik w celu wykonania polecenia

mov ax,4C00h ; konczymy program
int 21h ; wykorzystujemy przerywnik na zakonczenie programu

end start ; zakonczenie kodu
