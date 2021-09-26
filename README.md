# addsaduser.sh

Skrypt dodający nowych użytkowników do SAMBA Active Directory. 

Wymagania:

    - System Linux (środowisko testowe Raspbian Buster 2020-02-13)
    - Samba AD DC (gotowy do użycia - skonfigurowany kontroler domeny)
    - Plik .csv z imionami i nazwiskami użytkowników w Formacie "imie,nazwisko"

Użycie:

    $ chmod +x addsaduser.sh
    $ sudo ./addsaduser.sh plik.csv

