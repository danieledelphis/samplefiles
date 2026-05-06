# Esercizio 2 — Importare CSV in MariaDB

## Cosa contiene lo zip

- `clienti.csv`, `fornitori.csv`, `fatture.csv` — i 3 file da importare 
- `docker-compose.yml` — avvia MariaDB 11 con i CSV montati in `/csv/`
- `docker.sh` — alternativa senza docker compose (solo `docker run`)
- `mariadb.sh` — shortcut per connettersi al database
- `schema.sql` 
- `import.sql` 
- `verify.sql` 

---

## Step 1 — Avviare MariaDB

Da terminale, nella cartella dello zip:

```bash
docker compose up -d
```

---

## Step 2 — Connettersi al db

```bash
docker exec -it quickshop mariadb -u quickshop -pquickshop quickshop
```

---

## Step 3

Vengono forniti tre file .sql.
Utilizzare le query contenute in questi files per creare le tabelle, e effettuare l'import dei CSV.

---

## Step 4 — Correggere e riprovare

Per ogni errore:

1. **Leggere** il messaggio di errore per capire quale tabella e quale valore causa il problema
2. **Risolvere il problema nei dati**
3. **Svuotare la tabella** e riprovare:
   ```sql
   TRUNCATE TABLE nome_tabella;
   ```
4. Ripetere finché l'import non va a buon fine per tutte e tre le tabelle

---

## Step 5 — Verificare

A import completato, eseguire le query contenute in uno dei file .sql.

Controllate che:
- I conteggi righe siano corretti
- Le query FK orfane restituiscano **0 righe**
- Il totale delle fatture sia sensato (> 0)

---

## Step 6 — Google Form

Compilare il form con le risposte trovate durante l'esercizio:

https://forms.gle/27bQggGbEQL1XH2v9
