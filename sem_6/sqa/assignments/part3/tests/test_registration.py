"""
=============================================================
  CS Software Testing Lab — Black-Box Testing Assignment
  Playwright Test Starter File
  
  Instructions:
  1. Read the assignment handout COMPLETELY before touching this file.
  2. Complete Phases 1-3 (paper-based analysis) before writing any code.
  3. Test cases have been completed from the paper-based analysis.
  4. Run: pytest tests/ -v --html=report.html
=============================================================
"""

from playwright.sync_api import Page

BASE_URL = "http://localhost:5000"

# ---------------------------------------------------------------------------
# Helpers — reusable functions so you don't repeat UI interactions
# ---------------------------------------------------------------------------

def fill_form(page: Page, student_id="", age="", credit_hours="",
              course_level="", gpa=""):
    """Fill every field. Pass empty string to leave a field blank."""
    page.goto(BASE_URL)
    if student_id:
        page.fill("#student_id", student_id)
    if age:
        page.fill("#age", str(age))
    if credit_hours:
        page.fill("#credit_hours", str(credit_hours))
    if course_level:
        page.select_option("#course_level", course_level)
    if gpa:
        page.fill("#gpa", str(gpa))


def submit_and_get_result(page: Page) -> tuple[str, bool]:
    """Click Register and return (message_text, is_success)."""
    page.click("button:has-text('Register')")
    result = page.locator("#result")
    result.wait_for(state="visible", timeout=5000)
    text = result.inner_text()
    is_success = "success" in result.get_attribute("class")
    return text, is_success


# ===========================================================================
# SECTION A — Equivalence Partitioning Tests
# ---------------------------------------------------------------------------
# For each field identify: valid classes, invalid classes (below/above range,
# wrong type/format). Write ONE representative test per class.
# ===========================================================================

