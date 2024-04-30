#!/usr/bin/env python3
import pymongo

def schools_by_topic(mongo_collection, topic):
    """
    Returns the list of school having a specific topic.

    Args:
        mongo_collection (pymongo.collection.Collection): The pymongo collection object.
        topic (str): The topic to search for.

    Returns:
        list: A list of school documents having the topic.
    """
    return list(mongo_collection.find({"topics": topic}))
