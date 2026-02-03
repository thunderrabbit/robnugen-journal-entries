# Voice Transcription to Journal Entry Workflow (REVISED)

## Overview

Digitize physical journal entries through voice transcription with a two-phase approach:
1. **LLM preprocessing** - Normalize dates, extract metadata, prepare structured data
2. **Perl parsing** - Generate properly formatted markdown files with correct YAML frontmatter

---

## Key Requirements from User Feedback

### Journal Metadata
- **Journal name**: Spoken once at top of transcription (e.g., "BOOK THREE", "BOOK TWENTY-NINE")
  - BOOK THREE started October 1992
  - BOOK TWENTY-NINE started December 2025
- **Page number**: Spoken per entry
- Both stored in frontmatter tags: `[ "BOOK TEN", "page 159" ]`

### Date Format
- User will speak month names (e.g., "June 4th 2015" or "4 June 2015")
- Format varies per entry based on what's written in physical journal
- LLM must parse flexibly and check day-of-week consistency
- **Report discrepancies** for user decision

### Timezone Handling
- **NOT always JST!** Varies by:
  - Location at time of writing
  - Era (Houston TX through BOOK TWELVE ~1992-2003, then Japan 2003+)
  - Travel (may have multiple timezones in single entry)
- **Timezone is often NOT written/spoken**
  - **Default: "same as previous entry"**
  - LLM tracks timezone across entries
  - Ask user for support if uncertain about first entry or major changes

### Entry Body Format
```markdown
<div class="note">Transcribed [TEXT-FILE-DATE]</div>

#### [SPOKEN-DATE]

[Entry content...]
```
- Use `####` (h4) for date headings (based on recent entries analysis)
- Include transcription note with date of text file creation

### Filename Conventions
- **Era-specific patterns**:
  - 1992-1997: Short names (`Ultimate.md`, `Frames.md`, `computer.html`)
  - 2020: Medium length (`been-walking-recently-in-the-mornings.md`)
  - 2025: Descriptive (`travel-notes-before-flying-back.md`)
- **Must sort alphabetically** = chronologically
  - **Sorting is case-sensitive**: `Oranges.md` (capital O) comes before `apples.md` (lowercase a)
  - Multiple entries same day: capitalize first letter when needed for time-based sorting
  - Example: `Breakfast.md` then `lunch.md` then `walking.md`
- **LLM creates BOTH**:
  - Title (for frontmatter, based on era and content)
  - Exact filename (with proper capitalization for sorting needs)

### Delimiters and Commands
- **Entry delimiter**: "This is the next journal entry" (guaranteed unique)
- **LLM notes**: "LLM note ... end LLM note" (for parenthetical clarifications)
- **LLM Paragraph**: Inserts two Unix-style linebreaks (empty line between paragraphs)

---

## Proposed Workflow

### Phase 1: Voice Transcription (Manual - User)

**Structure to speak:**
```
[At top of file, once:]
This journal is BOOK [NUMBER]

This is the next journal entry
[Page NUMBER] (optional - defaults to "same as previous")
[Day of week] (optional - LLM determines from date)
[Date] (month name required, year optional - defaults to "same as previous")
[Time] (optional)
[Timezone] (optional - defaults to "same as previous")
[Read actual journal entry content]

This is the next journal entry
Page [NUMBER]
...
```

**Example:**
```
This journal is BOOK THREE

This is the next journal entry
Page 47
Thursday 12 AM, June 17, 1992
I now have a 486...

This is the next journal entry
Page 48
Friday June 18th, 1992, 8:30 PM
Today I went shopping...
```

**Save as:** `transcription_YYYY-MM-DD.txt` in `transcriptions/` directory

---

### Phase 2: LLM Preprocessing (AI-Assisted)

**Purpose**: Normalize varying date formats, extract structured metadata, and estimate/determine timezone

**Input**: Raw transcription text file

**LLM Tasks**:
1. **Extract journal name** from top of file
2. **Split entries** on delimiter phrase
3. **For each entry**:
   - Parse page number (default: same as previous entry)
   - Parse date/time in any spoken format
   - Apply "same as previous" defaults:
     - Year (if not spoken)
     - Timezone (if not spoken)
     - Page number (if not spoken)
   - Normalize to ISO 8601 with timezone
   - **Determine day-of-week** from date and year (if not spoken)
   - **Verify day-of-week** matches date (if spoken)
   - Clean up transcription errors
   - Process "LLM note" sections (including mid-entry page changes)
   - Process "LLM Paragraph" commands (insert empty lines)
   - **Generate era-appropriate title** from content
   - **Generate exact filename** with proper capitalization for sorting
4. **Flag discrepancies**:
   - Date vs day-of-week mismatches (if both spoken)
   - Unparseable dates
   - Uncertainty about first entry's timezone/year

**Output**: Structured JSON or text format for Perl script:
```json
{
  "journal_name": "BOOK THREE",
  "entries": [
    {
      "page": "47",
      "pages": ["47"],
      "date_iso": "1992-06-17T00:00:00-05:00",
      "date_spoken": "Thursday 12 AM, June 17, 1992",
      "timezone": "CDT",
      "content": "I now have a 486...\n\nThis is a new paragraph.",
      "title": "New 486 computer",
      "filename": "new486.md",
      "flags": []
    }
  ]
}
```

---

### Phase 3: Perl Parsing (Automated)