class TestEquivalencePartitioning:

    # --- Student ID ---

    def test_ep_student_id_valid(self, page: Page):
        """EP: valid student ID — expect success"""
        fill_form(page, student_id="S12345", age="20", credit_hours="15",
                  course_level="200", gpa="3.00")
        msg, ok = submit_and_get_result(page)
        assert ok, f"Expected success but got: {msg}"

    def test_ep_student_id_missing_s_prefix(self, page: Page):
        """EP: student ID without S prefix — expect error"""
        fill_form(page, student_id="123456", age="20", credit_hours="15",
                  course_level="200", gpa="3.00")
        msg, ok = submit_and_get_result(page)
        assert not ok, f"Expected failure but got: {msg}"

    def test_ep_student_id_letters_in_digits(self, page: Page):
        """EP: student ID has letters after S prefix - expect error"""
        fill_form(page, student_id="S12A45", age="20", credit_hours="15",
                  course_level="200", gpa="3.00")
        msg, ok = submit_and_get_result(page)
        assert not ok, f"Expected failure but got: {msg}"

    def test_ep_student_id_number_too_low(self, page: Page):
        """EP: student ID number below 10000 - expect error"""
        fill_form(page, student_id="S09999", age="20", credit_hours="15",
                  course_level="200", gpa="3.00")
        msg, ok = submit_and_get_result(page)
        assert not ok, f"Expected failure but got: {msg}"

    # --- Age ---

    def test_ep_age_valid(self, page: Page):
        """EP: age in valid range — expect success"""
        fill_form(page, student_id="S12401", age="25", credit_hours="15",
                  course_level="200", gpa="3.00")
        msg, ok = submit_and_get_result(page)
        assert ok, f"Expected success but got: {msg}"

    def test_ep_age_below_minimum(self, page: Page):
        """EP: age below 17 — expect error"""
        fill_form(page, student_id="S12402", age="10", credit_hours="15",
                  course_level="200", gpa="3.00")
        msg, ok = submit_and_get_result(page)
        assert not ok, f"Expected failure but got: {msg}"

    def test_ep_age_above_maximum(self, page: Page):
        """EP: age above 60 — expect error"""
        fill_form(page, student_id="S12403", age="70", credit_hours="15",
                  course_level="200", gpa="3.00")
        msg, ok = submit_and_get_result(page)
        assert not ok, f"Expected failure but got: {msg}"

    def test_ep_age_non_numeric(self, page: Page):
        """EP: age is not a whole number - expect error"""
        fill_form(page, student_id="S12404", age="20.5", credit_hours="15",
                  course_level="200", gpa="3.00")
        msg, ok = submit_and_get_result(page)
        assert not ok, f"Expected failure but got: {msg}"

    # --- Credit Hours ---

    def test_ep_credit_hours_valid(self, page: Page):
        """EP: credit hours in valid range"""
        fill_form(page, student_id="S12501", age="20", credit_hours="15",
                  course_level="200", gpa="3.00")
        msg, ok = submit_and_get_result(page)
        assert ok, f"Expected success but got: {msg}"

    def test_ep_credit_hours_zero(self, page: Page):
        """EP: zero credit hours (below minimum of 1) — expect error"""
        fill_form(page, student_id="S12502", age="20", credit_hours="0",
                  course_level="200", gpa="3.00")
        msg, ok = submit_and_get_result(page)
        assert not ok, f"Expected failure but got: {msg}"

    def test_ep_credit_hours_above_max(self, page: Page):
        """EP: credit hours above 24 — expect error"""
        fill_form(page, student_id="S12503", age="20", credit_hours="25",
                  course_level="200", gpa="3.00")
        msg, ok = submit_and_get_result(page)
        assert not ok, f"Expected failure but got: {msg}"

    # --- GPA ---

    def test_ep_gpa_valid_mid_range(self, page: Page):
        """EP: GPA in valid range"""
        fill_form(page, student_id="S12601", age="20", credit_hours="15",
                  course_level="200", gpa="3.00")
        msg, ok = submit_and_get_result(page)
        assert ok, f"Expected success but got: {msg}"

    def test_ep_gpa_negative(self, page: Page):
        """EP: negative GPA — expect error"""
        fill_form(page, student_id="S12602", age="20", credit_hours="15",
                  course_level="200", gpa="-0.50")
        msg, ok = submit_and_get_result(page)
        assert not ok, f"Expected failure but got: {msg}"

    def test_ep_gpa_above_4(self, page: Page):
        """EP: GPA above 4.00 — expect error"""
        fill_form(page, student_id="S12603", age="20", credit_hours="15",
                  course_level="200", gpa="4.50")
        msg, ok = submit_and_get_result(page)
        assert not ok, f"Expected failure but got: {msg}"

    # --- Course Level ---

    def test_ep_course_level_not_selected(self, page: Page):
        """EP: no course level chosen — expect error"""
        fill_form(page, student_id="S12345", age="20", credit_hours="15",
                  course_level="", gpa="3.00")
        msg, ok = submit_and_get_result(page)
        assert not ok


# ===========================================================================
# SECTION B — Boundary Value Analysis Tests
# ---------------------------------------------------------------------------
# For every numeric boundary test: min-1, min, min+1, max-1, max, max+1
# ===========================================================================

