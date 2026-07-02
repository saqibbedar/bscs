"""
Playwright + pytest configuration.
This file is loaded automatically by pytest — do not rename it.
"""

import pytest
from playwright.sync_api import sync_playwright


@pytest.fixture(scope="session")
def browser_instance():
    with sync_playwright() as p:
        browser = p.chromium.launch(headless=False)   # set headless=True for CI
        yield browser
        browser.close()


@pytest.fixture()
def page(browser_instance):
    context = browser_instance.new_context()
    page = context.new_page()
    yield page
    context.close()
