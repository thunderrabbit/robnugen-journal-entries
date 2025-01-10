---
title: "If this works, issue 4 is fixed!"
tags: [ "2025", "" ]
author: Rob Nugen
date: 2025-01-10T22:13:00+09:00
draft: false
---

<pre>
if($successful_merge){
    $output = [];
    exec(
        command: "/home/barefoot_rob/scripts/update_robnugen.com_journal.sh",
        output: $output,
        result_code: $resultCode
    );
}
</pre>

Let's see!