**Script**: `parse_transcription.pl`

**Input**: LLM-preprocessed structured data

**Tasks**:
1. Read preprocessed data
2. For each entry:
   - Determine year/month directory (`YYYY/MM/`)
   - Use LLM-provided filename as-is
   - Create YAML frontmatter:
     - Title (from LLM-provided title)
     - Tags: `[ "{JOURNAL_NAME}", "page {NUMBER}", ... ]` (multiple page tags if entry spans pages)
     - Author: "Rob Nugen"
     - Date: ISO 8601 with correct timezone
     - Draft: false
   - Format entry body:
     - Transcription note div
     - `#### {SPOKEN_DATE}`
     - Content
   - Write markdown file
3. Generate manifest of created files

**Output**:
- Markdown files in correct directories
- `manifest_YYYY-MM-DD.txt` listing all generated files

---

### Phase 4: Review (Manual - User)

1. Review generated files locally
2. Check frontmatter accuracy
3. Adjust tags/titles as needed
4. Verify content formatting
5. Test viewing via Perl (robnugen.com/journal.pl)

---

### Phase 5: Commit (Manual - User)

**CRITICAL**: Pull first!

```bash
$ git pull
$ git add YYYY/MM/*.md
$ git commit -m "[next narrative word]"  # Future: script to look up next word
$ git push
```

---

## Implementation Details

### Directory Structure

```
journal/
├── transcriptions/              # New directory for workflow
│   ├── transcription_2026-02-03.txt      # User's voice transcription (raw)
│   ├── preprocessed_2026-02-03.json      # LLM-normalized data (structured)
│   └── manifest_2026-02-03.txt           # List of generated files (for review)
├── YYYY/
│   └── MM/
│       └── DDentry-title.md     # Generated markdown files
└── parse_transcription.pl       # New Perl script
```

**File Purposes:**

1. **transcription_YYYY-MM-DD.txt**
   - Input: Raw voice transcription from user
   - Contains spoken entries with natural language dates, "LLM note" sections, etc.
   - Human-readable, direct from voice typing tool

2. **preprocessed_YYYY-MM-DD.json**
   - Intermediate: LLM-processed structured data
   - Normalized dates, extracted metadata, inferred timezones
   - Machine-readable format for Perl script to consume
   - Can be regenerated from .txt file if needed

3. **manifest_YYYY-MM-DD.txt**
   - Output: List of all generated markdown files
   - Used for review and verification
   - Shows what was created from this transcription session

### Perl Script Features

```perl
#!/usr/bin/perl
use strict;
use warnings;
use JSON;  # For reading preprocessed data
use File::Path qw(make_path);

# Read preprocessed JSON
# For each entry:
#   - Create directory if needed
#   - Use LLM-provided filename
#   - Build YAML frontmatter
#   - Format entry body
#   - Write file
# Generate manifest
```

---

## Edge Cases to Handle

1. **Date/day-of-week mismatches** - Flag for user review (if both spoken)
2. **Missing year/timezone/page** - Use "same as previous entry"
3. **Multiple entries same day** - LLM generates alphabetically sortable titles
4. **Transcription errors** - LLM cleans up obvious issues, flags unclear ones
5. **Long entries** - Preserve paragraph structure
6. **Timezone changes within entry** - Note in content, use primary timezone in frontmatter
7. **Page changes within entry** - Track via "LLM note", include all pages in tags
8. **Case-sensitive sorting** - LLM aware that capitals sort before lowercase

---

## Verification Strategy

**Before committing:**
1. **Count check**: Generated files match expected entry count
2. **YAML validation**: All files have valid frontmatter
3. **Date check**: All dates in correct timezone format
4. **Filename check**: Files sort chronologically when listed alphabetically
5. **Local view**: Test via journal.pl to ensure rendering works
6. **Spot check**: Review 2-3 entries manually for accuracy

---

## Sample Output

### Input (spoken):
```
This journal is BOOK THREE

This is the next journal entry
Page 47
Thursday 12 AM, June 17, 1992
I now have a 486...
```

### Generated File: `1992/06/17new-486-computer.md`

*(Note: In 1992 era, filename would actually be shorter like `new486.md`, but showing modern format for clarity)*

```markdown
---
title: "New 486 computer"
tags: [ "BOOK THREE", "page 47", "transcribed", "computer" ]
author: Rob Nugen
date: 1992-06-17T00:00:00-05:00
draft: false
---

<div class="note">Transcribed 2026-02-03</div>

#### Thursday 12 AM, June 17, 1992

I now have a 486...
```

---

## Next Steps

1. ✅ Get user feedback on revised plan
2. [ ] Create `transcriptions/` directory
3. [ ] Test transcription workflow with 2-3 sample entries
4. [ ] Develop LLM preprocessing prompt/workflow
5. [ ] Build `parse_transcription.pl` script
6. [ ] Test end-to-end with sample data
7. [ ] Iterate based on real-world usage
8. [ ] Document final workflow in LLM_GUIDE.md

---

## Answers to Original Questions

1. **Voice transcription tool**: Out of scope
2. **Delimiter phrase**: "This is the next journal entry" (confirmed)
3. **Date format**: Variable – always includes month name
4. **Tag suggestions**: Yes, include journal name + page number + others
5. **Review workflow**: Individual entry review

---

> [!TIP]
> Start with simple prototype, test with 2-3 entries, then refine based on actual transcription experience.
