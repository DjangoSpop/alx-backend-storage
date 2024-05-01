#!/usr/bin/env python3
from typing import Union
from typing import Callable
import redis
import uuid
import functools
from redis import Redis
from typing import Callable

"""_summary_

    Returns:
        _type_: _description_
"""


class Cache:
    def __init__(self, host='localhost', port=6379):
        self._redis = redis.Redis()
        self._redis.flushdb()

    def store(self, data: Union[str, bytes, int, float]) -> str:
        key = str(uuid.uuid4())
        self._redis.set(key, data)
        return key
    
    def count_calls(self, key: str) -> int:
    
        return int(self._redis.get(key)) if self._redis.exists(key) else 0
    @functools.wraps(store)
    def call_counting_decorator(func):
        def wrapper(self, *args, **kwargs):
            key = func(*args, **kwargs)
            self._redis.incr(key)
            return key
        
        return wrapper
    redis_client = Redis()
    def call_history (self, func: Callable) -> Callable:
        @functools.wraps(func)
        def wrapper(*args, **kwargs):
            key = func(*args, **kwargs)
   
            self.redis_client.lpush(func.__name__, key)

            return key
        return wrapper
    def replay(self, func: Callable) -> list:
        return self.redis_client.lrange(func.__name__, 0, -1)

         