1.	Kod programu wraz z opisem (komentarzami).
Zadanie 1.
.model tiny // model procesora na którym obecnie pracujemy
.data
dane1 dw 2 // definiujemy zmienna dane1 która przechowuje wartosc 2
dane2 dw 1 // definiujemy zmienna dane2 która przechowuje wartosc 1 
.code
org 100h // początek linii od której będziemy pisać, w td nasz kod się będzie wyswietlal od linii 100
start:

mov ax,4  // przenosimy wartość 4 do ax, wartość AX zmienia się na 0004 

inc ax // inkrementujemy wartość o 1, wartość rejestru w AX zmienia się na 0005
dec ax // dekrementujemy wartość o 1, wartość rejestru w AX zmienia się na 0004

sub ax,2 // odejmujemy 2 od rejestru AX 

mov bx,2 // przenosimy wartość 2 do rejestru bx 
mul bx // mnożymy akumulator AX o wartość rejestru BX 

div dane1 // dzielimy wartosc rejestru AX przez parametr dane1 o wartości 2, wynikiem jest 0002

and ax,dane2 // porównujemy wartości logiczne AX oraz zmienna dane2 
		AX: 0100
		Dane2 0001
	Wynik: 0000
mov ax,4 // przenosimy 4 do rejestru ax 
or ax,dane2 // porównujemy rejestr AX z zmienna dane2
	AX: 0100
	Dane2: 0001
	Wynik: 0101
mov ax,4 // przenosimy 4 do rejestru ax 
xor ax,dane2 // porównujemy rejestr AX z zmienna dane2
	AX: 0100
	Dane2: 0001
	Wynik: 0101
end start
/--------------------------------------------------------------------------------------------------------------------/
Zadanie 2.
.model tiny // definiujemy model tiny
.code
org 100h // linia startu kodu
start:

mov ah,1 // zczytujemy klawisz z klawiatury
int 21h // używamy funkcji zczytywania klawisza z klawiatury

mov dl,al. // przenosimy wczytany klawisz z rejestru w którym się zapisuje do dl w celu prawidłowego odczytania
inc dl // inkrementujemy jego wartosc o 1, w ten sposób zyskujemy nastepujaca wartosc w tabeli ASCI przykład:
dla klikanego klawisza a otrzymujemy b
mov ah,2 // wczytujemy zapisany klawisz w rejestrze dl
int 21h // używamy funkcji wczytywania zapisanego klawiszu z rejestru dl

mov ax,4C00h // kończymy program
int 21h // funkcja do zakończenia programu

end start
/--------------------------------------------------------------------------------------------------------------------/
Zadanie 3.
.model tiny
.data
.code
org 100h
start:
mov ah,1 // definiujemy zczytywanie klawisza z klawiatury
int 21h // używamy fukcji do zczytywania klawisza z klawiatury
 
mov dl,al //przenosimy wartosc zczytanego klawisza z al. Do dl
mov bl,020h // przenosimy wartosc 20 w systemie hexa
sub dl, bl // odejmujemy od wartosci rejestru DL wartosc BL w celu otrzymania dużej litery
mov ah,2 // wczytujemy wczytany klawisz po niezbędnych operacjach do prawidłowego działania programu
int 21h // korzystamy z funkcji do wczytywania zczytanego klawisza

mov ax,4C00h // kończymy program
int 21h // używamy funkcji do zakończenia programu
end start
/--------------------------------------------------------------------------------------------------------------------/
Zadanie 4.
.model tiny // definiujemy model mikroprocesora
.code
org 100h // linia startowa w kodzie
start:
mov ax,04 // rok urodzenia // 0100
mov bx,05 // miesiąc urodzenia // 0101
mov cx,08 // dzień urodzenia / 1000

xor dx,dx // zerujemy caly rejestr DX 
mov dx,bx // przenosimy BX do DX

shl dx,4 // shiftujemy 4 bity w lewo w celu zrobienia miejsca dla miesiąca
//w programie wartosc dx: 0050
xor dx,cx // „updatujemy”(czyli ustawiamy) zrobione miejsce dla dnia urodzenia

shl dx,5 // shiftujemy 5 bitow w lewo w celu zrobienia miejsca dla roku
//Po zrobieniu miejsca dla roku: 0B00
xor dx,ax // „updatujemy” rejestr o wartosc roku urodzenia
//wynik końcowy: 0B04
