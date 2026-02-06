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
- **Time Markers**:
  - "LLM note Time [Timestamp]..." -> Insert `#### [Timestamp]` header in 24-hour format at that point in the text.


21. # Steps
22.
23. 1.  **Extract Content**: Everything spoken after the trigger phrase is the content.
24. 2.  **Generate Metadata**:
25.     *   **Title**: Create a short, era-appropriate title based on content.
26.     *   **Slug**: Kebab-case version of title (e.g., `walk-in-park`).
27.     *   **Date**: Current system time.
28. 3.  **Construct JSON Content**:
29.     *   Create a JSON object following the schema in `journal/journal/LLM_PREPROCESSING_GUIDE.md`.
30.     *   **Structure**:
31.         ```json
32.         {
33.           "journal_name": "Antigravity Voice Journal",
34.           "entries": [
35.             {
36.               "page": "1",
37.               "pages": ["1"],
38.               "date_iso": "2026-02-06T10:30:00+09:00",
39.               "date_spoken": "Friday, February 6, 2026, 10:30 AM",
40.               "timezone": "JST",
41.               "content": "The transcribed text...",
42.               "title": "Title Here",
43.               "filename": "title-here.md",
44.               "flags": []
45.             }
46.           ]
47.         }
48.         ```
49. 4.  **Create Temporary JSON File**:
50.     *   Target: `transcriptions/preprocessed_YYYY-MM-DD-slug.json` (use actual date/time in filename to avoid collisions).
51.     *   Action: Use `write_to_file`.
52. 5.  **Process Entry**:
53.     *   Action: Use `run_command` to execute the Perl script.
54.     *   Command: `./parse_transcription.pl transcriptions/preprocessed_YYYY-MM-DD-slug.json`
55.     *   // turbo
56. 6.  **Cleanup & Notify**:
57.     *   Delete the temporary JSON file (optional, or keep for debugging).
58.     *   Notify the user that the entry has been created.