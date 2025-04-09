# 🛡 CharityVault – Reentrancy Audit (by Aayush)

## 📄 About

This repo contains a security audit of the `CharityVault.sol` smart contract, which was found to be vulnerable to a classic **reentrancy attack**.

The exploit was verified using a custom attacker contract and a Foundry test case.

📄 [View Full Audit Report (PDF)](./%F0%9F%93%9DCharity%20Vault%20Audit%20Report.pdf)



---

## 🚨 Vulnerability Summary

- **Type:** Reentrancy
- **Location:** `withdrawDonations()` function
- **Impact:** Allows malicious contract to drain all donated ETH
- **Severity:** High

---

## 📂 Repo Contents

| File             | Purpose                                      |
|------------------|----------------------------------------------|
| `CharityVault.sol` | Vulnerable contract (audited target)        |
| `Attacker.sol`     | Malicious contract used to exploit vault    |
| `PoC.t.sol`        | Foundry test to simulate and verify exploit |
| `audit-report.pdf` | 📄 Full audit write-up with technical details |
| `README.md`        | This summary document                       |

---

## ✅ How to Run the PoC

1. Install Foundry (https://book.getfoundry.sh/)
2. Run the test:
```bash
forge test -m testReentrancyAttack
🧠 Notes from the Auditor
This audit is part of my personal journey toward mastering smart contract security auditing.
The PoC is intentionally minimal to simulate a real-world attacker, and the report outlines how the exploit works, step-by-step.

If you’d like to collaborate, provide feedback, or hire — feel free to reach out!

— Aayush 🛡️
