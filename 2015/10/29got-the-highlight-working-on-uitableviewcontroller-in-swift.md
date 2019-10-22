---
title: Got the highlight working on UITableViewController in Swift
tags: [ "swift", "programming" ]
author: Rob Nugen
date: 2015-10-29T17:58:26+09:00
---

## 17:58 Thursday 29 October 2015 JST

<pre>
override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        NSNotificationCenter.defaultCenter().postNotificationName(Constants.NotificationKey.SelectedWordFromList, object: nil, userInfo: ["word": allVocabularyWords[indexPath.row]])
}
</pre>

Now, I understand the code inside the function is a laugh and 1/2, but
it works and I'm leaving it until I know how to do it in a more
canonical way.  But anyway, highlighting words in the word list will
now cause the words' deets to be displayed on the detail pane.
