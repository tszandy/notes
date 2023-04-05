https://abseil.io/resources/swe-book/html/toc.html

Hyrum’s Law
With a sufficient number of users of an API, it does not matter what you promise in the contract: all observable behaviors of your system will be depended on by somebody.
Hyrum's law basically means: Whatever you deliver, someone is going to use it in a way you never imagined
Change is necessary and will eventually break someone's system
Give more explicit information on your interface to reduce the number of implicit assumptions
Make fewer assumptions about code and, if applicable, test its behavior


The Beyoncé Rule
The straightforward answer is: test everything that you don't want to break. In other words, if you want to be confident that a system exhibits a particular behavior, the only way to be sure it will is to write an automated test for it.

What do we mean by cost?  We are not only talking about dollars here. “Cost” roughly translates to effort and can involve any or all of these factors:
Financial costs (e.g., money)
Resource costs (e.g., CPU time)
Personnel costs (e.g., engineering effort)
Transaction costs (e.g., what does it cost to take action?)
Opportunity costs (e.g., what does it cost to not take action?)
Societal costs (e.g., what impact will this choice have on society at large?)

