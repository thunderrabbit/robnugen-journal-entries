# LLM Guide: Working on Rob Nugen's Journal Repository

> [!NOTE]
> This guide is specifically written for Large Language Models (LLMs) to understand how to work effectively on this journal repository. It explains the project structure, conventions, and best practices.

## Project Overview

This repository contains **text-based journal entries** from Rob Nugen's personal journal, spanning from **1985 to present day**. The entries are written in **Markdown format** with YAML frontmatter and are organized chronologically by year.

### Key Information
- **Copyright**: 1970 - 2070 Rob Nugen
- **Content Type**: Personal journal entries in Markdown
- **Primary Use**: These markdown files are consumed by Hugo (a static site generator) to create a browsable journal website
- **Repository Location**: `/home/thunderrabbit/work/rob/robnugen.com/journal/journal`

---

journal/
├── 1985/                      # Year-based directories (required)
├── 1987/
├── ...
├── 2025/
├── 2026/
│   └── 02/                    # Month subdirectories (required)
│       └── 03state-of-my-life-address.md
├── css/                       # Stylesheets
├── *.pl                       # Perl utility scripts
├── *.sh                       # Shell scripts for deployment/testing
├── README.md                  # Brief project description
├── .gitignore                 # Git ignore rules
└── index.html                 # Main entry point
```

### Directory Organization
- **Year Directories** (e.g., `2025/`, `2026/`): Each year has its own directory containing journal entries
- **Month Subdirectories** (optional): Some years use month subdirectories (e.g., `2026/02/`)
- **Markdown Files**: Journal entries are stored as `.md` files with descriptive filenames

---

## Markdown File Format

Every journal entry MUST follow this exact format:

```markdown
---
title: "Entry Title"
tags: [ "tag1", "tag2", "tag3" ]
author: Rob Nugen
date: YYYY-MM-DDTHH:MM:SS+09:00
draft: false
---

Entry content goes here.

Can include HTML tags like <p class="note">...</p>

