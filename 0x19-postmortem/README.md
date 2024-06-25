# Postmortem

Here is the account of how an (imaginary 😉) issue that occurred on our team's web server led to our web servers going down. And how the CEO almost fired us all 😭😭😭
---
![chaooos](https://media2.giphy.com/media/137TKgM3d2XQjK/giphy.gif)
---

## Issue Summary TLDR ;)
---
On June 2nd, 2024 from 8pm we noticed that our web servers were down. All requests coming in received 500 server code responses. At least 90% of our users were affected. That meant… users may have been already looking for alternatives to our software 🙃 
We found out that the root cause was a DDoS attack on our server after a push to production modified CORS settings.

---

## Timeline (For all timestamp nerds 😉)
---
- 4:30 PM: Push to production code
- 8:15 PM: We start getting alerts from the monitoring system about frequent code 500 responses
- 8:38 PM: On call engineer responds
- 9:20 PM: A roll back is implemented
- 9:30 PM: Web servers are back. Our legit users are getting code 200 responses.
---

## Root cause and resolution
---
The root cause was a change to our CORS settings making the web server available to requests from any domain. That opened up our service to random and malicious requests. And our users were adversely affected. We fixed the issue by rolling back the changes made to the system. 
---

## Corrective and preventative measures
---
To prevent this from happening again (cos we had to 😅):
- We put in place a check in our CI/CD system to warn the code merger about changes to important settings like CORS.
- We put up a policy where every push must be reviewed by a senior engineer.
- We implemented automation, so the server automatically rolls back to the previous version if serious bugs arise soon after a push.
---
![the chaos dare not show up now](https://media3.giphy.com/media/E5t4lrTgDYheZ8uiuv/giphy.gif)
---

## Aftermath
---
The on-call engineer now looks at cute kittens on duty 😍
---
![cute kitten](https://media.giphy.com/media/vFKqnCdLPNOKc/giphy.gif)


