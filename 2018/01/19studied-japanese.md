---
title: "フリガナも書いた"
tags: [ "日本語", "" ]
author: Rob Nugen
date: 2018-01-19T09:13:43+09:00
---

## 09:13 Friday 19 January 2018 JST

### There are probably errors in the Japanese notes below!

今朝、マインクラフトの日記項目にフリガナを書いて入れた。なんで「入れた」
と言う言葉を使うなのかはこの日記はHTMLで載せるからです。

フリガナは漢字の上で載せたいから専門的なマークアップを使えないといけない。

例えば、この文の感じの上にフリガナを書きたい。

<span style="color:blue">根気がある人はもっと専門的な物も作ります。</span>

まず、どの漢字の上にフリガナを書きたいですか？

あの漢字の前に「&#x3C;ruby&#x3E;」を書いて、その漢字の後に
「&#x3C;/ruby&#x3E;」を書きます。

それで、これを書いて、

> &#x3C;ruby&#x3E;根気&#x3C;/ruby&#x3E;がある人はもっと専門的な物も作ります。

<span style="color:blue"><ruby>根気</ruby>がある人はもっと専門的な物も作ります。</span>

を見られます。まだ変われないけど、フリガナを書きましょうか。

> &#x3C;ruby&#x3E;根気こんき&#x3C;/ruby&#x3E;がある人はもっと専門的な物も作ります。

<span style="color:blue"><ruby>根気こんき</ruby>がある人はもっと専門的な物も作ります。</span>

あっ、感じの上にはないです。

マークアップでどれは漢字とどれはフリガナが説明しないといけない。その漢字を
&#x3C;rb&#x3E;と&#x3C;/rb&#x3E;の間に入れて、

> &#x3C;ruby&#x3E;&#x3C;rb&#x3E;根気&#x3C;/rb&#x3E;こんき&#x3C;/ruby&#x3E;がある人はもっと専門的な物も作ります。

<span style="color:blue"><ruby><rb>根気</rb>こんき</ruby>がある人はもっと専門的な物も作ります。</span>

まだまだですね。最後はフリガナが&#x3C;rt&#x3E;と&#x3C;/rt&#x3E;の間入れます。

> &#x3C;ruby&#x3E;&#x3C;rb&#x3E;根気&#x3C;/rb&#x3E;&#x3C;rt&#x3E;こんき&#x3C;/rt&#x3E;&#x3C;/ruby&#x3E;がある人はもっと専門的な物も作ります。

そうすると

<span style="color:blue"><ruby><rb>根気</rb><rt>こんき</rt></ruby>がある人はもっと専門的な物も作ります。</span>

お祝い！よくできました！

しかし、実はお祝いはまだできない。なぜなら、フリガナがない感じたくさんあります。
頑張ると

> &#x3C;ruby&#x3E;&#x3C;rb&#x3E;&#x6839;&#x6C17;&#x3C;/rb&#x3E;&#x3C;rt&#x3E;
> &#x3053;&#x3093;&#x304D;&#x3C;/rt&#x3E;&#x3C;/ruby&#x3E;&#x304C;&#x3042;
> &#x308B;&#x3C;ruby&#x3E;&#x3C;rb&#x3E;&#x4EBA;&#x3C;/rb&#x3E;&#x3C;rt&#x3E;
> &#x3072;&#x3068;&#x3C;/rt&#x3E;&#x3C;/ruby&#x3E;&#x306F;&#x3082;&#x3063;
> &#x3068;&#x3C;ruby&#x3E;&#x3C;rb&#x3E;&#x5C02;&#x9580;&#x7684;&#x3C;/rb&#x3E;
> &#x3C;rt&#x3E;&#x305B;&#x3093;&#x3082;&#x3093;&#x3066;&#x304D;&#x3C;/rt&#x3E;
> &#x3C;/ruby&#x3E;&#x306A;&#x3C;ruby&#x3E;&#x3C;rb&#x3E;&#x7269;&#x3C;/rb
> &#x3E;&#x3C;rt&#x3E;&#x3082;&#x306E;&#x3C;/rt&#x3E;&#x3C;/ruby&#x3E;&#x3082;
> &#x3C;ruby&#x3E;&#x3C;rb&#x3E;&#x4F5C;&#x3C;/rb&#x3E;&#x3C;rt&#x3E;&#x3064;
> &#x304F;&#x3C;/rt&#x3E;&#x3C;/ruby&#x3E;&#x308A;&#x307E;&#x3059;&#x3002;

