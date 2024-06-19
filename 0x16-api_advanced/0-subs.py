#!/usr/bin/python3
"""
query a subreddit in the Reddit API
get the number of subscribers
"""


import requests


def number_of_subscribers(subreddit):
    """
    gets the number of subscribers ..
    .. of a subreddit
    """
    if not subreddit:
        return 0
    else:
        subreddit = str(subreddit)
        URL = "https://www.reddit.com/r/" + subreddit + "/about.json"
        try:
            response = requests.get(URL)
            print(response.status_code)
            if response.status_code != 200:
                return 0
            else:
                response = response.json()
                number_of_subscribers = response["data"]["subscribers"]
                return number_of_subscribers
        except Exception:
            return 0
