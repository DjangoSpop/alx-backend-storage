#!/usr/bin/env python3
import pymongo
def insert_school(mongo_collection, **kwargs):
    """
    Inserts a new document in the collection based on kwargs.

    Args:
        mongo_collection (pymongo.collection.Collection): The pymongo collection object.
        **kwargs: The key-value pairs to be inserted as a document.

    Returns:
        str: The _id of the newly inserted document.
    """
    return mongo_collection.insert_one(kwargs).inserted_id
