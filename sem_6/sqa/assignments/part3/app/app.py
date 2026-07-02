"""
Student Registration Portal — SUT (System Under Test)
CS Software Testing Lab — Black-Box Testing Assignment

This application is intentionally simplified so students can focus
on designing test cases rather than understanding complex business logic.
DO NOT read this file before completing your test design phase.
"""

from flask import Flask, render_template_string, request, jsonify

app = Flask(__name__)

HTML = """
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>University Course Registration</title>
  <style>
    body { font-family: Arial, sans-serif; max-width: 600px; margin: 60px auto; padding: 0 20px; color: #333; }
    h1 { font-size: 22px; color: #2c3e50; border-bottom: 2px solid #3498db; padding-bottom: 8px; }
    label { display: block; margin-top: 16px; font-size: 14px; font-weight: bold; }
    input, select { width: 100%; padding: 8px; margin-top: 4px; border: 1px solid #ccc;
                    border-radius: 4px; font-size: 14px; box-sizing: border-box; }
    button { margin-top: 24px; padding: 10px 28px; background: #3498db; color: white;
             border: none; border-radius: 4px; font-size: 15px; cursor: pointer; }
    button:hover { background: #2980b9; }
    #result { margin-top: 24px; padding: 14px; border-radius: 6px; font-size: 14px; display: none; }
    .success { background: #d4edda; color: #155724; border: 1px solid #c3e6cb; }
    .error   { background: #f8d7da; color: #721c24; border: 1px solid #f5c6cb; }
    .field-hint { font-size: 12px; color: #666; margin-top: 2px; }
  </style>
</head>
<body>
  <h1>Course Registration Form</h1>
  <p style="font-size:13px;color:#555;">Fill in all fields to register for a course unit.</p>

  <label for="student_id">Student ID</label>
  <input type="text" id="student_id" name="student_id" placeholder="e.g. S10001">
  <p class="field-hint">Format: S followed by 5 digits (S10000–S99999)</p>

  <label for="age">Age</label>
  <input type="number" id="age" name="age" placeholder="e.g. 20">
  <p class="field-hint">Must be between 17 and 60 (inclusive)</p>

  <label for="credit_hours">Credit Hours</label>
  <input type="number" id="credit_hours" name="credit_hours" placeholder="e.g. 15">
  <p class="field-hint">Must be between 1 and 24 (inclusive)</p>

  <label for="course_level">Course Level</label>
  <select id="course_level" name="course_level">
    <option value="">-- Select --</option>
    <option value="100">100-level (Introductory)</option>
    <option value="200">200-level (Intermediate)</option>
    <option value="300">300-level (Advanced)</option>
    <option value="400">400-level (Capstone)</option>
  </select>
  <p class="field-hint">400-level requires age ≥ 20 AND credit hours ≥ 90</p>

  <label for="gpa">GPA</label>
  <input type="number" id="gpa" name="gpa" step="0.01" placeholder="e.g. 3.50">
  <p class="field-hint">Must be between 0.00 and 4.00 (inclusive)</p>

  <button onclick="submitForm()">Register</button>

  <div id="result"></div>

  <script>
    async function submitForm() {
      const data = {
        student_id:   document.getElementById('student_id').value.trim(),
        age:          document.getElementById('age').value,
        credit_hours: document.getElementById('credit_hours').value,
        course_level: document.getElementById('course_level').value,
        gpa:          document.getElementById('gpa').value
      };
      const resp = await fetch('/register', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(data)
      });
      const result = await resp.json();
      const div = document.getElementById('result');
      div.style.display = 'block';
      div.className = result.success ? 'success' : 'error';
      div.textContent = result.message;
    }
  </script>
</body>
</html>
"""

@app.route('/')
def index():
    return render_template_string(HTML)


@app.route('/register', methods=['POST'])
def register():
    data = request.get_json()

    # --- Student ID validation ---
    sid = data.get('student_id', '')
    if not sid:
        return jsonify(success=False, message="Error: Student ID is required.")
    if not (sid.startswith('S') and len(sid) == 6 and sid[1:].isdigit()):
        return jsonify(success=False, message="Error: Student ID must be S followed by exactly 5 digits.")
    sid_num = int(sid[1:])
    if not (10000 <= sid_num <= 99999):
        return jsonify(success=False, message="Error: Student ID number must be between 10000 and 99999.")

    # --- Age validation ---
    try:
        age = int(data.get('age', ''))
    except (ValueError, TypeError):
        return jsonify(success=False, message="Error: Age must be a whole number.")
    if not (17 <= age <= 60):
        return jsonify(success=False, message="Error: Age must be between 17 and 60.")

    # --- Credit hours validation ---
    try:
        credits = int(data.get('credit_hours', ''))
    except (ValueError, TypeError):
        return jsonify(success=False, message="Error: Credit hours must be a whole number.")
    if not (1 <= credits <= 24):
        return jsonify(success=False, message="Error: Credit hours must be between 1 and 24.")

    # --- Course level validation ---
    level = data.get('course_level', '')
    if level not in ('100', '200', '300', '400'):
        return jsonify(success=False, message="Error: Please select a valid course level.")

    # --- GPA validation ---
    try:
        gpa = round(float(data.get('gpa', '')), 2)
    except (ValueError, TypeError):
        return jsonify(success=False, message="Error: GPA must be a number.")
    if not (0.00 <= gpa <= 4.00):
        return jsonify(success=False, message="Error: GPA must be between 0.00 and 4.00.")

    # --- Business rule: 400-level eligibility ---
    if level == '400' and not (age >= 20 and credits >= 90):
        return jsonify(success=False,
                       message="Error: 400-level courses require age ≥ 20 AND at least 90 credit hours.")

    return jsonify(success=True,
                   message=f"Success: {sid} registered for {level}-level course. "
                           f"({credits} credit hours | GPA {gpa:.2f})")


if __name__ == '__main__':
    app.run(debug=True, port=5000)
