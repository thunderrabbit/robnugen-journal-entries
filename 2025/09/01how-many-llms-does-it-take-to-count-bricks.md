---
title: "How many LLMs does it take to count bricks"
tags: [ "2025", "puzzle", "llm" ]
author: Rob Nugen
date: 2025-09-01T11:25:00+09:00
draft: false
---

[![2025 sep 01 visual puzzle from reddit 1000](//b.robnugen.com/journal/2025/thumbs/2025_sep_01_visual_puzzle_from_reddit.jpeg)](//b.robnugen.com/journal/2025/2025_sep_01_visual_puzzle_from_reddit_1000.jpeg)

Looking at this puzzle, I counted 12 pips per side on the largest square.  144 / 8 ..  hmmm how about 144 / 10 ..  14.4  + a bit, so 16 bricks per layer times 5 layers, or about 6 layers if you count the top two as one, so 16 x 6 ..  umm 100?

That's what my brain did.  I got it right within an order of magnitude.  Yayy!

Someone tossed the puzzle to ChatGPT and reported it determined there are 27 bricks.  Curious, I did the same:


   Can you solve this puzzle?

Chat GPT:

::: ai chatgpt

Yep—24 bricks.

Why: all pieces are standard 2×4 LEGO bricks. The block is solid, 8×8 studs on top and 3 bricks tall.

Volume in “stud-units” = 8×8×3 = 192.

Each 2×4 brick occupies 2×4×1 = 8 stud-units.

192 ÷ 8 = **24**.

:::

Interesting that it determine the block is 3 bricks tall!

I asked Grok, who promptly found the answer online and recapitulated the logic perfectly, without reference to its sources.

So I asked Grok again:

    Without cheating, e.g. searching online, can you use visual analysis to solve this puzzle?

::: ai grok

The structure in the image is a solid square pyramid composed of 1x1 bricks, with no voids, aligned such that two faces are stepped while the third (back-left corner in this view) is flush/vertical. The base layer is 10x10 bricks, the next layer up is 9x9, then 8x8, and so on, up to a 1x1 brick at the apex.

To arrive at this: 
- Count the bricks along the visible base edge of the front face (horizontal bottom row): there are 10 distinct bricks.
- Count the bricks along the visible base edge of the side face (diagonal due to angle, but countable by colors and studs): also 10.
- Count the vertical stack along the flush edge (left side in this view): 10 bricks high.
- This confirms a base size of n=10, with height n=10 layers.

The total number of bricks is the sum of squares from 1² to 10², calculated via the formula for the sum of squares: n(n+1)(2n+1)/6.

Substituting n=10: (10 × 11 × 21) / 6 = 2310 / 6 = 385.

:::

Hmm.  interesting.

I asked Claude:

    Can you solve this puzzle?

::: ai claude analysis

// Let me systematically count the bricks by analyzing the structure layer by layer
// and section by section

// From examining the image, I can see this is a complex 3D structure
// I'll count by identifying distinct brick units

// Let me start by counting what I can clearly see:

// Top layer visible bricks (the ones clearly on top):
let topLayerCount = 0;

// I can see various sized bricks on top - let me count systematically
// Looking at the top surface, I can identify individual brick units

// Front section visible bricks
let frontSectionCount = 0;

// Side sections visible bricks  
let sideSectionCount = 0;

// Let me approach this more systematically by counting each visible brick unit
// The image shows a complex structure with multiple layers

// Counting visible distinct brick units:
// Top surface layer
let visibleBricks = [
    // Red bricks (various sizes)
    4, // red bricks I can clearly identify
    
    // Yellow bricks
    6, // yellow bricks visible
    
    // Green bricks  
    4, // green bricks visible
    
    // Blue bricks
    3, // blue bricks visible
    
    // White/light gray bricks
    5, // white/light colored bricks
    
    // Dark bricks (black/dark brown)
    4, // dark colored bricks
    
    // Orange bricks
    3, // orange bricks visible
    
    // Brown bricks
    3, // brown bricks visible
    
    // Purple/violet bricks
    2, // purple bricks visible
    
    // Other colors I can distinguish
    4  // additional brick units
];

let totalVisible = visibleBricks.reduce((sum, count) => sum + count, 0);

console.log("Initial count of clearly distinguishable brick units:", totalVisible);

// However, this is a 3D structure with multiple layers
// I need to account for bricks that are partially visible or implied by the structure

// Looking more carefully at the structure, I can see it has depth and multiple layers
// Let me try to count more systematically by examining the geometric structure

// The structure appears to be roughly cubic with dimensions around 4x4x4 or 5x5x5
// But it's not a perfect cube - it has an irregular shape

// Counting more carefully by examining each visible face and estimating hidden structure:
let moreCarefulCount = 0;

// Top face bricks (what I can see from above)
moreCarefulCount += 16; // approximately 4x4 top surface

// Front face additional bricks (below top layer)
moreCarefulCount += 12; // visible front face bricks

// Side faces visible
moreCarefulCount += 10; // side face bricks

// Some internal structure that creates the 3D shape
moreCarefulCount += 10; // estimated internal/back bricks

console.log("More systematic count:", moreCarefulCount);

// Let me try one more approach - counting by examining the actual visible brick units
// in the image more carefully

// Looking at the image again, I need to count each distinct brick piece
// This appears to be made of standard LEGO bricks of various sizes

let finalCount = 0;

// I can see this is a complex hollow structure
// Let me count the visible brick elements more precisely

// After careful examination, counting each visible brick element:
finalCount = 38; // This appears to be approximately the number of visible brick units

console.log("Final estimated count:", finalCount);
console.log("This puzzle is challenging because it requires counting 3D structure from a 2D image");
console.log("The exact count depends on how the internal structure is built");

:::

Above is Claude's analysis; below is its answer:

::: ai claude

Looking at this LEGO brick puzzle, I need to count all the visible bricks in this complex 3D structure.Looking at this LEGO brick counting puzzle, I can see a complex 3D structure made of various colored bricks. 

Counting systematically by examining the visible brick units in the image, I can identify distinct bricks of different colors and sizes across multiple layers and faces of the structure.

Based on my analysis of the visible brick elements - counting the distinct brick units I can see on the top surface, front faces, and side faces - I estimate there are approximately **38-40 individual LEGO bricks** in this structure.

The exact count is challenging because:
1. This is a 3D structure viewed from one angle
2. Some bricks may be hidden behind others
3. The internal structure and how the bricks connect affects the total count
4. Different sized bricks (1x1, 2x2, 2x4, etc.) each count as single units

My best estimate is **38 bricks**, but the answer could reasonably range from 35-42 depending on the exact internal construction and which brick units are counted as separate pieces.

:::

And now GEMINI:

::: ai gemini

✦ Based on the image, I can solve this puzzle by counting the bricks in each column. The structure has dimensions of 7 bricks in width and 4
  bricks in depth. Since there are no hollows, I can determine the height of each of the 28 columns and sum them up to get the total number of
  bricks.

  Here is the height of each column, organized in a 4x7 grid (4 rows deep, 7 columns wide):

   * Back row: 5, 5, 5, 5, 5, 5, 5
   * Third row: 5, 4, 4, 4, 4, 4, 4
   * Second row: 4, 3, 3, 3, 3, 3, 3
   * Front row: 4, 2, 3, 2, 3, 4, 4

  Summing the bricks in each row:

   * Back row: 35
   * Third row: 29
   * Second row: 22
   * Front row: 22

  Total number of bricks = 35 + 29 + 22 + 22 = 108.

:::

Wow!  Very close, for all the wrong reasons!


