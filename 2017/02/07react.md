---
title: react
tags: [ "react" ]
author: Rob Nugen
date: 2017-02-07T10:57:40+09:00
---

## 10:57 Tuesday 07 February 2017 JST

from https://jamesknelson.com/learn-raw-react-no-jsx-flux-es6-webpack/

<div id="react-app"></div>

<script src="https://cdn.jsdelivr.net/react/0.14.0-rc1/react.js"></script>
<script src="https://cdn.jsdelivr.net/react/0.14.0-rc1/react-dom.js"></script>
<script>
var rootElement =
  React.createElement('div', {}, 
    React.createElement('h1', {}, "React"),
    React.createElement('ul', {},
      React.createElement('li', {},
        React.createElement('h2', {}, "Mom"),
        React.createElement('a', {href: 'mailto:mom@example.com'}, 'mom@your.com')
      ),
      React.createElement('li', {},
        React.createElement('h2', {}, "Dad"),
        React.createElement('a', {href: 'mailto:dad@example.com'}, 'dad@your.com')
      )
    )
  )

ReactDOM.render(rootElement, document.getElementById('react-app'))
</script>