class TestBoundaryValueAnalysis:

    # --- Age boundaries (valid: 17–60) ---

    def test_bva_age_16(self, page: Page):
        """BVA: age = 16 (just below min) — expect error"""
        fill_form(page, student_id="S20001", age=16, credit_hours=12,
                  course_level="200", gpa="2.50")
        msg, ok = submit_and_get_result(page)
        assert not ok, f"Expected failure at boundary but got: {msg}"

    def test_bva_age_17(self, page: Page):
        """BVA: age = 17 (exact min) — expect success"""
        fill_form(page, student_id="S20002", age=17, credit_hours=12,
                  course_level="200", gpa="2.50")
        msg, ok = submit_and_get_result(page)
        assert ok, f"Expected success at boundary but got: {msg}"

    def test_bva_age_18(self, page: Page):
        """BVA: age = 18 (just above min) — expect success"""
        fill_form(page, student_id="S20003", age=18, credit_hours=12,
                  course_level="200", gpa="2.50")
        msg, ok = submit_and_get_result(page)
        assert ok, f"Expected success at boundary but got: {msg}"

    def test_bva_age_59(self, page: Page):
        """BVA: age = 59 (just below max) — expect success"""
        fill_form(page, student_id="S20004", age=59, credit_hours=12,
                  course_level="200", gpa="2.50")
        msg, ok = submit_and_get_result(page)
        assert ok, f"Expected success at boundary but got: {msg}"

    def test_bva_age_60(self, page: Page):
        """BVA: age = 60 (exact max) — expect success"""
        fill_form(page, student_id="S20005", age=60, credit_hours=12,
                  course_level="200", gpa="2.50")
        msg, ok = submit_and_get_result(page)
        assert ok, f"Expected success at boundary but got: {msg}"

    def test_bva_age_61(self, page: Page):
        """BVA: age = 61 (just above max) — expect error"""
        fill_form(page, student_id="S20006", age=61, credit_hours=12,
                  course_level="200", gpa="2.50")
        msg, ok = submit_and_get_result(page)
        assert not ok, f"Expected failure at boundary but got: {msg}"

    # --- Credit hours boundaries (valid: 1–24) ---

    def test_bva_credits_0(self, page: Page):
        """BVA: 0 credit hours (below min) — expect error"""
        fill_form(page, student_id="S20101", age=25, credit_hours="0",
                  course_level="200", gpa="2.50")
        msg, ok = submit_and_get_result(page)
        assert not ok, f"Expected failure at boundary but got: {msg}"

    def test_bva_credits_1(self, page: Page):
        """BVA: 1 credit hour (exact min) — expect success"""
        fill_form(page, student_id="S20102", age=25, credit_hours=1,
                  course_level="200", gpa="2.50")
        msg, ok = submit_and_get_result(page)
        assert ok, f"Expected success at boundary but got: {msg}"

    def test_bva_credits_2(self, page: Page):
        """BVA: 2 credit hours (just above min) — expect success"""
        fill_form(page, student_id="S20103", age=25, credit_hours=2,
                  course_level="200", gpa="2.50")
        msg, ok = submit_and_get_result(page)
        assert ok, f"Expected success at boundary but got: {msg}"

    def test_bva_credits_23(self, page: Page):
        """BVA: 23 credit hours (just below max) — expect success"""
        fill_form(page, student_id="S20104", age=25, credit_hours=23,
                  course_level="200", gpa="2.50")
        msg, ok = submit_and_get_result(page)
        assert ok, f"Expected success at boundary but got: {msg}"

    def test_bva_credits_24(self, page: Page):
        """BVA: 24 credit hours (exact max) — expect success"""
        fill_form(page, student_id="S20105", age=25, credit_hours=24,
                  course_level="200", gpa="2.50")
        msg, ok = submit_and_get_result(page)
        assert ok, f"Expected success at boundary but got: {msg}"

    def test_bva_credits_25(self, page: Page):
        """BVA: 25 credit hours (above max) — expect error"""
        fill_form(page, student_id="S20106", age=25, credit_hours=25,
                  course_level="200", gpa="2.50")
        msg, ok = submit_and_get_result(page)
        assert not ok, f"Expected failure at boundary but got: {msg}"

    # --- GPA boundaries (valid: 0.00–4.00) ---

    def test_bva_gpa_minus_0_01(self, page: Page):
        """BVA: GPA = -0.01 (just below min) — expect error"""
        fill_form(page, student_id="S20201", age=25, credit_hours=12,
                  course_level="200", gpa="-0.01")
        msg, ok = submit_and_get_result(page)
        assert not ok, f"Expected failure at boundary but got: {msg}"

    def test_bva_gpa_0_00(self, page: Page):
        """BVA: GPA = 0.00 (exact min) — expect success"""
        fill_form(page, student_id="S20202", age=25, credit_hours=12,
                  course_level="200", gpa="0.00")
        msg, ok = submit_and_get_result(page)
        assert ok, f"Expected success at boundary but got: {msg}"

    def test_bva_gpa_0_01(self, page: Page):
        """BVA: GPA = 0.01 (just above min) - expect success"""
        fill_form(page, student_id="S20203", age=25, credit_hours=12,
                  course_level="200", gpa="0.01")
        msg, ok = submit_and_get_result(page)
        assert ok, f"Expected success at boundary but got: {msg}"

    def test_bva_gpa_3_99(self, page: Page):
        """BVA: GPA = 3.99 (just below max) - expect success"""
        fill_form(page, student_id="S20204", age=25, credit_hours=12,
                  course_level="200", gpa="3.99")
        msg, ok = submit_and_get_result(page)
        assert ok, f"Expected success at boundary but got: {msg}"

    def test_bva_gpa_4_00(self, page: Page):
        """BVA: GPA = 4.00 (exact max) — expect success"""
        fill_form(page, student_id="S20205", age=25, credit_hours=12,
                  course_level="200", gpa="4.00")
        msg, ok = submit_and_get_result(page)
        assert ok, f"Expected success at boundary but got: {msg}"

    def test_bva_gpa_4_01(self, page: Page):
        """BVA: GPA = 4.01 (just above max) — expect error"""
        fill_form(page, student_id="S20206", age=25, credit_hours=12,
                  course_level="200", gpa="4.01")
        msg, ok = submit_and_get_result(page)
        assert not ok, f"Expected failure at boundary but got: {msg}"

    # --- Student ID number boundaries (valid: 10000–99999) ---

    def test_bva_sid_9999(self, page: Page):
        """BVA: S09999 (number below min) — expect error"""
        fill_form(page, student_id="S09999", age=25, credit_hours=12,
                  course_level="200", gpa="2.50")
        msg, ok = submit_and_get_result(page)
        assert not ok, f"Expected failure at boundary but got: {msg}"

    def test_bva_sid_10000(self, page: Page):
        """BVA: S10000 (exact min) — expect success"""
        fill_form(page, student_id="S10000", age=25, credit_hours=12,
                  course_level="200", gpa="2.50")
        msg, ok = submit_and_get_result(page)
        assert ok, f"Expected success at boundary but got: {msg}"

    def test_bva_sid_10001(self, page: Page):
        """BVA: S10001 (just above min) - expect success"""
        fill_form(page, student_id="S10001", age=25, credit_hours=12,
                  course_level="200", gpa="2.50")
        msg, ok = submit_and_get_result(page)
        assert ok, f"Expected success at boundary but got: {msg}"

    def test_bva_sid_99998(self, page: Page):
        """BVA: S99998 (just below max) - expect success"""
        fill_form(page, student_id="S99998", age=25, credit_hours=12,
                  course_level="200", gpa="2.50")
        msg, ok = submit_and_get_result(page)
        assert ok, f"Expected success at boundary but got: {msg}"

    def test_bva_sid_99999(self, page: Page):
        """BVA: S99999 (exact max) — expect success"""
        fill_form(page, student_id="S99999", age=25, credit_hours=12,
                  course_level="200", gpa="2.50")
        msg, ok = submit_and_get_result(page)
        assert ok, f"Expected success at boundary but got: {msg}"


