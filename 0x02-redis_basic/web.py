import redis
import requests
"""_summary_
get page and use the count in redis
to get the request has been made to
the url
"""


def get_page(url: str) -> str:
    url = 'http://slowwly.robertomurray.co.uk'
    requests.get(url)
    redis_client = redis.Redis()

    # Increment the count for the URL
    url_count_key = f"count:{url}"
    redis_client.incr(url_count_key)

    # Cache the result with an expiration time of 10 seconds
    result_key = f"result:{url}"
    redis_client.set(result_key, get_page(url))
    redis_client.expire(result_key, 10)
