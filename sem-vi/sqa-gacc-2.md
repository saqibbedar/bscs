Perfect. Your truth-table ordering is different, and that changes row numbering.
The logic is still correct — we just rebuild using YOUR ordering.

We’ll do this extremely systematically.

---

# Given Predicate

```text id="a11"
P = A ∨ (B ∧ C)
```

---

# STEP 1 — Build Truth Table

You said start with:

```text id="a12"
A: T T T T F F F F
```

Standard continuation:

```text id="a13"
B: T T F F T T F F
C: T F T F T F T F
```

Now calculate everything carefully.

---

# STEP 2 — Calculate (B ∧ C)

Remember AND rule:

```text id="a14"
T ∧ T = T
otherwise = F
```

| Case | A | B | C | (B ∧ C) |
| ---- | - | - | - | ------- |
| 1    | T | T | T | T       |
| 2    | T | T | F | F       |
| 3    | T | F | T | F       |
| 4    | T | F | F | F       |
| 5    | F | T | T | T       |
| 6    | F | T | F | F       |
| 7    | F | F | T | F       |
| 8    | F | F | F | F       |

---

# STEP 3 — Calculate Predicate

Predicate:

```text id="a15"
P = A ∨ (B ∧ C)
```

OR rule:

```text id="a16"
If ANY side is TRUE → result TRUE
```

---

# Full Truth Table

| Case | A | B | C | (B ∧ C) | P = A ∨ (B ∧ C) |
| ---- | - | - | - | ------- | --------------- |
| 1    | T | T | T | T       | T               |
| 2    | T | T | F | F       | T               |
| 3    | T | F | T | F       | T               |
| 4    | T | F | F | F       | T               |
| 5    | F | T | T | T       | T               |
| 6    | F | T | F | F       | F               |
| 7    | F | F | T | F       | F               |
| 8    | F | F | F | F       | F               |

---

Now we begin GACC properly.

---

# STEP 4 — Understand What GACC Wants

For EACH clause:

* make it the MAJOR clause
* freeze others suitably
* flip only major clause
* predicate must change

---

# IMPORTANT CONCEPT

## Major Clause

Clause we are testing.

## Minor Clauses

All other clauses.

---

# STEP 5 — GACC for A

We ask:

> When does A control the predicate?

Predicate:

```text id="a17"
P = A ∨ (B ∧ C)
```

For A to matter:

```text id="a18"
(B ∧ C) must be FALSE
```

Why?

Because if:

```text id="a19"
(B ∧ C) = TRUE
```

Then:

```text id="a20"
P = A ∨ TRUE = TRUE
```

A becomes useless.

---

# So choose rows where:

```text id="a21"
(B ∧ C) = FALSE
```

Possible rows:

* 2
* 3
* 4
* 6
* 7
* 8

Now we need:

* only A changes
* P changes

---

# Select Cases 4 and 8

| Case | A | B | C | (B∧C) | P |
| ---- | - | - | - | ----- | - |
| 4    | T | F | F | F     | T |
| 8    | F | F | F | F     | F |

---

# Check Carefully

Minor clauses fixed:

```text id="a22"
B = F
C = F
```

Major clause:

```text id="a23"
A: T → F
```

Predicate:

```text id="a24"
P: T → F
```

✔ A determines P

---

# STEP 6 — GACC for B

Now B is major clause.

Predicate:

```text id="a25"
P = A ∨ (B ∧ C)
```

We ask:

> When does B matter?

---

If:

```text id="a26"
A = TRUE
```

Then:

```text id="a27"
P = TRUE ∨ anything = TRUE
```

B useless.

---

If:

```text id="a28"
C = FALSE
```

Then:

```text id="a29"
B ∧ FALSE = FALSE
```

Again B useless.

---

# Therefore for B to matter:

We MUST set:

```text id="a30"
A = FALSE
C = TRUE
```

Now:

```text id="a31"
P = FALSE ∨ (B ∧ TRUE)
= B
```

Excellent — B now fully controls P.

---

# Find rows with:

```text id="a32"
A = F
C = T
```

Rows:

* 5
* 7

---

# Select Cases 5 and 7

| Case | A | B | C | (B∧C) | P |
| ---- | - | - | - | ----- | - |
| 5    | F | T | T | T     | T |
| 7    | F | F | T | F     | F |

---

# Check

Minor clauses fixed:

```text id="a33"
A = F
C = T
```

Major clause:

```text id="a34"
B: T → F
```

Predicate:

```text id="a35"
P: T → F
```

✔ B determines P

---

# STEP 7 — GACC for C

Now C is major clause.

We ask:

> When does C matter?

---

If:

```text id="a36"
A = TRUE
```

Then predicate always TRUE.

C useless.

---

If:

```text id="a37"
B = FALSE
```

Then:

```text id="a38"
FALSE ∧ C = FALSE
```

C useless.

---

# Therefore:

To make C matter:

```text id="a39"
A = FALSE
B = TRUE
```

Now:

```text id="a40"
P = FALSE ∨ (TRUE ∧ C)
= C
```

Excellent.

---

# Find rows with:

```text id="a41"
A = F
B = T
```

Rows:

* 5
* 6

---

# Select Cases 5 and 6

| Case | A | B | C | (B∧C) | P |
| ---- | - | - | - | ----- | - |
| 5    | F | T | T | T     | T |
| 6    | F | T | F | F     | F |

---

# Check

Minor clauses fixed:

```text id="a42"
A = F
B = T
```

Major clause:

```text id="a43"
C: T → F
```

Predicate:

```text id="a44"
P: T → F
```

✔ C determines P

---

# FINAL GACC TEST REQUIREMENTS

| Major Clause | Selected Test Pair |
| ------------ | ------------------ |
| A            | (4, 8)             |
| B            | (5, 7)             |
| C            | (5, 6)             |

---

# FINAL UNIQUE TEST SET

Combine all unique rows:

| Case | A | B | C | P |
| ---- | - | - | - | - |
| 4    | T | F | F | T |
| 5    | F | T | T | T |
| 6    | F | T | F | F |
| 7    | F | F | T | F |
| 8    | F | F | F | F |

---

# MOST IMPORTANT EXAM SKILL

# How do you SELECT rows?

This is the real method:

---

# Rule 1 — Choose major clause

Example:

```text id="a45"
B
```

---

# Rule 2 — Make other clauses “neutral”

Meaning:

> Set minor clauses so major clause can control output.

---

# For OR operator

To make something matter:

* other OR side must become FALSE

---

# For AND operator

To make something matter:

* other AND side must become TRUE

---

# Example Again

Predicate:

```text id="a46"
A ∨ (B ∧ C)
```

To make:

* A matter → make (B∧C)=F
* B matter → make A=F and C=T
* C matter → make A=F and B=T

That’s the entire logic of GACC.