# ===========================================================================
# SECTION C — Cause-Effect Graph / Decision Table Tests
# ---------------------------------------------------------------------------
# The 400-level business rule combines TWO conditions:
#   C1: age >= 20
#   C2: credit_hours >= 90
#   Effect E1: allowed to register for 400-level
#
# Build a decision table with all 4 combinations (T/T, T/F, F/T, F/F)
# and write one Playwright test for each row.
#
# For 100/200/300-level, the conditions do NOT apply.
# ===========================================================================

class TestCauseEffectGraph:

    def test_ce_400_age_ok_credits_ok_rejected_by_field_range(self, page: Page):
        """CE Row 1: business rule is satisfied, but field range rejects credits"""
        fill_form(page, student_id="S30001", age=22, credit_hours=95,
                  course_level="400", gpa="3.00")
        msg, ok = submit_and_get_result(page)
        assert not ok, f"Expected field-range failure: {msg}"
        assert "credit" in msg.lower() or "24" in msg

    def test_ce_400_age_ok_credits_fail(self, page: Page):
        """CE Row 2: C1=True, C2=False → registration denied"""
        fill_form(page, student_id="S30002", age=22, credit_hours=60,
                  course_level="400", gpa="3.00")
        msg, ok = submit_and_get_result(page)
        assert not ok, f"Expected failure: {msg}"
        assert "90" in msg or "credit" in msg.lower()

    def test_ce_400_age_fail_credits_ok(self, page: Page):
        """CE Row 3: C1=False, C2=True → registration denied"""
        fill_form(page, student_id="S30003", age=19, credit_hours=95,
                  course_level="400", gpa="3.00")
        msg, ok = submit_and_get_result(page)
        assert not ok, f"Expected failure: {msg}"
        assert "credit" in msg.lower() or "age" in msg.lower()

    def test_ce_400_age_fail_credits_fail(self, page: Page):
        """CE Row 4: C1=False, C2=False → registration denied"""
        fill_form(page, student_id="S30004", age=19, credit_hours=24,
                  course_level="400", gpa="3.00")
        msg, ok = submit_and_get_result(page)
        assert not ok, f"Expected failure: {msg}"
        assert "400" in msg or "age" in msg.lower() or "credit" in msg.lower()

    def test_ce_300_no_extra_rule_applies(self, page: Page):
        """CE: 300-level with any age/credits — only field validation matters"""
        fill_form(page, student_id="S30005", age=18, credit_hours=5,
                  course_level="300", gpa="2.10")
        msg, ok = submit_and_get_result(page)
        assert ok, f"300-level should not require 400-level conditions: {msg}"

    # CHALLENGE (optional): What happens when ALL fields are simultaneously
    # at their boundary values? Design a test that combines min/max values
    # across multiple fields in a single registration attempt.
    # def test_ce_all_boundaries_simultaneously(self, page: Page):
    #     ...


