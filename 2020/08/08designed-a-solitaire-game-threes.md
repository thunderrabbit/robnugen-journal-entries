---
date: '2020-08-08T04:11:30+09:00'
entry_title: 'designed a solitaire game: threes'
journal: 'https://robnugen.com'
posttype: journal
published: true
slug: designed-a-solitaire-game-threes
title: 'designed a solitaire game: threes'
---

Lin's mom has been playing a game of solitaire in which if she tries to put all the cards into pairs.  Because her target is to put all the cards in pairs she ends up spending most of the time shuffling so that she doesn't have the pairs automatically there.

In my head, I just designed a game of solitaire that will shuffle the cards for her and not use the number four, which means death in Japanese.

The target of Threes is to put all of the cards into ordered collection stacks per suit. Spades' order will be Ace through King.  The three other suits will be ordered King through Ace.

Starting with the deck face down, take the top three cards off the deck and turn them face-up in a mini stack.  If the top card is an Ace of Spades or any of the three King cards, put that card into a collection stack according to the suit.

If the next visible card in the mini stack is numerically adjacent to the top card in its suit's collection stack, put it on its appropriate stack.

In the much more likely case that no cards can go onto any of the collection stacks, take the top three cards off the upside down deck and place them on the mini upright stack.

If the next visible card in the mini stack is numerically adjacent to the top card in its suit's collection stack, put it on its appropriate stack.

Repeat this process, essentially looking at every third card to see if it is next in the order of its particular suit.  You can go through the deck three times this way.  If you end up with all the cards laid out in order per suit, you win; if not, you lose.
