# Database

[Oracle Database 11G Express Edition](https://www.oracle.com/database/technologies/xe-prior-release-downloads.html)

- **User**: `bulletin_board`
- **Password**: `1234`

---

## Create User

```sql
CREATE USER BULLETIN_BOARD IDENTIFIED BY 1234;
```

## Grant Privileges

```sql
GRANT CONNECT, RESOURCE TO BULLETIN_BOARD;
```

> [!IMPORTANT]
> Enter and execute commands one by one.
