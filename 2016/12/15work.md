---
title: work
tags: work
author: Rob Nugen
date: 2016-12-15T17:24:25+09:00
---

## 17:24 Thursday 15 December 2016 JST

Worked on iPhone app a bit, wiping out the paddle and balls from
breakout style, and just allowed touching the bricks to destroy them.
I added little explosion impulse (reverse gravity) when each brick is
destroyed so it's like they explode and blow the other bricks around
the screen.

    func breakBlock(_ node: SKNode) {
      // boom simulates an explosion which affects blocks around the block
      let boom = SKFieldNode.radialGravityField()
      boom.strength = -0.5
      boom.categoryBitMask = BlockCategory
      boom.region = SKRegion(radius: Float(node.frame.size.width) * 2)
      boom.position = node.position
      boom.falloff = 4
      boom.run(SKAction.sequence([
          SKAction.strength(to: 0, duration: 1.0),
          SKAction.removeFromParent()
          ]))
      addChild(boom)
      node.removeFromParent()
    }

Swift (along with SpriteKit) is pretty easy to work with for this kind of thing.
