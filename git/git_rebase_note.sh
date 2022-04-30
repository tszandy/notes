# in other branch
git rebase master

# in any branch
git rebase master topic


*   commit ab193bd19666219cc90d8b98812036a0f5d22a88
|\  Merge: 24a155a f94eb72
| | Author: wei xie <444980834@qq.com>
| | Date:   Wed Oct 20 18:22:33 2021 -0700
| |
| |     merge
| |
| * commit f94eb72c22246c75d134a7fc078c2e64799707de
| | Author: wei <444980834@qq.com>
| | Date:   Mon Sep 13 15:40:23 2021 -0400
| |
| |     update bash note
| |
| * commit 8bbc3a44dbc73ab6e122c5b50584849bd9d729ff
| | Author: wei <444980834@qq.com>
| | Date:   Sun Sep 12 23:01:33 2021 -0400
| |
| |     update bash note
| |
| * commit 70314c41e1400acb2454d29bf2daa18028d6046e
| | Author: wei <444980834@qq.com>
| | Date:   Thu Sep 9 13:35:58 2021 -0400
| |
| |     update kali docker image
| |
* | commit 24a155a298c0519574cfa50b587ebfb27db99f63
|/  Author: wei xie <444980834@qq.com>
|   Date:   Wed Oct 20 18:16:31 2021 -0700
|
|       update notes
|
* commit 9dbb82cfa9ce837ccb0fd2bbe708d7c33379a808
| Author: wei <444980834@qq.com>
| Date:   Wed Sep 8 17:43:31 2021 -0400
|
|     update python note
|

# git make log linear, git rebase split commit
git rebase 24a155a298c0519574cfa50b587ebfb27db99f63

git rebase --interactive ${commit}^
