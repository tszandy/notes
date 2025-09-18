# 📧 Outlook Rules

This document contains a list of configured Outlook rules for email management and how to set them up.

---

## 🛠 How to Set Up Rules in Outlook

1. Open **Outlook**.
2. Go to **File** → **Manage Rules & Alerts**.
3. In the **Email Rules** tab, click **New Rule…**.
4. Choose a template (e.g., *Move messages from someone to a folder*) or start from a blank rule.
5. Click **Next**, then define:
   - **Conditions** (e.g., from a sender, subject contains keywords).
   - **Actions** (move, forward, delete, mark as important).
   - **Exceptions** (if any).
6. Name the rule and finish setup.
7. Make sure rules are enabled and ordered correctly (rules run from top to bottom).

---

## 📜 Rules

### 1. Move Newsletters to Folder
- **Condition:** If subject contains "newsletter"
- **Action:** Move to `Newsletters` folder
- **Exception:** None

---

### 2. Flag Important Client Emails
- **Condition:** From `client@company.com`
- **Action:** Mark as important, flag for follow-up
- **Exception:** None

---

### 3. Auto-Delete Spam
- **Condition:** Subject contains "Buy now" OR "Free gift"
- **Action:** Permanently delete
- **Exception:** None

---

### 4. Forward Team Reports
- **Condition:** From `reports@team.com`
- **Action:** Forward to `manager@company.com`
- **Exception:** If subject contains "Draft"

---

## Notes
- Last updated: 2025-09-08  
- Exported from Outlook → Manage Rules & Alerts
