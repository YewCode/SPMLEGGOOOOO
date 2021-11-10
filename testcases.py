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
        
    def test_CourseTrainerDetails(self):
        expected_json = {"cid": 2, "eid": 1}
        
        self.assertEqual(json.dumps(self.__coursetrainer.json()), json.dumps(expected_json))
        
class testCourse_Enrolled(unittest.TestCase):
    
    def setUp(self):
        self.__courseenrolled = Course_Enrolled(2, 1, "active",1)
        
    def test_CourseEnrolledDetails(self):
        expected_json = {"cid": 2, "eid": 1, "active":"active", "classid":1}
        
        self.assertEqual(json.dumps(self.__courseenrolled.json()), json.dumps(expected_json)) 

class testCourse_EnrollmentPending(unittest.TestCase):
    
    def setUp(self):
        self.__courseenrollmentpending = Course_EnrollmentPending(2, 1, 0)
        
    def test_CourseEnrollmentPendingDetails(self):
        expected_json = {"cid": 2, "eid": 1, "active":0}
        
        self.assertEqual(json.dumps(self.__courseenrollmentpending.json()), json.dumps(expected_json)) 

class testCourse_Completed(unittest.TestCase):
    
    def setUp(self):
        self.__coursecompleted = Course_Completed(2, 1)
        
    def test_CourseCompletedDetails(self):
        expected_json = {"cid": 2, "eid": 1}
        
        self.assertEqual(json.dumps(self.__coursecompleted.json()), json.dumps(expected_json)) 

class testSection(unittest.TestCase):
    
    def setUp(self):
        self.__section = Section(2, 1, 1, "Section 2")
        
    def test_SectionDetails(self):
        expected_json = {"sectionid": 2, "classid": 1, "courseid": 1, "sectionName": "Section 2"}
        
        self.assertEqual(json.dumps(self.__section.json()), json.dumps(expected_json))

class testClasses(unittest.TestCase):
    
    def setUp(self):
        self.__classes = Classes(2, 1, 40, "Friday 12.00pm")
        
    def test_ClassesDetails(self):
        expected_json = {"classid": 2, "courseid": 1, "capacity": 40, "classtime": "Friday 12.00pm"}
        
        self.assertEqual(json.dumps(self.__classes.json()), json.dumps(expected_json))  


class testClass_Trainer(unittest.TestCase):
    
    def setUp(self):
        self.__coursetrainer = Class_Trainer(2, 1, 2)
        
    def test_TrainerDetails(self):
        expected_json = {"classid": 2, "courseid": 1, "eid": 2}
        
        self.assertEqual(json.dumps(self.__coursetrainer.json()), json.dumps(expected_json))  

class testMaterial(unittest.TestCase):
    
    def setUp(self):
        self.__materials = Material(25,"Rick&Roll","https://www.youtube.com/embed/dQw4w9WgXcQ", 0, 1, 1, 1)
        
    def test_MaterialsDetails(self):
        expected_json = {"materialid": 25, "filename": "Rick&Roll", "url": "https://www.youtube.com/embed/dQw4w9WgXcQ", "isHidden": 0, "classid": 1, "courseid": 1, "sectionid": 1}
        
        self.assertEqual(json.dumps(self.__materials.json()), json.dumps(expected_json)) 

class testQuiz(unittest.TestCase):
    
    def setUp(self):
        self.__quiz = Quiz(1, 1, 1, 1, "Class 1 Section 1 Quiz", "60.00", 0, 50)
        
    def test_QuizDetails(self):
        expected_json = {"quizid": 1, "courseid": 1, "classid": 1, "sectionid": 1, "quiz_name": "Class 1 Section 1 Quiz", "timelimit": "60.00", "isHidden": 0, "passing_requirements": 50}
        
        self.assertEqual(json.dumps(self.__quiz.json()), json.dumps(expected_json)) 

class testQuestion(unittest.TestCase):
    
    def setUp(self):
        self.__question = Question(1, 1, "T/F", "Earth is flat, True or False?", "['True','False']", "True")
        
    def test_QnsDetails(self):
        expected_json = {"quizid": 1, "qnNum": 1, "qn_type": "T/F", "qn_Description": "Earth is flat, True or False?", "options": "['True','False']", "answer": "True"}
        
        self.assertEqual(json.dumps(self.__question.json()), json.dumps(expected_json)) 

#test case failed
# class testQuiz_Attempt(unittest.TestCase):
    
#     def setUp(self):
#         self.__quizattempt = Quiz_Attempt(1, 1, 5, 1, 2, 'True'),
        
#     def test_QuizAttempt(self):
#         expected_json = {"engineerid": 1, "quizid": 1, "id": 5, "attemptID": 1, "qnNum": 2, "given_answer": "True"}
        
#         self.assertEqual(json.dumps(self.__quizattempt.json()), json.dumps(expected_json)) 

class testPre_Requisites(unittest.TestCase):
    
    def setUp(self):
        self.__prerequisites = Pre_Requisites(2, 3)
        
    def test_Pre_RequisitesDetails(self):
        expected_json = {"prerequisites_cid": 2, "for_cid": 3}
        
        self.assertEqual(json.dumps(self.__prerequisites.json()), json.dumps(expected_json)) 

if __name__ == "__main__":
    unittest.main()