# Bulletin Board

- JAVA 17
- Oracle DB 11
- Apache Tomcat 9

---

## List of Contents

- [1. Workspace Encoding](#1-workspace-encoding)
- [2. JDK Configuration](#2-jdk-configuration)
- [3. Apache Tomcat Runtime](#3-apache-tomcat-runtime)
- [4. Perspective Customization](#4-perspective-customization)
- [5. Project Properties](#5-project-properties)
- [6. Server Settings](#6-server-settings)
- [Cryptography](#cryptography)

---

## 1. Workspace Encoding

### Workspace

```bash
Window > Preferences > General > Workspace
```

- text file encoding : `UTF-8`

### Text Editor Spelling

```bash
 Window > Preferences > General > Editors > Text Editors > Spelling
```

- Encoding : `UTF-8`

### Web Files Encoding

```bash
Window > Preferences > Web > CSS Files
Window > Preferences > Web > HTML Files
Window > Preferences > Web > JSP Files
```

- Encoding : `UTF-8`

---

## 2. JDK Configuration

### Installed JREs

```bash
Window > Preferences > Installed JREs
```

- select `jdk17.x.x`

### Java Compiler

```bash
Window > Preference > Java > Compiler
```

- `compiler compliance level:` `17`

---

## 3. Apache Tomcat Runtime

### Add Tomcat Runtime

```bash
Window > Preferences > Server > Runtime Environment
```

1. Click `add`
2. Select `apache`
3. Select `Tomcat v9.0 Server`

---

## 4. Perspective Customization

```bash
Windows > Perspective > Customize Perspective
```

`Shortcuts` tab

- select `java` from category
  - uncheck `Java Project from Existing Ant Build file`
- select `web` from category
  - uncheck `Static Web Project`

---

## 5. Project properties

### Build Path

```bash
Project > Properties > Java Build Path > Libraries
```

#### Java Build Path

1. select `Module /  JRE System Library[]` then `Edit...`
2. under `Execution environment` select `jdk 17.x.x` or try `Workspace default JRE(jdk17.x.x)`

#### Server setting

1. select `ClassPath` then `Add Library...`
2. Server Runtime > Next
3. check `Apache Tomcat v9.0`

---

### Project Facets

```bash
Project > Properties > Project Facets
```

- `Dynamic Web Module` to `4.0`
- `Java` to `17`

### Targeted Runtimes

```bash
Project > Properties > Targeted Runtimes
```

- `Apache Tomcat v9.0`

### Web Project Settings

```bash
Project > Properties > Web Project Settings
```

`context root`: `/`

---

## 6. Server Settings

```bash
Bottom right > Servers > New Server
```

### Add Apache Tomcat

1. Select `Tomcat v9.0 Server`
2. Browse `Tomcat installation directory`
3. Select the tomcat installation directory

### Configure Apache Server

- Double click `Tomcat v9.0 Server at localhost`

  - Under the `Port Name` set port number of `HTTP/1.1` to `80`
  - Under the `Sever Options` check `Serve modules without publishing`

- Right click `Tomcat v9.0 Server at localhost`
  - From `add and removes` double click the project you want to add or remove

---

## Cryptography

`Plaintext`: The original data entered by the user

`Encryption`: The process of converting plaintext into encoded or unreadable data

`Decryption`: The process of converting encrypted data back into readable plaintext

---

### Symmetric Key Encryption

Encryption and decryption are performed using the `same key`

### Asymmetric Key Encryption

Uses a `public key` and a `private key`

- Public key: used for encryption
- Private key: used for decryption

### One-Way Hash Function

Converts plaintext into a `fixed-length hashed value`

- Decryption is `not possible`
- Common algorithms:
  - `SHA-256`
  - `SHA-512`
  - `bcrypt` (considered more secure than SHA algorithms)

---

#### Happy Hacking 🎉