# ===========================================================================
# SECTION D — Error Message Quality Tests (bonus)
# ---------------------------------------------------------------------------
# Good software provides informative error messages. Verify that error
# messages reference the correct field and give meaningful guidance.
# ===========================================================================

class TestErrorMessageQuality:

    def test_error_mentions_student_id_field(self, page: Page):
        """Error for bad student ID should mention 'Student ID'"""
        fill_form(page, student_id="BADID", age="20", credit_hours="15",
                  course_level="200", gpa="3.00")
        msg, ok = submit_and_get_result(page)
        assert not ok
        assert "student id" in msg.lower() or "id" in msg.lower(), \
            f"Error message does not mention the Student ID field: '{msg}'"

    def test_error_mentions_age_field(self, page: Page):
        """Error for out-of-range age should mention 'age'"""
        fill_form(page, student_id="S55551", age="70", credit_hours="15",
                  course_level="200", gpa="3.00")
        msg, ok = submit_and_get_result(page)
        assert not ok
        assert "age" in msg.lower(), \
            f"Error message does not mention the Age field: '{msg}'"

    def test_error_mentions_credit_hours(self, page: Page):
        """Error for out-of-range credits should mention 'credit'"""
        fill_form(page, student_id="S55552", age="20", credit_hours="25",
                  course_level="200", gpa="3.00")
        msg, ok = submit_and_get_result(page)
        assert not ok
        assert "credit" in msg.lower(), \
            f"Error message does not mention the Credit Hours field: '{msg}'"

    def test_success_message_echoes_student_id(self, page: Page):
        """Success message should include the student's ID"""
        fill_form(page, student_id="S55555", age="21", credit_hours="18",
                  course_level="200", gpa="3.50")
        msg, ok = submit_and_get_result(page)
        assert ok
        assert "S55555" in msg, f"Student ID not echoed in success message: '{msg}'"
