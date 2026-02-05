---
description: How to create a new journal entry from voice input
---

This workflow describes how the LLM should handle user voice input to create a new journal entry.

# Trigger
The user will say something like:
> "Let's make a new journal entry... [Review of the day...]"

## Process Special Commands
- **"LLM note ... end LLM note"**: Extract instructions, don't include in content
  - Example: "LLM note this is for yesterday at 3:15pm end LLM note" → use yesterday's date 15:15
- **"LLM Paragraph"**: Insert two newlines (empty line between paragraphs)
- **Specific Replacements**:
  - "ab" or "a b" -> "**AB**" (Client initials, always capitalize)

# Steps

1.  **Extract Content**: Everything spoken after the trigger phrase is the content.
2.  **Generate Metadata**:
    *   **Title**: Create a short, era-appropriate title based on content.
    *   **Slug**: Kebab-case version of title (e.g., `walk-in-park`).
    *   **Date**: Current system time (`YYYY-MM-DD`).
3.  **Determine Filename**:
    *   Format: `journal/journal/YYYY/MM/ddslug.md`
    *   Example: `2026/02/06walk-in-park.md`
4.  **Create File Content**:
    *   Frontmatter:
        ```yaml
        ---
        title: "Title Here"
        tags: [ "2026" ]
        author: Rob Nugen
        date: 2026-02-06T10:30:00+09:00
        draft: false
        ---
        ```
    *   Body: The transcribed text.
5.  **Action**: Use `write_to_file` to create the new entry.
6.  **Notify**: Inform the user the file has been created.