Can include markdown formatting, links, images, etc.
```

### YAML Frontmatter Rules

1. **title**: Brief, descriptive title for the entry (quoted string)
2. **tags**: Array of tags (quoted strings in square brackets)
3. **author**: Always "Rob Nugen"
4. **date**: ISO 8601 format with Japan timezone (+09:00)
   - Format: `YYYY-MM-DDTHH:MM:SS+09:00`
   - Example: `2025-01-07T09:57:00+09:00`
5. **draft**: Boolean (usually `false` for published entries)

> [!IMPORTANT]
> The timezone is always `+09:00` (Japan/Tokyo) for this journal.

### Filename Conventions

Filenames typically follow these patterns:
- Descriptive, lowercase with hyphens: `03state-of-my-life-address.md`
- Date prefix when appropriate: `07great-progress-on-quick.md`
- Short and readable: `07making-holes-in-my-bicycle-tarp.md`

---

## Utility Scripts

The repository includes several Perl and Bash scripts for automation:

### Perl Scripts

| Script | Purpose |
|--------|---------|
| `generate-md-for-new-frames.pl` | Generates markdown for new video frames (MT3 project related) |
| `journal_entry_mass_editor.pl` | Bulk editing of journal entries |
| `markdown_finder.pl` | Finds markdown files |
| `tag_cleanser.pl` | Cleans/standardizes tags |
| `find_tables.pl` | Locates tables in entries |
| `check_links.pl` | Validates links in entries |

### Bash Scripts

| Script | Purpose |
|--------|---------|
| `test-journal-locally.sh` | Tests journal locally with Hugo |
| `upjournalpic.sh` | Uploads journal pictures |
| `upwalkpic.sh` | Uploads walk pictures |
| `upgardenpics.sh` | Uploads garden pictures |
| `upremodelingpics.sh` | Uploads remodeling pictures |
| `updirectoryjournalpics.sh` | Uploads directory of journal pics |
| `upweekly-alignments-audio.sh` | Uploads weekly alignment audio |

### Testing Workflow

To test the journal locally:
```bash
cd ~/journal-hugo-local
hugo server --watch=false
```

---

## Git Workflow and Commit Conventions

> [!CAUTION]
> **CRITICAL**: This repository has a **SACRED COMMIT NARRATIVE** that is **AT LEAST AS IMPORTANT** as the journal entries themselves. Any action that could damage this narrative is absolutely forbidden.

### The Commit Message Narrative

The commit messages in this repository form a **continuous autobiographical narrative** that has been carefully crafted over **5-10+ years** (2,341+ commits as of February 2026). This is not standard version control practice—it's a unique literary/artistic project where the Git history itself is a story.

**Example of the narrative:**
```
in
Japan,
I
had
never
been,
though
I
had
often
wanted
to
go.
```

Each commit message adds the next word or phrase to Rob's ongoing life story.

### ABSOLUTE RULES - Never Break These

> [!CAUTION]
> **NEVER** suggest or perform ANY of the following operations:

❌ **FORBIDDEN OPERATIONS:**
- `git rebase` (rewrites history)
- `git commit --amend` (changes commit messages)
- `git push --force` / `git push -f` (overwrites history)
- `git reset --hard` on pushed commits
- `git rebase -i` / interactive rebase
- Squashing commits
- Changing commit messages
- Reordering commits
- Any other history-rewriting operation

### Safe Git Operations

✅ **SAFE OPERATIONS:**
- `git pull` (ALWAYS do this before committing)
- `git add`
- `git push` (regular, non-force push)
- `git status`
- `git log` (read-only)

### Before Committing

Always ask Rob to tell you the commit message he wants to use.

> [!WARNING]
> **ALWAYS REMIND THE USER TO PULL BEFORE COMMITTING** to avoid conflicts that could disrupt the narrative sequence.

### Commit Guidelines

1. **Small, Focused Commits**: Create small, concise commits instead of bundling many changes together
2. **Group Related Changes**:
   - ✅ **DO**: Commit the same type of change across multiple files together
   - ❌ **DON'T**: Commit a text change to a template along with a database layer change
3. **Logical Separation**: Keep unrelated changes in separate commits
4. **Preserve Narrative Order**: The user controls commit messages—they continue the story

### Example Commit Strategy

**Good:**
```
$ git pull  # ALWAYS pull first!
$ git add 2025/02/*.md
$ git commit -m "that"
$ git add scripts/new-script.sh
$ git commit -m "Oh,"
$ git push
```

**Bad:**
```
$ git add .
$ git commit -m "Update tags, fix typos, add entry"  # Bundles unrelated changes
$ git push --force  # NEVER DO THIS
```

### Why This Matters

Breaking the commit history would:
- **Destroy 5-10+ years of narrative work**
- **Lose the literary/artistic value** of the repository
- **Break the continuity** of Rob's autobiographical story
- Be **irreversible** and devastating to the project

> [!IMPORTANT]
> Treat the commit history as **immutable and sacred**. The narrative sequence must remain intact at all costs.

---

## Working with Journal Entries

### Creating New Entries

1. **Determine the correct year/month directory**
   - Example: For February 2026 → `2026/02/`

2. **Choose a descriptive filename**
   - Use lowercase with hyphens
   - Keep it concise but meaningful

3. **Use the correct YAML frontmatter**
   - Copy the format exactly from existing entries
   - Set the date in Japan timezone (+09:00)
   - Choose appropriate tags

4. **Set draft status**
   - Use `draft: false` for published entries
   - Use `draft: true` if the entry shouldn't be visible yet

### Modifying Existing Entries

1. **Preserve the YAML frontmatter structure**
2. **Be cautious with dates** - changing dates affects chronological ordering
3. **Maintain consistent tag formatting**
4. **Respect the original author's voice and style**

### Tag Management

Common tags observed:
- Years: `"2025"`, `"2024"`, etc.
- Topics: `"bicycle"`, `"quick"`, `"mt3"`, `"livestream"`
- Concepts: `"future"`, `"past"`, `"self"`
- People: `"guillebeau"`

Tags should be:
- Lowercase (usually)
- Quoted strings
- Separated by commas
- Enclosed in square brackets

---

## Important Files to Avoid

The `.gitignore` file specifies patterns to avoid:

```gitignore
x0x0x0*              # Special marker files
.plandex/            # Plandex AI assistant files
.aider*              # Aider AI assistant files
*.rss                # RSS feed files
preformat*           # Preformatted files
ls-1R*               # Directory listing files
```

> [!CAUTION]
> Do not create or commit files matching these patterns.

---

## Communication Guidelines for LLMs

When working with the user (Rob Nugen), follow these critical rules:

### Response Style

1. **Follow the user's lead**: If they ask a specific Y/N question, answer with Y/N first, then explain
2. **Be precise**: The more specific the question, the more attentive you should be
3. **Don't assume**:
   - ❌ "Can you see why it's broken?" does NOT mean "fix it"
   - ✅ It means answer yes/no with an explanation OR ask for clarification

### Example Interaction

**User**: "Can you see why it's broken?"

**Good Response**:
> Yes, I can see the issue. The YAML frontmatter is missing the closing `---` separator on line 7, which causes the markdown parser to treat the entire file as frontmatter. Would you like me to fix it?

**Bad Response**:
> I've fixed the YAML frontmatter issue by adding the closing separator.

---

## Common Operations

### Finding Files

Use standard Unix tools:
```bash
# Find all markdown files in 2025
find 2025/ -name "*.md"

# Find entries with specific tags
grep -r "tag1" 2025/

# Count entries per year
ls -1 2025/*.md | wc -l
```

### Bulk Operations

The user has created helper scripts for bulk operations. Before writing new code:
1. Check if a relevant script already exists
2. Understand what the existing scripts do
3. Extend or use them appropriately

---

## Hugo Integration

This journal is consumed by Hugo static site generator. Key points:

1. **Hugo reads the markdown files** and generates a static website
2. **The YAML frontmatter** is parsed by Hugo for metadata
3. **The date field** determines chronological ordering
4. **Tags** create taxonomy pages
5. **Draft status** controls visibility

### Testing Changes

After modifying entries:
```bash
cd ~/journal-hugo-local
hugo server --watch=false
```

This starts a local server to preview changes before committing.

---

## Special Considerations

### Timezone Awareness
- All dates use Japan Standard Time (+09:00)
- When creating entries, calculate the correct JST time
- Don't assume UTC or other timezones

### Content Privacy
- This is a personal journal with entries dating back to 1985
- Treat content with respect and confidentiality
- Don't make assumptions about what should/shouldn't be public

### Historical Entries
- Older entries may have different formatting
- Some entries reference external content (images, videos, links)
- Maintain backward compatibility when making changes

---

## Troubleshooting

### Invalid YAML Frontmatter
- Ensure proper quoting of strings
- Check for balanced brackets in tag arrays
- Verify date format matches ISO 8601

### Missing Entries
- Check the correct year/month directory structure
- Verify the entry isn't marked as `draft: true`
- Ensure the filename ends with `.md`

### Broken Links
- Use `check_links.pl` to validate links
- External links may become stale over time
- Internal links should use relative paths

---

## Project History Context

Based on conversation history, Rob is also working on:
- **Meiso Gambare (mg.robnugen.com)**: A separate PHP-based web application
- **MT3 Project**: Video/livestream content with frame extraction
- Various other web projects

This journal repository is **separate** from those projects but may reference them in entries.

---

## Quick Reference

### File Locations
- Journal entries: `YYYY/MM/DDfilename.md` or `YYYY/DDfilename.md`
- Test locally: `~/journal-hugo-local`
- Scripts: Root directory (`*.pl`, `*.sh`)

### Date Format
- `YYYY-MM-DDTHH:MM:SS+09:00`
- Always use Japan timezone

### Commit Strategy
- Small, focused commits
- Group similar changes
- Separate unrelated changes

### Communication
- Answer questions precisely
- Don't assume requests mean "fix it"
- Follow the user's lead

---

## Getting Started Checklist

When first working on this repository:

- [ ] Read this entire guide
- [ ] Explore a few recent entries to understand the format
- [ ] Check `.gitignore` to know what to avoid
- [ ] Understand the user's commit preferences
- [ ] Locate relevant utility scripts
- [ ] Test locally with Hugo before committing

---

> [!TIP]
> When in doubt, ask the user for clarification rather than making assumptions. Rob has specific preferences and will guide you toward the right approach.

**Good luck working on this journal repository! 🎯**
