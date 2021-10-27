import unittest 
from main import *
from django.test import Client

class testgetPendingEnrollment(unittest.TestCase):
    _charges = None
    def setUp(self):
        pass
    def tearDown(self):
        pass
    
    def test_getAllLearnersPendingEnrollment(self):
        apidata = self.client.get(f"http://127.0.0.1:5000/pending/{1}")
        self.assert200(apidata)
    

    