<span style="color:blue"><ruby><rb>根気</rb><rt>こんき</rt></ruby>があ
る<ruby><rb>人</rb><rt>ひと</rt></ruby>はもっと<ruby><rb>専門的
</rb><rt>せんもんてき</rt></ruby>な<ruby><rb>物</rb><rt>もの
</rt></ruby>も<ruby><rb>作</rb><rt>つく</rt></ruby>ります。ある
<ruby><rb>人</rb><rt>ひと</rt></ruby>は<ruby><rb>時計</rb><rt>とけい
</rt></ruby>を<ruby><rb>作</rb><rt>つく</rt></ruby>った<ruby><rb>事
</rb><rt>こと</rt></ruby>があるし、びっくりですけど、<ruby><rb>電卓
</rb><rt>でんたく</rt></ruby>も<ruby><rb>作</rb><rt>つく</rt></ruby>れ
ます。</span>

すごい！本当にできました。お疲れ様です。また来週。。。

<span class="dream">すみませんロブさん、ちょっと質問があるんだけど。どうして「&#x3C;ruby&#x3E;」が時々見られますけど時々本当の<ruby><rb>フリガナ</rb><rt>ふりがな</rt></ruby>が見られますか。</span>

あっ、それはすごく簡単です。これを書きました：

&#x3E; &#x26;#x3C;ruby&#x26;#x3E;&#x26;#x3C;rb&#x26;#x3E;&#x26;#x6839;&#x26;#x6C17;&#x26;#x3C;/rb&#x26;#x3E;&#x26;#x3C;rt&#x26;#x3E;
&#x3E; &#x26;#x3053;&#x26;#x3093;&#x26;#x304D;&#x26;#x3C;/rt&#x26;#x3E;&#x26;#x3C;/ruby&#x26;#x3E;&#x26;#x304C;&#x26;#x3042;
&#x3E; &#x26;#x308B;&#x26;#x3C;ruby&#x26;#x3E;&#x26;#x3C;rb&#x26;#x3E;&#x26;#x4EBA;&#x26;#x3C;/rb&#x26;#x3E;&#x26;#x3C;rt&#x26;#x3E;
&#x3E; &#x26;#x3072;&#x26;#x3068;&#x26;#x3C;/rt&#x26;#x3E;&#x26;#x3C;/ruby&#x26;#x3E;&#x26;#x306F;&#x26;#x3082;&#x26;#x3063;
&#x3E; &#x26;#x3068;&#x26;#x3C;ruby&#x26;#x3E;&#x26;#x3C;rb&#x26;#x3E;&#x26;#x5C02;&#x26;#x9580;&#x26;#x7684;&#x26;#x3C;/rb&#x26;#x3E;
&#x3E; &#x26;#x3C;rt&#x26;#x3E;&#x26;#x305B;&#x26;#x3093;&#x26;#x3082;&#x26;#x3093;&#x26;#x3066;&#x26;#x304D;&#x26;#x3C;/rt&#x26;#x3E;
&#x3E; &#x26;#x3C;/ruby&#x26;#x3E;&#x26;#x306A;&#x26;#x3C;ruby&#x26;#x3E;&#x26;#x3C;rb&#x26;#x3E;&#x26;#x7269;&#x26;#x3C;/rb
&#x3E; &#x26;#x3E;&#x26;#x3C;rt&#x26;#x3E;&#x26;#x3082;&#x26;#x306E;&#x26;#x3C;/rt&#x26;#x3E;&#x26;#x3C;/ruby&#x26;#x3E;&#x26;#x3082;
&#x3E; &#x26;#x3C;ruby&#x26;#x3E;&#x26;#x3C;rb&#x26;#x3E;&#x26;#x4F5C;&#x26;#x3C;/rb&#x26;#x3E;&#x26;#x3C;rt&#x26;#x3E;&#x26;#x3064;
&#x3E; &#x26;#x304F;&#x26;#x3C;/rt&#x26;#x3E;&#x26;#x3C;/ruby&#x26;#x3E;&#x26;#x308A;&#x26;#x307E;&#x26;#x3059;&#x26;#x3002;

