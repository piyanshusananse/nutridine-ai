# 🥗 NutriDine AI — Personalized Restaurant Food Recommendation Platform

> **"Know what to order. Eat for your goals."**  
> AI-powered restaurant menu recommendations personalized to your body, lifestyle, allergies, and fitness targets.

---

## 🌟 Overview & Core Value Proposition

NutriDine AI solves the dining-out dilemma by evaluating every dish on a restaurant's **real menu** against an individual's personal physiological metrics, dietary lifestyles, and allergen restrictions.

### The Core Principle:
$$\text{Same Restaurant} + \text{Different Person} = \text{Different Recommendations}$$

- **Alex (28M, Weight Loss, Moderate Activity)** $\rightarrow$ Recommends high-protein, calorie-deficit-friendly dishes like *Tandoori Chicken Tikka (95% Match, 380 kcal, 48g Protein)*.
- **Priya (26F, Vegetarian, Muscle Gain, Peanut Allergy)** $\rightarrow$ Strictly excludes meat and tree nuts, prioritizing *Tandoori Paneer Tikka (92% Match)* and *Dal Tadka*.
- **Marcus (32M, Pescatarian, Gluten-Free, Very Active)** $\rightarrow$ Strictly excludes gluten, highlighting *Wild Salmon Super-Quinoa Bowl (98% Match)*.

---

## 🏗️ Architecture & Tech Stack

- **Frontend**: Next.js 16 (App Router), React 19, TypeScript (Strict Mode), Tailwind CSS v4, Lucide Icons
- **Visualization**: Recharts (Macro distribution, comparative bar charts, calorie & weight trend area charts)
- **Database & ORM**: Prisma ORM with SQLite for zero-setup local execution (PostgreSQL compatible)
- **Deterministic Calculation Engine**:
  - `lib/engine/bmr-tdee.ts`: Mifflin-St Jeor equation BMR, activity multipliers, goal adjustments, and macro target ranges
  - `lib/engine/bmi.ts`: WHO standard BMI with non-diagnostic wellness disclaimers
  - `lib/engine/hard-constraints.ts`: Hard allergen exclusions (Peanuts, Tree nuts, Dairy, Eggs, Soy, Gluten, Shellfish, Fish, Sesame) & strict dietary filters (Vegan, Vegetarian, Jain, Halal, Pescatarian, Low-Carb)
  - `lib/engine/scoring.ts`: Transparent 0–100 weighted recommendation score
  - `lib/engine/smart-swaps.ts`: Menu-aware same-restaurant alternative finder & actionable "Make It Better" tips
  - `lib/engine/meal-builder.ts`: Multi-course meal combination solver
- **AI & NLP Layer**:
  - `lib/ai/chat.ts`: Conversational menu assistant strictly grounded in real restaurant dishes
  - `lib/ai/estimate-nutrition.ts`: Ingredient-based nutrition estimator with clear *"AI Estimated Nutrition"* badges

---

## 🚀 Quick Start & Local Setup

### 1. Prerequisites
- Node.js 18+ installed

### 2. Installation
```bash
# Navigate to project directory
cd nutridine-ai

# Install dependencies (already installed)
npm install
```

### 3. Initialize & Seed Database
```bash
# Push Prisma schema to SQLite
npx prisma db push

# Seed demo restaurants, menus, and user personas
npx tsx prisma/seed.ts
```

### 4. Run Automated Tests
```bash
npx tsx tests/engine.test.ts
```

### 5. Start Development Server
```bash
npm run dev
```
Open [http://localhost:3000](http://localhost:3000) in your browser.

---

## 📊 Score Breakdown Formula (0–100)

| Factor | Weight | Evaluation Method |
|---|---|---|
| **Goal Alignment** | **30 pts** | Satiety density for Weight Loss; absolute protein for Muscle Gain; complex carbs for Energy |
| **Protein Fit** | **20 pts** | Target protein per meal (~30% of daily requirement) |
| **Calorie Fit** | **20 pts** | Fit relative to single meal budget (~35% of daily target) |
| **Dietary & Taste Fit** | **20 pts** | Preparation method (Grilled/Tandoori bonus vs Fried), spicy tolerance match |
| **Nutritional Quality** | **10 pts** | High dietary fiber (>=5g), low sodium (<600mg), low added sugar (<6g) |

*Safety Rule: If a dish contains an allergen or violates strict vegetarian/vegan preferences, score is immediately 0 / Excluded.*

---

## 🧭 Page Routes & Features

- `/` — Marketing Homepage with interactive live persona demo & restaurant discovery
- `/onboarding` — 4-Step interactive wellness onboarding wizard with live BMI & BMR preview
- `/restaurants` — Filter and browse restaurant partners
- `/restaurants/[id]` — Interactive restaurant menu with live personalized ranking tabs, score rings, "Why?" explainability modal, and floating AI chatbot
- `/compare` — 3-Way side-by-side dish comparison tool with Recharts macro charts & AI verdict
- `/meal-builder` — Intelligent multi-course meal combination generator
- `/dashboard` — Daily wellness snapshot, top recommended dishes, and logging progress charts
- `/restaurant-admin` — Portal for restaurant owners with dish CRUD, AI Nutrition Estimator, and CSV/JSON import
- `/admin` — Super Admin portal with platform stats, audit logs, and scoring weight controls
- `/profile` — Personal profile editor with 1-click demo persona switcher

---

## 🧪 Testing

Run the automated engine test suite:
```bash
npx tsx tests/engine.test.ts
```
Verifies BMI, Mifflin-St Jeor BMR, TDEE, Allergen exclusions, multi-persona differential scoring, smart swaps, and meal builder combinations.
