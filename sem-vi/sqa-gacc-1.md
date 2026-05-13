# Predicate

```text id="p1"
P = A ∨ (B ∧ C)
```

Let:

```text id="p2"
X = (B ∧ C)
So P = A ∨ X
```

---

# Step 1: Build Full Truth Table

| Case | A | B | C | (B ∧ C) | P = A ∨ (B ∧ C) |
| ---- | - | - | - | ------- | --------------- |
| 1    | F | F | F | F       | F               |
| 2    | F | F | T | F       | F               |
| 3    | F | T | F | F       | F               |
| 4    | F | T | T | T       | T               |
| 5    | T | F | F | F       | T               |
| 6    | T | F | T | F       | T               |
| 7    | T | T | F | F       | T               |
| 8    | T | T | T | T       | T               |

---

# Now the IMPORTANT PART: What is GACC?

## GACC Rule (simple version)

For EACH clause:

> Show that flipping ONLY that clause can change the predicate outcome
> (minor clauses can be anything — no restriction)

So we do 3 separate checks:

* A as major clause
* B as major clause
* C as major clause

---

# Step 2: Test A as Major Clause

We must find two rows where:

* Only A changes
* P changes

Look at table:

### Pick:

| Case | A | B | C | P |
| ---- | - | - | - | - |
| 1    | F | F | F | F |
| 5    | T | F | F | T |

---

## Check condition:

* B = F, C = F (fixed)
* A changes F → T
* P changes F → T

✔ A determines P (GOOD)

---

# Step 3: Test B as Major Clause

Now we try to make B determine P.

We need:

* change B only
* P must change

Try fixing:

* A = F (so B matters more)
* C = T (so (B ∧ C) depends on B)

---

### Pick rows:

| Case | A | B | C | (B ∧ C) | P |
| ---- | - | - | - | ------- | - |
| 2    | F | F | T | F       | F |
| 4    | F | T | T | T       | T |

---

## Check:

* A fixed = F
* C fixed = T
* B changes F → T
* P changes F → T

✔ B determines P

---

# Step 4: Test C as Major Clause

Now we test C.

We need:

* change C only
* P must change

Fix:

* A = F
* B = T (so B ∧ C depends on C)

---

### Pick rows:

| Case | A | B | C | (B ∧ C) | P |
| ---- | - | - | - | ------- | - |
| 3    | F | T | F | F       | F |
| 4    | F | T | T | T       | T |

---

## Check:

* A fixed = F
* B fixed = T
* C changes F → T
* P changes F → T

✔ C determines P

---

# FINAL GACC TEST SET

We collect unique test cases:

| Test | A | B | C | P |
| ---- | - | - | - | - |
| T1   | F | F | F | F |
| T2   | T | F | F | T |
| T3   | F | F | T | F |
| T4   | F | T | T | T |

---

# Now the MOST IMPORTANT PART:

# How do you actually DO GACC in exams?

Here is your mental algorithm.

---

# GACC PROCEDURE (USE THIS EVERY TIME)

---

## STEP 1: Identify clauses

For:

```text id="g1"
P = A ∨ (B ∧ C)
```

Clauses:

* A
* B
* C

---

## STEP 2: Pick one clause (major clause)

Example: A

---

## STEP 3: Ask this question:

> When does A actually affect output?

For OR:

* A matters when (B ∧ C) = FALSE

So fix:

```text id="g2"
B = F, C = F
```

---

## STEP 4: Flip only A

| A | P |
| - | - |
| F | F |
| T | T |

✔ Done

---

## STEP 5: Repeat for B and C

For B:

* fix A = F
* fix C = T (so B matters)

For C:

* fix A = F
* fix B = T

---

# GOLDEN INSIGHT (THIS IS WHAT YOU WERE MISSING)

You don’t randomly pick test cases.

You ALWAYS do:

## “Make other clauses neutral so the chosen clause can control output”

---

# OR logic trick (VERY IMPORTANT)

For:

```text id="g3"
A ∨ (B ∧ C)
```

To make A matter:

* make (B ∧ C) = FALSE

To make B matter:

* make A = FALSE and C = TRUE

To make C matter:

* make A = FALSE and B = TRUE

---

# FINAL ONE-LINE MEMORY TRICK

## GACC means:

> “For each clause, freeze others in a way that allows it to control the predicate, then flip it and see output change.”

