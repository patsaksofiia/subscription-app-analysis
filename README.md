# Subscription Funnel & Unit Economics Analysis

End-to-end analysis of a subscription-based mobile app for learning English: where users drop off, which channels and markets pay back, and what to do about it.


**Markets:** 6 countries (US, DE, UK, BR, MX, PL), launched in stages since February 2024

## 🎯 Business Context

Users download the app, sign up, optionally start a free trial, make a first payment, renew, sometimes upgrade to a higher plan, and occasionally request a refund. The product launched in new countries step by step: US only until May 2024, then Germany and the UK, then Brazil, Mexico and Poland in August 2024.

Management has two concerns at once:

1. Part of the users complete the trial but never make a first payment.
2. It is unclear which acquisition channels actually pay back and which just burn budget.

## ❓ Goals

As the analyst, the task was to run a full subscription-funnel and unit-economics analysis and answer:

- Where exactly do users drop off?
- Which cohorts and channels are the most valuable?
- How much does acquisition cost (CAC) compared with what a user brings in (LTV)?
- What concrete actions will grow revenue, retention and marketing efficiency?

## 🗂️ Data Model

Dataset `streamflow` (MySQL):

| Table | Purpose |
|---|---|
| `users` | Sign-ups: user, sign-up date, country, platform, acquisition channel |
| `transactions` | `sign_up`/`trial_start`/`first_payment`/`renewal`/`upgrade`/`refund` events with `amount_usd`, `plan_id`, `date` |
| `subscription_plans` | Plan name, duration (days), list price |
| `marketing_spend` | Marketing spend (USD) by country |

## 🛠️ Tech Stack
- **SQL (MySQL)**: funnel, cohorts, LTV, CAC, segmentation
- **Google Sheets**: data checks, calculations, cohort tables
- **Tableau**: dashboards and visualizations

## ✅ Conclusions

1. The biggest loss happens at **trial → paid (36%)**, especially in Mexico (52.7%) and Brazil (55.9%). The second is at renewal (30.7%).
2. The most valuable channels by quality are **Influencer** and **Referral**.
3. The most valuable market by unit economics is **Brazil**, although the **US** generates the highest absolute profit.
4. Black Friday boosts sales but attracts low-engagement Annual/Lifetime buyers, so coverage-based retention overstates product stickiness.

## 🚀 Recommendations

1. **Increase marketing budget in Brazil:** best LTV/CAC, with room to grow even if CAC rises.
2. **Rebalance Brazil's channel mix** toward Google Ads and Apple Search Ads (higher revenue per user).
3. **Investigate low trial → paid conversion in MX/BR:** price, payment methods, platform mix (Android dominates).
4. **Use Influencer/Referral as a quality benchmark** when planning and evaluating new acquisition channels.
5. **Evaluate Black Friday by transaction-based retention**, not just coverage, before repeating or scaling it.



