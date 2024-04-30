#!/usr/bin/env python3
import pymongo
def update_topics(mongo_collection, name, topics):
    """
    Changes all topics of a school document based on the name.

    Args:
        mongo_collection (pymongo.collection.Collection): The pymongo collection object.
        name (str): The name of the school to update.
        topics (list): The list of new topics.
    """
    mongo_collection.update_many({"name": name}, {"$set": {"topics": topics}})
    