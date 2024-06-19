#!/usr/bin/python3
"""
gets the top 10 hot posts 
for a given subbreddit
"""


import requests


def top_ten(subreddit):
    """
    returns the top 10 hot posts
    for a subreddit
    """
    if not subreddit:
        print("None\n")
    else:
        subreddit = str(subreddit)
        URL = "https://www.reddit.com/r/" + subreddit + "/hot.json"
        headers = {
            "User-Agent": "ella\'s api-advanced task 1"
        }
        hot_posts = []
        try:
            response = requests.get(URL, headers=headers)
            if response.status_code == 200:
                response = response.json()
                for post in response["data"]["children"]:
                    hot_posts.append(post)
                try:
                    for x in range(10):
                        print(hot_posts[x]["data"]["title"])
                except Exception:
                    pass
            else:
                print("None\n")
        except Exception:
            print("None\n")
