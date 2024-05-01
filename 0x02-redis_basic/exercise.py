#!/usr/bin/env python3
from typing import Union
import redis
import uuid
import functools

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

    def get(self, key: str, fn: callable = None):
        data = self._redis.get(key)
        if fn:
            return fn(data)
        return data

    def get_str(self, key: str) -> str:
        return self.get(key, str)

    def get_int(self, key: str) -> int:
        return self.get(key, int)

    def get_float(self, key: str) -> float:
        return self.get(key, float)

    def count_calls(fn: callable) -> callable:
        def wrapper(self, *args, **kwargs):
            self._redis.incr(fn.__qualname__)
            return fn(self, *args, **kwargs)
        return wrapper

    def call_history(fn: callable) -> callable:
        @Cache.count_calls
        def wrapper(self, *args, **kwargs):
            inputs_key = f"{fn.__qualname__}:inputs"
            outputs_key = f"{fn.__qualname__}:outputs"
            self._redis.rpush(inputs_key, str(args))
            output = fn(self, *args, **kwargs)
            self._redis.rpush(outputs_key, str(output))
            return output
        return wrapper


def call_history(method):
    @functools.wraps(method)
    def wrapper(self, *args, **kwargs):
        # Create keys for input and output lists
        input_key = method.__qualname__ + ":inputs"
        output_key = method.__qualname__ + ":outputs"

        # Append input arguments to the input list
        self.redis.rpush(input_key, str(args))

        # Execute the wrapped function to get the output
        output = method(self, *args, **kwargs)

        # Store the output in the output list
        self.redis.rpush(output_key, str(output))

        return output  # Return the output
    return wrapper