<span class="dream">.&#xB7;&#xB4;&#xAF;&#x60;(&#x3E;&#x434;&#x3C;)&#xB4;&#xAF;&#x60;&#xB7;.</span>

-------------------


This morning, in my Minecraft journal entry, I inserted *furigana*.
Why do I use the word 'insert'? Because this journal is displayed
using HTML.

I have to use some technical markup to add furigana above the kanji.

For example, I want to write furigana above the kanji in this
sentence.

<span style="color:blue">根気がある人はもっと専門的な物も作ります。</span>

First, above which kanji do we want to write furigana?

Before the kanji write "&#x3C;ruby&#x3E;" and after the kanji write "&#x3C;/ruby&#x3E;".

That way, we write this:

> &#x3C;ruby&#x3E;根気&#x3C;/ruby&#x3E;がある人はもっと専門的な物も作ります。

and see this:

<span style="color:blue"><ruby>根気</ruby>がある人はもっと専門的な物も作ります。</span>

No change, but shall we write the furigana?

> &#x3C;ruby&#x3E;根気こんき&#x3C;/ruby&#x3E;がある人はもっと専門的な物も作ります。

<span style="color:blue"><ruby>根気こんき</ruby>がある人はもっと専門的
な物も作ります。</span>

Hmm.  It's not above the kanji.

In markup, we have to explain which is the kanji and which is the
furigana.  We put the kanji inside &#x3C;rb&#x3E; and &#x3C;/rb&#x3E;tags.

> &#x3C;ruby&#x3E;&#x3C;rb&#x3E;根気&#x3C;/rb&#x3E;こんき&#x3C;/ruby&#x3E;がある人はもっと専門的な物も作ります。

<span style="color:blue"><ruby><rb>根気</rb>こんき</ruby>がある人はもっと専門的な物も作ります。</span>

But we are still not done.  Finally, we put the furigana between &#x3C;rt&#x3E; and &#x3C;/rt&#x3E;.

> &#x3C;ruby&#x3E;&#x3C;rb&#x3E;根気&#x3C;/rb&#x3E;&#x3C;rt&#x3E;こんき&#x3C;/rt&#x3E;&#x3C;/ruby&#x3E;がある人はもっと専門的な物も作ります。

Do that, and we get

<span style="color:blue"><ruby><rb>根気</rb><rt>こんき</rt></ruby>がある人はもっと専門的な物も作ります。</span>

Hooray!  We did it!

But actually, we cannot celebrate yet.  There are still many kanji
without furigana!  Let's do all those:

> &#x3C;ruby&#x3E;&#x3C;rb&#x3E;&#x6839;&#x6C17;&#x3C;/rb&#x3E;&#x3C;rt&#x3E;
> &#x3053;&#x3093;&#x304D;&#x3C;/rt&#x3E;&#x3C;/ruby&#x3E;&#x304C;&#x3042;
> &#x308B;&#x3C;ruby&#x3E;&#x3C;rb&#x3E;&#x4EBA;&#x3C;/rb&#x3E;&#x3C;rt&#x3E;
> &#x3072;&#x3068;&#x3C;/rt&#x3E;&#x3C;/ruby&#x3E;&#x306F;&#x3082;&#x3063;
> &#x3068;&#x3C;ruby&#x3E;&#x3C;rb&#x3E;&#x5C02;&#x9580;&#x7684;&#x3C;/rb&#x3E;
> &#x3C;rt&#x3E;&#x305B;&#x3093;&#x3082;&#x3093;&#x3066;&#x304D;&#x3C;/rt&#x3E;
> &#x3C;/ruby&#x3E;&#x306A;&#x3C;ruby&#x3E;&#x3C;rb&#x3E;&#x7269;&#x3C;/rb
> &#x3E;&#x3C;rt&#x3E;&#x3082;&#x306E;&#x3C;/rt&#x3E;&#x3C;/ruby&#x3E;&#x3082;
> &#x3C;ruby&#x3E;&#x3C;rb&#x3E;&#x4F5C;&#x3C;/rb&#x3E;&#x3C;rt&#x3E;&#x3064;
> &#x304F;&#x3C;/rt&#x3E;&#x3C;/ruby&#x3E;&#x308A;&#x307E;&#x3059;&#x3002;

