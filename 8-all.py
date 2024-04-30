import pymongo

def list_all(mongo_collection):
    """
    Lists all documents in a MongoDB collection.

    Args:
        mongo_collection (pymongo.collection.Collection): The pymongo collection object.

    Returns:
        list: A list of documents in the collection, or an empty list if there are no documents.
    """
    documents = []
    for document in mongo_collection.find():
        documents.append(document)
    return documents