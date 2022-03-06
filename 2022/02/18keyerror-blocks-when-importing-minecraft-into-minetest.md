---
title: "KeyError Blocks when importing Minecraft into Minetest"
tags: [ "minecraft", "minetest" ]
author: Rob Nugen
date: 2022-02-18T09:29:39+09:00
draft: false
---

(written 09:29 Friday 18 February 2022 JST)

I'm including the warning lines below as placeholders to say the
import process passed its initial checks and then crashed after a few minutes.

    WARNING:block:Unknown Minecraft Block:216:4
    WARNING:block:Unknown Minecraft Block:216:4
    WARNING:block:Unknown Minecraft Block:216:4
    WARNING:block:Unknown Minecraft Block:216:4
    Traceback (most recent call last):A 2:05:40 h:m:s
      File "mcimport.py", line 107, in <module>
        mtmap.save()
      File "/home/thunderrabbit/minetest/2022feb18minecraft/mcimport/block.py", line 455, in save
        for block in self.blocks:
      File "/home/thunderrabbit/minetest/2022feb18minecraft/mcimport/block.py", line 439, in fromMCMapBlocksIterator
        for mcblock in mcmap.getBlocksIterator():
      File "/home/thunderrabbit/minetest/2022feb18minecraft/mcimport/block.py", line 62, in getBlocksIterator
        blocks = self.getChunk(chkx, chkz).blocks
      File "/home/thunderrabbit/minetest/2022feb18minecraft/mcimport/block.py", line 45, in getChunk
        return MCChunk(chkx, chkz, self.world_path, self.ext)
      File "/home/thunderrabbit/minetest/2022feb18minecraft/mcimport/block.py", line 91, in __init__
        self.blocks.append(MCBlock(raw_data, (chkx, chkz), section["Y"], True))
      File "/home/thunderrabbit/minetest/2022feb18minecraft/mcimport/block.py", line 108, in __init__
        self.from_section(section)
      File "/home/thunderrabbit/minetest/2022feb18minecraft/mcimport/block.py", line 174, in from_section
        self.blocks = self.reverse_X_axis(section["Blocks"])
    KeyError: 'Blocks'
    
I tracked down the line and added some `print` statements to prove
that it visited the same, ahem, blocks of code maybe a thousand times
before crashing with `KeyError: 'Blocks'`

