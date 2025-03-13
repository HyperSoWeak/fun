# NTU CSIE Student ID or Name Search Script

This script allows you to search for a student's name or student ID using the NTU CSIE LDAP server.

## Usage

Run the script with either a student ID or a given name as the argument:

```bash
./ldap_lookup.sh <input>
```

### Examples

- **Search by Student ID**:

  ```bash
  ./find.sh b12345678
  ```

- **Search by Given Name**:

  ```bash
  ./find.sh 軒田
  ```

## Requirements

- Must be run on **NTU CSIE workstations**.
- `ldapsearch` must be available on the system.
