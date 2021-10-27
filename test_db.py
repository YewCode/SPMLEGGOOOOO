import unittest 
from main import *

class testgetPendingEnrollment(unittest.TestCase):
    _charges = None
    def setUp(self):
      pass
    def tearDown(self):
        pass
    
    def test_getAllLearnersPendingEnrollment(self):
        apidata = self.client.get(f"/pending/{1}")
        self.assert200(apidata)
    

    
