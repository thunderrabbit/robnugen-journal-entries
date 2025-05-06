---
title: "Conversation with ChatGPT about Local AI Voice Agents"
tags: [ "ai", "journal", voice-agent, privacy, future, markdown ]
author: Rob Nugen
date: 2025-05-05T06:57:38+09:00
draft: false
location: Adelaide (about to return to Tokyo)
mood: curious
summary: >
  Reflections and planning around future AI voice agents,
  local models, and how they might interact with Rob's Markdown-based journal.
---

<p class="note">(imported 06:57 Tuesday 06 May 2025 ACST)</p>

From a technological perspective, how long before we have private local audio chats with AI?

<p class="ai chatgpt">Within 1–3 years for mainstream use. Already possible today with tools like Whisper.cpp, Ollama, and Coqui TTS on laptops. With some technical setup, you could have a private, local AI voice agent running right now. Expect smoother performance and better UX within the next 12–24 months.</p>

It doesn’t have to be on my phone—just my laptop.

<p class="ai chatgpt">Even better. Your Lemur laptop from 4–5 years ago can likely run it today with only a bit of delay. Use CPU-optimized models like LLaMA 3 8B (quantized), Whisper.cpp for transcription, and Coqui TTS for output. GUIs like LM Studio or Python + Gradio could make it friendlier.</p>

I’ve written in my journals (handwritten and online) with the idea that someday, my personal agent would be able to read and respond.

<p class="ai chatgpt">That’s powerful. You're creating a kind of "soulprint"—a long-form, deeply personal dataset that future AI will be able to process with surprising nuance. We’re close to the point where it could answer questions based on your past entries and help reflect themes and emotional patterns back to you.</p>

Can you find my Bitbucket account?

<p class="ai chatgpt">I couldn’t locate a public Bitbucket profile under the name `thunderrabbit`. If the repositories are private or under a different username, they wouldn’t show up in a public search.</p>

Ignoring the bug with repeated tags—anything I can add to this journal front matter to make it more parsable?

<p class="ai chatgpt">Yes! Adding fields like `mood`, `location`, `themes`, `people`, `tools`, `intent`, and `summary` can dramatically improve AI parsing. These help an assistant understand what each entry is about at a glance, especially for future reflection or emotional mapping.</p>

I’m definitely not going to add all of that manually.

<p class="ai chatgpt">Totally fair. Instead, we can build a parser that reads your Markdown content and auto-generates those tags—then appends them to the front matter. All in plain text, no databases or sidecar files.</p>

For the record, here's what the markdown file looks like now.  (I
filed https://github.com/thunderrabbit/Quick/issues/14 to prevent
multiple years in tags)

```
---
title: "State of My Life Address"
tags: [ "2025", "2025", "2025", "2025", "soml" ]
author: Rob Nugen
date: 2025-04-01T22:47:00+09:00
draft: false
---

1. Jess and I are house sitting Milo the greyhound in Bateman, a suburb of Perth.
2. I'm the MOS coordinator for the NWTA weekend training coming soon!
3. I enjoyed attending North Perth Integration Group last night.  Lloyd drove me there from Bateman.  11 men were in the meeting.  One of my mates from 8 years ago was like, "I can't believe I'm seeing you face to face; where did the time go?"
4. We got to see Jennie J while hanging out in Freo (Fremantle) last week.
5. I've been playing with AI, and just got Plandex 2 installed on my Lemur laptop
----  (snip)  ----
```


<p class="ai chatgpt">Thanks for sharing it. You’re already writing in a clear, list-based format, which makes parsing easier. We can create a lightweight script to extract things like dates, people, locations, and emotional tone, and add those directly to your front matter—preserving all formatting.</p>

I want to keep everything human-readable—no databases, no sidecars. Just Markdown with front matter.

<p class="ai chatgpt">Beautiful and timeless. That approach ensures your work remains legible and accessible far into the future. Everything we build can honor that principle—pure text, version-controlled, and transparent.</p>

I'm on my phone—so keep this in the chat, not a shared file. But can you create a Markdown file that recaps this conversation?

<p class="ai chatgpt">(You’re reading it!) Here's the full conversation recap in Markdown, with your responses plain and mine clearly tagged for future parsing or styling.</p>
