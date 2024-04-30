#!/usr/bin/env python3
def top_students(mongo_collection):
    """_summary_

    Args:
        mongo_collection (_type_): _description_

    Returns:
        _type_: _description_
    """    
    students = mongo_collection.find()
    sorted_students = sorted(students, key=lambda x: x['averageScore'], reverse=True)
    return sorted_students