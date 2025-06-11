# 🌱 Mood Sync – Emotional Intelligence App

> A mobile-first app to help users build emotional intelligence by identifying, learning, and reflecting on their emotions through AI-assisted journaling and exploration.

---

## 📘 Table of Contents

- [Overview](#overview)
- [Core Features](#core-features)
- [User Flow](#user-flow)
- [Design Philosophy](#design-philosophy)
- [Color &amp; Theme System](#color--theme-system)
- [Technical Stack](#technical-stack)
- [Project Structure](#project-structure)
- [Coding Guidelines](#coding-guidelines)
- [Next Steps &amp; TODOs](#next-steps--todos)

---

## 🧠 Overview

**Mood Sync** is an app that helps users deepen their emotional intelligence by:

- Providing a private, AI-assisted reflection space.
- Identifying nuanced emotional states using language-based journaling.
- Teaching users to expand their emotional vocabulary.
- Visualizing patterns over time to promote self-awareness.

This is **not** a to-do list or productivity tool. It is a space for **reflection, learning, and emotional clarity**.

---

## 🌟 Core Features

### 1. **AI-Powered Emotional Reflection**

- Users write or speak to describe their current experience or emotional state.
- The AI returns:
  - Primary emotion (dominant).
  - Secondary emotions (only if clearly distinct and present, max 3).
  - Definitions, triggers, and emotional context.
  - Related emotions (for expanding vocabulary).
  - Self-awareness insights or reflection prompts.
  - Tags are required for all entries (location, action, people, time, etc.)
  - Voice input includes voice-to-text and saves original audio.

### 1A. **Visual Emotion Picker (Manual Check-In)**

- For users who want a fast, low-effort alternative to journaling.
- Presents a visual interface of emotion icons or a quadrant-style grid (inspired by "How We Feel").
- User taps on an emotion to select it.
- Optional intensity slider (e.g., 1–5) for nuance.
- No AI processing involved — this is direct user-selected data.
- Tags (location, people, activity, time, etc.) can be added.
- Ideal for mobile, daily usage without the need to type or speak.

### 2. **Emotion Library**

- Structured around an extended version of **Plutchik’s Wheel** with additional modern/nuanced emotions.
- Each entry includes:
  - Description and definition.
  - Common triggers.
  - Associated body sensations.
  - Tips for awareness and coping.
- Emotions can be browsed alphabetically, categorically, and by those the user has experienced.

### 3. **Growth Journey**

- Visual map of emotions the user has discovered or confirmed.
- Tracks vocabulary expansion, streaks, and journal frequency.
- Unlocks new content as the user explores more emotions.

### 4. **Trends & Insights**

- Shows recurring emotions, emotional diversity, and emotional intensity over time.
- Tags are attached to all emotion entries (location, action, people, time, etc.)
- Highlights reflection patterns and suggests follow-up questions.

### 5. **User Modes**

- **Signed-in:** Cloud sync, cross-device backup.
- **Local mode:** No login needed. Data stays on device. Privacy-first approach.

---

## 🛍️ User Flow

### Onboarding

1. Welcome screen explaining purpose.
2. Option to sign in or continue in local mode.
3. Set check-in reminder preferences (optional).
4. Choose dark/light theme (default: dark).

### Daily Use

1. Open the app → Tap **"Reflect Now"**.
2. Choose input method:
   - Type journal
   - Speak (voice to text + audio saved)
   - Visual emotion picker (for fast, low-effort logging)
3. Receive AI-powered emotion analysis (with up to 3 emotions if clearly distinct).
4. Confirm/edit result, save to journal with tags.
5. View suggested emotions or learn more via the Library.

### Periodic Use

- Explore Emotion Library.
- Review personal Growth Journey.
- Check Trends & Insights.

---

## 🎨 Design Philosophy

### Tone & UX

- Calm, supportive, and emotionally validating.
- No scoring, ratings, or judgment.
- Space to reflect — not perform.

### Visual Style

- **Dark Mode First**: Minimal, cozy UI.
- Abstract icons, subtle animations.
- Spacious layouts that feel breathable.

---

## 🎨 Color & Theme System

### 🌙 Mood Sync – Dark Theme with Neon Accent Style

#### Base Palette

| Role            | Hex Code    | Notes                         |
| --------------- | ----------- | ----------------------------- |
| Background      | `#121212` | Deep neutral base             |
| Surface         | `#1C1C1E` | Cards, panels, overlays       |
| Text Primary    | `#FAFAFA` | Crisp white text              |
| Text Secondary  | `#A1A1AA` | For descriptions and metadata |
| Divider/Borders | `#2C2C2E` | Soft, subtle lines            |

#### 🌈 Core Accent Styling – Neon Vibe

| Accent        | Hex Code    | Description                       |
| ------------- | ----------- | --------------------------------- |
| Neon Purple   | `#BB86FC` | Main brand accent, buttons, icons |
| Neon Yellow   | `#FCE83A` | Highlights, focus rings           |
| Neon Pink     | `#FF85B3` | Secondary CTA, friendly touches   |
| Electric Blue | `#56CFFF` | Navigation, interactive hovers    |
| Signal Green  | `#6CF4A1` | Confirm states, small indicators  |

#### 💡 Use Suggestions

- Use **Neon Purple** as your identity color — e.g., floating action button, onboarding highlights.
- **Neon Yellow** or **Electric Blue** can accentuate active tabs, sliders, or daily mood graph highlights.
- **Neon Pink** and **Signal Green** are optional mood lifts — subtle shadows, micro-interactions, hover states.
- Dark grey surfaces keep focus on content while letting your neons glow off them naturally.

---

## ⚙️ Technical Stack

| Part            | Tool / Tech                                                   |
| --------------- | ------------------------------------------------------------- |
| Frontend        | Flutter                                                       |
| State Mgmt      | Riverpod or Provider (TBD)                                    |
| Backend         | Firebase (Firestore preferred)                                |
| Offline Support | Built-in using Firestore local cache                          |
| AI Integration  | OpenAI API (initially)                                        |
| Auth            | Firebase Auth (with fallback to local storage)                |
| Storage         | Firestore (cloud mode) + Local DB (e.g., Hive or SharedPrefs) |

---

## 📂 Project Structure (Flutter)

```
lib/
├── main.dart
├── core/
│   ├── theme/
│   ├── utils/
│   └── constants.dart
├── features/
│   ├── home/
│   ├── reflection/
│   ├── library/
│   ├── trends/
│   └── journey/
├── services/
│   ├── ai_service.dart
│   ├── auth_service.dart
│   └── storage_service.dart
├── models/
├── widgets/
└── routes.dart
```

---

## 💻 Coding Guidelines

## 🚀 Flutter Best Practices

To ensure consistency, readability, and maintainability across the codebase, we follow these conventions:

### File & Folder Naming

- Use `snake_case` for all file and folder names.
- Avoid abbreviations unless universally understood (e.g., `api`, `db`).

### Widget & Class Structure

- Prefer `StatelessWidget` when the widget does not require mutable state.
- Use `StatefulWidget` only when necessary (e.g. animation controllers, user input tracking).
- Split large widgets into subcomponents using helper widgets under `widgets/` or `features/.../widgets/`.

### Component Reusability

- Any component used more than once (e.g., `NavBar`, `EmotionCard`, `MoodIconGrid`) should be moved to `widgets/` or its feature-specific `widgets/` folder.
- Shared layout components (e.g., scaffold templates, page containers) go in `core/widgets/`.
- Define reusable helper methods and extensions under `core/utils/`.

### Theming & Styling

- All colors, text styles, padding, and spacing should reference central definitions in `core/theme/`.
- Avoid hardcoded styles within widgets.
- Use semantic naming for theme properties (e.g., `AppColors.neonPurple`, `TextStyles.titleLarge`).

### Logic & State

- Keep UI and business logic separated.
- Place business logic in controllers or providers, not inside widgets.
- Use **Riverpod** to manage shared state. Riverpod is preferred for this app because it:
  - Avoids the need for BuildContext in logic,
  - Supports async state management (ideal for AI and audio input),
  - Is more testable and scalable than Provider,
  - Encourages clean separation of concerns with better lifecycle management.

### Comments & Documentation

- Use Dart doc comments (`///`) for all public classes, methods, and complex logic.
- Explain intent behind non-obvious code sections.

### Routing & Navigation

- Define named routes in a central `routes.dart` file.
- Use enums or constants for route names to avoid typos.

### Folder Hygiene

- Each feature module (e.g., `reflection/`, `library/`) should follow a clean structure:
  ```
  reflection/
  ├── widgets/
  ├── view/
  ├── controller/
  └── model/
  ```

### Example: Clean Widget Breakdown

```
// DON'T:
return Column(
  children: [
    Text('Hello'),
    ElevatedButton(...),
    Divider(),
    Icon(...),
  ]);

// DO:
return Column(
  children: [
    GreetingText(),
    ConfirmButton(),
    CustomDivider(),
    MoodIcon(),
  ]);
```

Adhering to these practices will make development faster, onboarding easier, and future scaling more predictable.

---

## 🚀 Flutter Best Practices

These guidelines ensure clean, scalable, and idiomatic Flutter code throughout the project:

### Layout & Widget Composition

- Favor composition over inheritance — small, reusable widgets are easier to test and style.
- Avoid deeply nested widget trees. Break them into smaller widgets with descriptive names.
- Use `const` constructors wherever possible for performance optimization.

### Navigation

- Use `go_router` or `Navigator 2.0` for clean, declarative navigation flows.
- Prefer `named routes` and store them in a central route file.
- Handle navigation logic separately from UI widgets.

### State Management with Riverpod

- Use `StateNotifier` or `AsyncNotifier` for complex state models.
- Use `ref.watch()` inside widgets and `ref.read()` for logic.
- Group providers logically and organize them by feature.

### Performance

- Use `ListView.builder` for scrollable lists.
- Use `const` for immutable widgets to reduce rebuilds.
- Avoid unnecessary rebuilds by lifting state up or using selectors (`ref.watch.select`).

### Responsiveness

- Use `LayoutBuilder` or `MediaQuery` for screen size awareness.
- Prefer percentage-based or adaptive sizing.
- Support landscape and tablet layouts where applicable.

### Theming

- Use `Theme.of(context)` or `Provider`-driven theming.
- Centralize color, spacing, and typography.
- Support both light and dark themes (default: dark).

### Folder Structure & Modularization

- Organize app by **features**, not widget types.
- Each feature should contain its own widgets, views, models, and controllers.

### Testing

- Write unit tests for logic-heavy components.
- Use widget tests for common reusable components.
- Mock dependencies using `mocktail` or `riverpod_test` utilities.

Keeping the codebase modular, declarative, and testable from the beginning will greatly improve maintainability as the app grows.

---

## 🧩 System Decisions Summary

## 🗃️ Database Structure

This app uses Firestore to store and sync user data, emotion metadata, and journaling insights. Below is the full structure for core collections:

### 🔹 `emotions` (global emotion registry)

Stores both default and AI-discovered emotions.

```json
{
  "name": "anticipatory grief",
  "type": "ai_discovered", // or "default"
  "definition": "Grief felt before a loss occurs...",
  "triggers": ["uncertainty", "impending change"],
  "signs": ["restlessness", "avoidance"],
  "coping": ["journaling", "talking to a trusted person"],
  "discoveredBy": "uid_456", // ID of first user
  "createdAt": Timestamp,
  "isPublic": false, // set to true after second user unlocks it
  "aliases": ["pre-loss sadness", "preparation grief"]
}
```

### 🔹 `user_emotions` (per-user unlocked emotions)

Tracks emotions the user has personally encountered.

```json
{
  "uid": "uid_456",
  "emotionId": "anticipatory_grief",
  "firstEncounteredAt": Timestamp,
  "entryRefs": ["entry_001", "entry_013"]
}
```

### 🔹 `entries` (journal/reflection entries)

Stores the full emotional reflections and AI output.

```json
{
  "uid": "uid_456",
  "inputType": "voice", // or "text" or "visual"
  "text": "I feel like something big is going to change soon...",
  "audioRef": "storage/audio/uid_456_entry_001.aac",
  "emotions": [
    {"id": "anticipatory_grief", "intensity": 4},
    {"id": "anxious", "intensity": 2}
  ],
  "tags": {
    "location": "home",
    "people": ["mum"],
    "activity": "thinking",
    "time": "evening"
  },
  "createdAt": Timestamp
}
```

### 🔹 `users` (basic profile and settings)

Full user document with personalization and discovery support.

```json
{
  "uid": "uid_456",
  "displayName": "Rayaan",
  "email": "rayaan@example.com",
  "onboardingComplete": true,
  "reminderTime": "09:30",
  "theme": "dark",
  "localMode": false,

  // Personal emotional insights
  "discoveredEmotions": ["anticipatory_grief", "self-directed frustration"],

  // For tag autocomplete and filtering
  "knownPeople": ["mum", "flatmate", "tutor"],
  "knownLocations": ["home", "library", "gym"],
  "knownActivities": ["studying", "scrolling", "arguing"],
  "knownTimes": ["morning", "evening", "late night"],

  // Optional future use
  "preferredInputMethod": "voice",  // or "text", "visual"
  "lastCheckInAt": Timestamp,
  "totalEntries": 42,
  "longestStreak": 7,

  "createdAt": Timestamp
}
```

### 🔹 `admin_config` (admin-controlled config flags)

Used for global UI/UX config or message rotation.

```json
{
  "reminderToneOptions": [
    "Hey, take a moment to check in with yourself 🌱",
    "How are you doing lately?"
  ],
  "defaultReminderTone": 0,
  "emotionVisibilityThreshold": 2
}
```

### Audio Storage Format

- Audio reflections will be **saved in compressed format** to reduce storage footprint.
- Voice input will be stored as text (via voice-to-text) and optionally archived in compressed audio files (e.g., `.aac`).

### Emotion System

- Emotions are **predefined** and based on an extended taxonomy (Plutchik++).
- Users **cannot rename or create** custom emotions to maintain semantic consistency and clarity in analysis.
- However, the AI can identify and assign **new, nuanced emotions** that aren’t part of the default list if the user's reflection fits better with a more specific or refined emotion.
- When this happens:
  - The new emotion is stored in the system's database as a global emotion.
  - It becomes available for other users in future AI responses, to avoid overlapping or duplicating similar emotional states.
  - These AI-discovered emotions are only shown to a user if they “unlock” them through a relevant reflection.
  - All metadata (definition, triggers, signs, coping strategies) is shared across users for consistency once an emotion is discovered.
- This keeps emotional insights personalized while still maintaining a global emotional intelligence structure.
- Users **cannot rename or create** custom emotions to maintain semantic consistency and clarity in analysis.

### Language Support

- App will launch in **English only**.
- Codebase will be organized to allow **future i18n expansion** if demand arises.

### Sync Strategy

- **All or nothing**: users with accounts sync their full data to the cloud (Firestore).
- **Local mode**: no cloud sync, all data remains on device only.

### Notification System

- Default tone is **relaxed and encouraging**.
- Message examples: “Hey, take a moment to check in with yourself 🌱”
- **Customizable by admin only**, not user-facing — stored server-side or via config.

---

## 📌 Next Steps & TODOs

- [ ] Finalize list of core and secondary emotions
- [ ] Draft AI prompt format for emotion interpretation
- [ ] Build basic journaling input + AI analysis flow (typed, spoken, and visual)
- [ ] Create library structure and 10–15 seed emotions
- [ ] Design wireframes in Figma (based on home, reflect, library, trends, journey)
- [ ] Set up local + cloud storage toggle logic

---
