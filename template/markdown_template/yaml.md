```yaml
# Key-Value Pairs
name: John Doe
age: 30
is_active: true

# This is a comment
name: John Doe  # Inline comment

string: "Hello, World!"   # Double quotes allow special characters
single_quotes: 'Hello, YAML!' # Single quotes preserve literal text
multiline: |
  This is a
  multiline string.
folded: >
  This will be
  folded into a single line.

integer: 25
float: 3.14
boolean_true: true
boolean_false: false
null_value: null  # or ~

# Explicit Type Casting
string_number: !!str 12345
boolean_string: !!str "true"

fruits:
  - Apple
  - Banana
  - Orange

# Inline List
colors: [Red, Blue, Green]
person:
  name: Alice
  age: 25
  address:
    city: New York
    zip: 10001

# Inline Map
user: {name: "Bob", role: "Admin"}

config:
  database:
    host: localhost
    port: 5432
    username: admin
    password: secret
  server:
    host: 0.0.0.0
    port: 8080

default_settings: &default
  retries: 3
  timeout: 30s

server1:
  <<: *default
  host: 192.168.1.1

server2:
  <<: *default
  host: 192.168.1.2

value1: !!int 42
value2: !!float 3.14
value3: !!bool yes

---
first_doc:
  key: value
---
second_doc:
  key: another_value
...

database:
  user: ${DB_USER}
  password: ${DB_PASS}

{
  "name": "John Doe",
  "age": 30,
  "is_active": true
}

name: John Doe
age: 30
is_active: true
```