import unittest 
from main import *
from django.test import TestCase
from django.test.utils import override_settings


class testgetPendingEnrollment(TestCase):
    _charges = None
    def setUp(self):
        pass
    def tearDown(self):
        pass
    
    def test_getAllLearnersPendingEnrollment(self):
        apidata = self.client.get(f"/pending/{1}")
        print(apidata)
        self.assert200(apidata)
    

    
