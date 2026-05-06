# Esercizio 2 — Importare CSV in MariaDB

## Cosa contiene lo zip

- `clienti.csv`, `fornitori.csv`, `fatture.csv` — i 3 file da importare (151, 50, 150 righe)
- `docker-compose.yml` — avvia MariaDB 11 con i CSV montati in `/csv/`
- `docker.sh` — alternativa senza docker-compose (solo `docker run`)
- `mariadb.sh` — shortcut per connettersi al database
- `schema.sql` — CREATE TABLE già pronte
- `import.sql` — comandi LOAD DATA per importare i 3 CSV
- `verify.sql` — query di verifica finale

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

## Step 2 — Connettersi

```bash
./mariadb.sh
```

Oppure manualmente:

```bash
docker exec -it quickshop mariadb -u quickshop -pquickshop quickshop
```

---

## Step 3 — Creare le tabelle

Dentro il client MariaDB:

```sql
source schema.sql
```

Le tre tabelle (`clienti`, `fornitori`, `fatture`) vengono create con chiavi primarie, foreign key e tipi corretti.

---

## Step 4 — Importare (e fallire)

```sql
source import.sql
```

L'import si fermerà a un **errore**. Leggete il messaggio per capire qual è il problema.

---

## Step 5 — Correggere e riprovare

Per ogni errore:

1. **Leggere** il messaggio di errore per capire quale tabella e quale valore causa il problema
2. **Aprire il CSV** incriminato con un editor di testo
3. **Cancellare la riga** che contiene l'errore
4. **Svuotare la tabella** e riprovare:
   ```sql
   TRUNCATE TABLE nome_tabella;
   source import.sql
   ```
5. Ripetere finché l'import non va a buon fine per tutte e tre le tabelle

Ci sono 4 errori da risolvere in totale. Ogni volta che correggete un errore, l'import andrà un po' più avanti prima di fermarsi al successivo.

---

## Step 6 — Verificare

A import completato, eseguire:

```sql
source verify.sql
```

Controllate che:
- I conteggi righe siano corretti
- Le query FK orfane restituiscano **0 righe**
- Il totale delle fatture sia sensato (> 0)

---

## Step 7 — Google Form

Compilare il form con le risposte trovate durante l'esercizio:

https://forms.gle/27bQggGbEQL1XH2v9
