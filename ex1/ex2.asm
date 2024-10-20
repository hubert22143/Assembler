.model tiny ; definiujemy model mikroprocesora
.code
org 100h ; ustawiamy adres początkowy kodu na 100h
start: ; początek kodu

    mov ah, 1 ; używamy wbudowanej funkcji, która pozwala na wczytywanie klawisza
    int 21h ; przerwanie DOS, które pozwala nam na interakcję z systemem i wczytanie klawisza

    mov bl, al ; kopiujemy zawartość AL (wczytany klawisz) do BL, aby zachować pierwszy znak

    mov ah, 1 ; używamy wbudowanej funkcji, która pozwala na wczytanie kolejnego klawisza
    int 21h ; przerwanie DOS, które pozwala nam na interakcję z systemem i wczytanie klawisza

    mov bh, al ; kopiujemy zawartość AL (wczytany klawisz) do BH, aby zachować drugi znak

    mov dl, bh ; kopiujemy zawartość BH do DL, aby wyświetlić drugi wprowadzony znak

    mov ah, 2 ; przygotowujemy funkcję do wyświetlenia znaku z DL
    int 21h ; wywołujemy przerwanie, aby wyświetlić drugi znak

    mov dl, bl ; kopiujemy pierwszy znak z BL do DL, aby go wyświetlić

    mov ah, 2 ; przygotowujemy funkcję do wyświetlenia znaku z DL
    int 21h ; wywołujemy przerwanie, aby wyświetlić pierwszy znak

    mov ax, 4C00h ; funkcja na zakończenie programu
    int 21h ; przerwanie, które kończy program

end start ; zakończenie kodu
