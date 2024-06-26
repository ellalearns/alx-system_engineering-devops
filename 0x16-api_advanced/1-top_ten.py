#!/usr/bin/python3
"""
gets the top 10 hot posts
for a given subbreddit
"""


import requests


def top_ten(subreddit):
    """
    prints the top 10 hot posts
    for a subreddit
    """
    if not subreddit:
        print("None")
    else:
        subreddit = str(subreddit)
        URL = "https://www.reddit.com/r/" + subreddit + "/hot.json"
        headers = {
            "User-Agent": "ella\'s api-advanced task 1"
        }
        others = {
            "limit": "10"
        }
        hot_posts = []
        try:
            response = requests.get(URL,
                                    headers=headers,
                                    params=others,
                                    allow_redirects=False)
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
                print("None")
        except Exception:
            print("None")
