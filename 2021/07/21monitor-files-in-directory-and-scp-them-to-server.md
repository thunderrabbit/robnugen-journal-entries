---
title: "monitor files in directory and scp them to server"
tags: [ "bash", "scp", "help" ]
author: Rob Nugen
date: 2021-07-21T12:12:40+09:00
draft: false
---

I just posted on Reddit: [monitor files in directory and scp them to server](https://www.reddit.com/r/bash/comments/oohgee/monitor_files_in_directory_and_scp_them_to_server/)

I found [Monitor Directory for New Files](https://www.reddit.com/r/bash/comments/6jzkvl/monitor_directory_for_new_files/) and now can send to `STDOUT` a list of file names as they are saved:

```
inotifywait -mre modify . | stdbuf -oL uniq | sed -e 's/ MODIFY //'
```

I tried wrapping the above in `$( )` to let `scp` send the modified files to my server:

```
scp -P 22 -i /home/robnugen/privatekey $(inotifywait -mre modify . | stdbuf -oL uniq | sed -e 's/ MODIFY //') robnugen@remote:path  
```

But the files are not being sent to the server.

In front of `sed`, I tried `stdbuf -oL` and `-u` but neither helped.

The `scp` command works if I just use a filename in where I have the backticks above. i.e. this works:

```
scp -P 22 -i /home/robnugen/privatekey hello.txt robnugen@remote:path
```

How can I send filenames from `STDOUT` for use in `scp`?