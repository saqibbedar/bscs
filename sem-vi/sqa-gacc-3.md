Perfect. Let’s do it from absolute scratch, very cleanly, very mechanically, and only one goal:

# Learn HOW to perform GACC

We will use:

P = A \lor (B \land C)

---

# STEP 1 — Identify Clauses

Predicate:

P = A \lor (B \land C)

Clauses are:

* A
* B
* C

---

# STEP 2 — Build Truth Table

(TRUE-first ordering as requested)

| Case | A | B | C | B ∧ C | P = A ∨ (B ∧ C) |
| ---- | - | - | - | ----- | --------------- |
| 1    | T | T | T | T     | T               |
| 2    | T | T | F | F     | T               |
| 3    | T | F | T | F     | T               |
| 4    | T | F | F | F     | T               |
| 5    | F | T | T | T     | T               |
| 6    | F | T | F | F     | F               |
| 7    | F | F | T | F     | F               |
| 8    | F | F | F | F     | F               |

Done.

Now the REAL GACC process begins.

---

# WHAT IS GACC?

For each clause:

* make it the **major clause**
* prove it can independently control predicate P

Meaning:

> changing that clause should change P

while minor clauses stay fixed.

---

# STEP 3 — Test A as Major Clause

---

# 3.1 Ask the Main Question

We ask:

# “When can A control P?”

Predicate:

P = A \lor (B \land C)

---

# 3.2 Analyze OR Logic

Remember:

X \lor TRUE = TRUE

If:

```text id="s1"
(B ∧ C) = TRUE
```

then:

* P always TRUE
* A becomes useless

❌ A cannot determine P

---

# 3.3 So What Do We Need?

We need:

```text id="s2"
(B ∧ C) = FALSE
```

because:

A \lor FALSE = A

Now:

# P = A

Excellent.
A directly controls predicate now.

---

# 3.4 Find Rows Where (B∧C)=FALSE

From table:

| Case | A | B | C | B∧C | P |
| ---- | - | - | - | --- | - |
| 2    | T | T | F | F   | T |
| 3    | T | F | T | F   | T |
| 4    | T | F | F | F   | T |
| 6    | F | T | F | F   | F |
| 7    | F | F | T | F   | F |
| 8    | F | F | F | F   | F |

---

# 3.5 Choose Two Rows

Need:

* only A changes
* P changes

Choose:

| Case | A | B | C | P |
| ---- | - | - | - | - |
| 2    | T | T | F | T |
| 6    | F | T | F | F |

Observe:

* B fixed = T
* C fixed = F
* only A changes
* P changes

✅ Therefore:

# A determines P

✅ GACC satisfied for A

---

# STEP 4 — Test B as Major Clause

---

# 4.1 Ask Main Question

# “When can B control P?”

Predicate:

P = A \lor (B \land C)

---

# 4.2 Analyze First Problem

If:

```text id="s3"
A = TRUE
```

then:

TRUE \lor anything = TRUE

So:

* B becomes useless

❌ Cannot use A=T

Therefore:
✅ fix A=F

---

# 4.3 Analyze Second Problem

Need:

```text id="s4"
(B ∧ C)
```

to depend on B.

If:

```text id="s5"
C = FALSE
```

then:

B \land FALSE = FALSE

Again:

* B useless

❌ Cannot use C=F

Therefore:
✅ fix C=T

---

# 4.4 Simplify Predicate

Now substitute:

* A=F
* C=T

Predicate becomes:

P = FALSE \lor (B \land TRUE)

Simplifies:

P = B

Excellent.

Now B directly controls P.

---

# 4.5 Find Matching Rows

Need:

* A=F
* C=T

Rows:

| Case | A | B | C | P |
| ---- | - | - | - | - |
| 5    | F | T | T | T |
| 7    | F | F | T | F |

Observe:

* only B changes
* P changes

✅ Therefore:

# B determines P

✅ GACC satisfied for B

---

# STEP 5 — Test C as Major Clause

---

# 5.1 Ask Main Question

# “When can C control P?”

Predicate:

P = A \lor (B \land C)

---

# 5.2 First Problem

If:

```text id="s6"
A = TRUE
```

then:

* predicate always TRUE

❌ C useless

Therefore:
✅ fix A=F

---

# 5.3 Second Problem

Need:

```text id="s7"
(B ∧ C)
```

to depend on C.

If:

```text id="s8"
B = FALSE
```

then:

FALSE \land C = FALSE

C useless again.

❌ Cannot use B=F

Therefore:
✅ fix B=T

---

# 5.4 Simplify Predicate

Substitute:

* A=F
* B=T

Predicate becomes:

P = FALSE \lor (TRUE \land C)

Simplifies:

P = C

Excellent.

Now C controls predicate.

---

# 5.5 Find Matching Rows

Need:

* A=F
* B=T

Rows:

| Case | A | B | C | P |
| ---- | - | - | - | - |
| 5    | F | T | T | T |
| 6    | F | T | F | F |

Observe:

* only C changes
* P changes

✅ Therefore:

# C determines P

✅ GACC satisfied for C

---

# FINAL GACC TEST PAIRS

| Major Clause | Selected Cases |
| ------------ | -------------- |
| A            | 2 and 6        |
| B            | 5 and 7        |
| C            | 5 and 6        |

---

# FINAL UNIQUE TEST SET

| Test | A | B | C | P |
| ---- | - | - | - | - |
| T1   | T | T | F | T |
| T2   | F | T | F | F |
| T3   | F | T | T | T |
| T4   | F | F | T | F |

---

# THE SINGLE MOST IMPORTANT THING

You NEVER randomly choose rows.

You ALWAYS:

---

# 1. Pick major clause

Example:

```text id="s9"
B
```

---

# 2. Make predicate depend ONLY on that clause

Example:

P = B

by fixing others properly.

---

# 3. Then flip major clause

| B | P |
| - | - |
| T | T |
| F | F |

Done.

That is GACC.
