import unittest

from flask.json import dump
from main import *
import json

class testEngineer(unittest.TestCase):
    
    def setUp(self):
        self.__engineer = Engineer(1, "Ben Lim", "Engineer")
        
    def test_EDetails(self):
        expected_json = {"engineerid": 1, "name": "Ben Lim", "role": "Engineer"}
        
        self.assertEqual(json.dumps(self.__engineer.json()), json.dumps(expected_json))
        

class testCourse(unittest.TestCase):
    
    def setUp(self):
        self.__course = Course(5, "SPM", "An awesome module about project management that makes use of agile development", "2021-11-23", "2022-11-23", "images/spm.png")
        
    def test_CourseDetails(self):
        expected_json = {"cid": 5, "coursename": "SPM", "coursedescription": "An awesome module about project management that makes use of agile development", "startdate": "2021-11-23", "enddate": "2022-11-23", "courseimg": "images/spm.png"}
        
        self.assertEqual(json.dumps(self.__course.json()), json.dumps(expected_json))
        

class testCourse_Trainer(unittest.TestCase):
    
    def setUp(self):
        self.__coursetrainer = Course_Trainer(2, 1)
        
    def test_EDetails(self):
        expected_json = {"cid": 2, "eid": 1}
        
        self.assertEqual(json.dumps(self.__coursetrainer.json()), json.dumps(expected_json))
        
    
    
    
if __name__ == "__main__":
    unittest.main()