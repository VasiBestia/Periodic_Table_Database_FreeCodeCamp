# 🧪 Periodic Table Database

![Bash](https://img.shields.io/badge/Shell_Script-121011?style=for-the-badge&logo=gnu-bash&logoColor=white)
![PostgreSQL](https://img.shields.io/badge/PostgreSQL-316192?style=for-the-badge&logo=postgresql&logoColor=white)
![Git](https://img.shields.io/badge/Git-F05032?style=for-the-badge&logo=git&logoColor=white)

A Command Line Interface (CLI) utility designed to retrieve information about chemical elements. This project involves a robust **Bash script** that interacts with a **PostgreSQL database**, capable of accepting input in the form of atomic numbers, symbols, or full element names.

## 📋 Project Overview

This project was built as part of the **freeCodeCamp Relational Database Certification**. The core challenge involved refactoring a "legacy" database with inconsistent data and structure, followed by creating a script to query the cleaned data efficiently.

### Key Features
* **Intelligent Input Handling:** The script (`element.sh`) accepts an argument and automatically detects if it is an:
    * `Atomic Number` (e.g., `1`)
    * `Symbol` (e.g., `H`)
    * `Element Name` (e.g., `Hydrogen`)
* **Data Normalization:** Extracted property types into a separate `types` table to enforce 3NF (Third Normal Form).
* **Data Integrity:** Implemented constraints such as `NOT NULL`, `UNIQUE`, and Foreign Keys to ensure reliability.
* **Data Cleaning:**
    * Removed trailing zeros from atomic mass values for precision.
    * Standardized capitalization for element symbols and names.

## 🗄️ Database Schema

The database relies on three related tables:

### 1. `elements`
Contains the core identity of the chemical elements.
| Column | Type | Constraints | Description |
| :--- | :--- | :--- | :--- |
| `atomic_number` | INT | PRIMARY KEY | Unique ID for the element |
| `symbol` | VARCHAR(2) | UNIQUE, NOT NULL | Chemical symbol (e.g., He) |
| `name` | VARCHAR(40) | UNIQUE, NOT NULL | Full name (e.g., Helium) |

### 2. `properties`
Stores physical attributes of the elements.
| Column | Type | Constraints | Description |
| :--- | :--- | :--- | :--- |
| `atomic_number` | INT | FOREIGN KEY | Links to `elements` table |
| `atomic_mass` | DECIMAL | NOT NULL | Mass of the atom |
| `melting_point` | DECIMAL | NOT NULL | Melting point in Celsius |
| `boiling_point` | DECIMAL | NOT NULL | Boiling point in Celsius |
| `type_id` | INT | FOREIGN KEY | Links to `types` table |

### 3. `types`
Categorizes elements (e.g., Nonmetal, Metal).
| Column | Type | Constraints | Description |
| :--- | :--- | :--- | :--- |
| `type_id` | INT | PRIMARY KEY | Unique ID for the type |
| `type` | VARCHAR | NOT NULL | Category name |

## 🚀 Installation & Usage

### Prerequisites
* Linux/Unix Terminal (or WSL)
* PostgreSQL installed
* Bash

### 1. Database Setup
Rebuild the database using the provided SQL dump:
```bash
psql -U postgres < periodic_table.sql
```
### 2. Make Executable
Ensure the main script has execution permissions:

```bash
chmod +x element.sh
```
### 3. Running the Script
You can run the script by passing an element as an argument:

By Atomic Number:

```bash
./element.sh 1
```
By Symbol:

```bash
./element.sh H
```
By Name:

```bash
./element.sh Hydrogen
```
Expected Output
```plaintext
The element with atomic number 1 is Hydrogen (H). It's a nonmetal, with a mass of 1.008 amu. Hydrogen has a melting point of -259.1 celsius and a boiling point of -252.9 celsius.


```
---
### 🛠️ Refactoring Process (Changes Log)
As part of the development process, the following improvements were made to the original dataset:

Renamed columns (e.g., weight to atomic_mass) for clarity.

Converted atomic_mass to a text-based format to trim unnecessary trailing zeros.

Added NOT NULL constraints to prevent incomplete records.

Created a types table and migrated text data to IDs (Foreign Keys).

Capitalized all element symbols correctly (e.g., he -> He).
---
### Created by Vasilescu Alexandru Gabriel for the freeCodeCamp Relational Database Certification.
