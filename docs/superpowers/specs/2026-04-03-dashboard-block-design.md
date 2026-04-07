# DashboardBlock + Widgetbook Entries Design

## Overview

A stateless dashboard block composing `HeroSidebar` with a placeholder content area, plus widgetbook entries for the sidebar component and the dashboard block.

## DashboardBlock

**File:** `lib/src/blocks/dashboard/dashboard_block.dart`

A `final class` stateless widget that:
- Takes a `selectedItem` string and `onItemSelected` callback — consumer manages state
- Composes `HeroSidebar` with:
  - **Header:** App name text
  - **Footer:** User avatar + name placeholder
  - **Sections:** "Main" (Overview, Analytics, Reports) and "Settings" (Account, Preferences) — each with icons
- Content area: `Expanded` widget with centered text showing the selected page name
- Layout: `Row` with sidebar on left, content filling the rest

## Widgetbook Entries

### Components > HeroSidebar

Standalone sidebar playground. No knobs needed — just a static sidebar with sample sections/items to demonstrate the component.

### Blocks > DashboardBlock

Uses `_InteractiveDashboardBlock` stateful wrapper (same pattern as `_InteractiveHeroSwitch`) to manage selected item state for the widgetbook.

## Barrel Export

Add `DashboardBlock` export to `lib/hero_ui.dart`.
