# Esercizio 2 — Importare CSV in MariaDB

## Cosa contiene lo zip

- `clienti.csv`, `fornitori.csv`, `fatture.csv` — i 3 file da importare
- `docker-compose.yml` — avvia MariaDB 11 con i CSV montati in `/csv/`
- `docker.sh` — alternativa senza docker-compose (solo `docker run`)
- `mariadb.sh` — shortcut per connettersi al database (utente `quickshop`)
- `grant.sql` — da eseguire UNA volta come root (vedi Step 2)
- `schema.sql`, `import.sql`, `verify.sql` — contengono note su cosa fanno, dovete capirlo da soli

---

## Step 1 — Avviare MariaDB

Da terminale, nella cartella dello zip:

```bash
docker compose up -d
```

In alternativa, se `docker compose` non funziona:

```bash
./docker.sh
```

Attendere qualche secondo che il container sia pronto.

---

## Step 2 — Privilegi (una volta sola)

Prima di importare serve il privilegio `FILE`. Connettetevi come **root**:

```bash
docker exec -it quickshop mariadb -u root -prootpass quickshop
```

Eseguite:

```sql
source grant.sql
exit
```

Da qui in avanti usate `mariadb.sh` (utente `quickshop`).

---

## Step 3 — Connettersi

```bash
./mariadb.sh
```

Oppure manualmente:

```bash
docker exec -it quickshop mariadb -u quickshop -pquickshop quickshop
```

---

## Step 4 — Leggere, eseguire, correggere

I tre file `.sql` vanno eseguiti nell'ordine giusto. Leggeteli prima di eseguirli per capire a cosa servono.

---

## Step 5 — Verificare

A import completato, eseguite il file di verifica e controllate che tutto torni.

---

## Step 6 — Google Form

Compilare il form con le risposte trovate durante l'esercizio:

https://forms.gle/27bQggGbEQL1XH2v9
