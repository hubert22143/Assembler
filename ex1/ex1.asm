.model tiny ; Definiujemy model mikroprocesora 8086
.code
org 100h ; Ustawiamy adres początkowy kodu na 100h
start: ; Początek kodu
    mov ah, 1 ; Używamy funkcji wbudowanej, która pozwala na odczytywanie klawisza z klawiatury
    int 21h ; Przerwanie DOS, które umożliwia nam wczytanie klawisza

    mov dl, al ; Przenosimy dane z rejestru AL do DL, upewniamy się, że zczytywany będzie poprawny klawisz.

    mov ah, 2 ; Używamy wbudowanej funkcji, która pozwala nam na wyświetlenie znaku na ekranie
    int 21h ; Przerwanie DOS, które umożliwia nam interakcję z systemem na wyświetlenie znaku

    mov ax, 4C00h ; Funkcja na zakończenie programu
    int 21h ; Przerwanie, które kończy program
end start ; Zakończenie kodu.
