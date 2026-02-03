# LLM Preprocessing Guide for Journal Transcription

This guide explains how to preprocess voice-transcribed journal entries as an LLM assistant.

## Your Role

You will receive raw transcription text and convert it into structured JSON data that the `parse_transcription.pl` script can process.

## Input Format

Voice transcription text file with this structure:

```
This journal is BOOK [NUMBER]

This is the next journal entry
[Page NUMBER] (optional)
[Day of week] (optional)
[Date]
[Time] (optional)
[Timezone] (optional)
[Entry content...]

This is the next journal entry
...
```

## Your Tasks

### 1. Extract Journal Name
- Look for "This journal is BOOK [NUMBER]" at the top
- Store as `journal_name`

### 2. Split Entries
- Split on delimiter: "This is the next journal entry"
- Each section becomes one entry

### 3. Process Each Entry

#### Track State Across Entries
- **Year**: If not spoken, use same as previous entry
- **Timezone**: If not spoken, use same as previous entry
- **Page**: If not spoken, use same as previous entry

#### Parse Date/Time
- Month name is ALWAYS present
- Year may be missing (use same as previous)
- Day of week may be missing (calculate from date)
- Time may be missing
- Timezone may be missing (use same as previous)
- Convert to ISO 8601: `YYYY-MM-DDTHH:MM:SS±HH:MM`

#### Validate Day of Week
- Calculate day-of-week from date and year
- If spoken day doesn't match, flag for review

#### Process Special Commands
- **"LLM note ... end LLM note"**: Extract instructions, don't include in content
  - Example: "LLM note this is now page 73 end LLM note" → update page tracking
  - Image URLs: "LLM note here is the URL ... end LLM note" → format as markdown image
- **"LLM Paragraph"**: Insert two newlines (empty line)

#### Handle Images
When LLM notes contain image URLs, format as clickable thumbnails:
- **Thumbnail path**: `//robnugen.com/journal/YYYY/thumbs/filename.jpeg` (NO _1000 suffix)
- **Full-size path**: `//b.robnugen.com/journal/YYYY/filename_1000.jpeg` (WITH _1000 suffix)
- **Format**: `[![alt text](thumbnail-url)](full-size-url)`

#### Generate Title
- Create era-appropriate title based on content
- **1992-1997**: Short (e.g., "New 486", "Shopping")
- **2020**: Medium (e.g., "Been walking recently")
- **2025**: Descriptive (e.g., "Why pasta boils over")

#### Generate Filename
- Create from title with era-appropriate style
- **Case-sensitive sorting**: Use capitalization for time ordering
  - Same day, multiple entries: `Breakfast.md`, then `lunch.md`, then `walking.md`
  - Capital letters sort before lowercase
- Remove special characters (keep hyphens)
- Replace spaces with hyphens
- Add `.md` extension

#### Track Page Changes
- If entry spans multiple pages, track in "pages" array
- Example: page 48 → "LLM note now page 49" → `"pages": ["48", "49"]`

### 4. Flag Discrepancies
Only flag actual problems:
- Date vs day-of-week mismatch (if both spoken)
- Unparseable dates
- Uncertainty about first entry's timezone/year

**DO NOT flag:**
- Missing timezone (use "same as previous")
- Missing year (use "same as previous")
- Missing page (use "same as previous")
- Multiple entries on same page (normal)

## Output Format

Generate JSON with this structure:

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
      "content": "Entry content with\n\nparagraph breaks",
      "title": "Entry Title",
      "filename": "entry-title.md",
      "flags": []
    }
  ]
}
```

## Field Descriptions

- **page**: Current/primary page number (string)
- **pages**: Array of all pages this entry spans
- **date_iso**: ISO 8601 date with timezone
- **date_spoken**: Exactly as spoken (for display in entry)
- **timezone**: Timezone abbreviation (CDT, JST, etc.)
- **content**: Entry text with `\n\n` for paragraph breaks
- **title**: Era-appropriate title for frontmatter
- **filename**: Complete filename with proper capitalization
- **flags**: Array of warning strings (empty if no issues)

## Examples

### Example 1: Basic Entry
**Input:**
```
This journal is BOOK THREE

This is the next journal entry
Page 47
Thursday 12 AM, June 17, 1992
I now have a 486!
```

**Output:**
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
      "content": "I now have a 486!",
      "title": "New 486",
      "filename": "new486.md",
      "flags": []
    }
  ]
}
```

### Example 2: Same-as-Previous Defaults
**Input:**
```
This journal is BOOK THREE

This is the next journal entry
Page 47
Thursday, June 17, 1992, 11:00 PM CDT
First entry today.

This is the next journal entry
Friday, June 18, 8:00 AM
Second entry - note missing year and timezone
```

**Output:**
```json
{
  "journal_name": "BOOK THREE",
  "entries": [
    {
      "page": "47",
      "pages": ["47"],
      "date_iso": "1992-06-17T23:00:00-05:00",
      "date_spoken": "Thursday, June 17, 1992, 11:00 PM CDT",
      "timezone": "CDT",
      "content": "First entry today.",
      "title": "First entry",
      "filename": "First.md",
      "flags": []
    },
    {
      "page": "47",
      "pages": ["47"],
      "date_iso": "1992-06-18T08:00:00-05:00",
      "date_spoken": "Friday, June 18, 8:00 AM",
      "timezone": "CDT",
      "content": "Second entry - note missing year and timezone",
      "title": "Second entry",
      "filename": "second.md",
      "flags": []
    }
  ]
}
```

### Example 3: Multi-Page Entry with LLM Notes
**Input:**
```
This journal is BOOK TEN

This is the next journal entry
Page 159
Saturday, March 4, 2000, 2:15 PM
Started writing about my day. LLM Paragraph Had lunch at the cafe.

LLM note now on page 160 end LLM note

Continued on next page. More thoughts here.
```

**Output:**
```json
{
  "journal_name": "BOOK TEN",
  "entries": [
    {
      "page": "159",
      "pages": ["159", "160"],
      "date_iso": "2000-03-04T14:15:00-06:00",
      "date_spoken": "Saturday, March 4, 2000, 2:15 PM",
      "timezone": "CST",
      "content": "Started writing about my day.\n\nHad lunch at the cafe.\n\nContinued on next page. More thoughts here.",
      "title": "Saturday afternoon thoughts",
      "filename": "saturday-afternoon-thoughts.md",
      "flags": []
    }
  ]
}
```

## Tips

1. **Timezone inference**: Use era context
   - 1992-2003ish: CDT/CST (Houston, TX)
   - 2003+: JST (Japan)

2. **Title generation**: Match the era style by looking at year
   - Old (pre-2000): Short and simple
   - Modern (2020+): More descriptive

3. **Filename sorting**: Remember capitals sort first
   - Use for time-of-day ordering on same date

4. **Ask for help**: If truly uncertain about timezone/year for FIRST entry, flag it

## Save Output

Save the JSON to: `transcriptions/preprocessed_YYYY-MM-DD.json`

Then user runs: `./parse_transcription.pl transcriptions/preprocessed_YYYY-MM-DD.json`