<span style="color:blue"><ruby><rb>根気</rb><rt>こんき</rt></ruby>があ
る<ruby><rb>人</rb><rt>ひと</rt></ruby>はもっと<ruby><rb>専門的
</rb><rt>せんもんてき</rt></ruby>な<ruby><rb>物</rb><rt>もの
</rt></ruby>も<ruby><rb>作</rb><rt>つく</rt></ruby>ります。ある
<ruby><rb>人</rb><rt>ひと</rt></ruby>は<ruby><rb>時計</rb><rt>とけい
</rt></ruby>を<ruby><rb>作</rb><rt>つく</rt></ruby>った<ruby><rb>事
</rb><rt>こと</rt></ruby>があるし、びっくりですけど、<ruby><rb>電卓
</rb><rt>でんたく</rt></ruby>も<ruby><rb>作</rb><rt>つく</rt></ruby>れ
ます。</span>

Awesome!  We really did it!  Great work!  See you next week!

<span class="dream">Sorry, Rob, but I have a question.  How did you
display "&#x3C;ruby&#x3E;" sometimes, but other times, the actual <ruby><rb>furigana</rb><rt>ふりがな</rt></ruby>?</span>

Oh that was easy!  I just wrote this:

&#x3E; &#x26;#x3C;ruby&#x26;#x3E;&#x26;#x3C;rb&#x26;#x3E;&#x26;#x6839;&#x26;#x6C17;&#x26;#x3C;/rb&#x26;#x3E;&#x26;#x3C;rt&#x26;#x3E;
&#x3E; &#x26;#x3053;&#x26;#x3093;&#x26;#x304D;&#x26;#x3C;/rt&#x26;#x3E;&#x26;#x3C;/ruby&#x26;#x3E;&#x26;#x304C;&#x26;#x3042;
&#x3E; &#x26;#x308B;&#x26;#x3C;ruby&#x26;#x3E;&#x26;#x3C;rb&#x26;#x3E;&#x26;#x4EBA;&#x26;#x3C;/rb&#x26;#x3E;&#x26;#x3C;rt&#x26;#x3E;
&#x3E; &#x26;#x3072;&#x26;#x3068;&#x26;#x3C;/rt&#x26;#x3E;&#x26;#x3C;/ruby&#x26;#x3E;&#x26;#x306F;&#x26;#x3082;&#x26;#x3063;
&#x3E; &#x26;#x3068;&#x26;#x3C;ruby&#x26;#x3E;&#x26;#x3C;rb&#x26;#x3E;&#x26;#x5C02;&#x26;#x9580;&#x26;#x7684;&#x26;#x3C;/rb&#x26;#x3E;
&#x3E; &#x26;#x3C;rt&#x26;#x3E;&#x26;#x305B;&#x26;#x3093;&#x26;#x3082;&#x26;#x3093;&#x26;#x3066;&#x26;#x304D;&#x26;#x3C;/rt&#x26;#x3E;
&#x3E; &#x26;#x3C;/ruby&#x26;#x3E;&#x26;#x306A;&#x26;#x3C;ruby&#x26;#x3E;&#x26;#x3C;rb&#x26;#x3E;&#x26;#x7269;&#x26;#x3C;/rb
&#x3E; &#x26;#x3E;&#x26;#x3C;rt&#x26;#x3E;&#x26;#x3082;&#x26;#x306E;&#x26;#x3C;/rt&#x26;#x3E;&#x26;#x3C;/ruby&#x26;#x3E;&#x26;#x3082;
&#x3E; &#x26;#x3C;ruby&#x26;#x3E;&#x26;#x3C;rb&#x26;#x3E;&#x26;#x4F5C;&#x26;#x3C;/rb&#x26;#x3E;&#x26;#x3C;rt&#x26;#x3E;&#x26;#x3064;
&#x3E; &#x26;#x304F;&#x26;#x3C;/rt&#x26;#x3E;&#x26;#x3C;/ruby&#x26;#x3E;&#x26;#x308A;&#x26;#x307E;&#x26;#x3059;&#x26;#x3002;

<span class="dream">&#x3A;&#x2D;&#x28;</span>
