import unittest 
from main import *
import django
from django.test import TestCase
from django.test.utils import override_settings


class testingIntegration(TestCase):
    _charges = None
    def setUp(self):
        pass
    def tearDown(self):
        pass
    
    def test_getEngineerByEID(self):
        apidata = self.client.get(f"/engineer/{1}")
        print(apidata)
        self.assert200(apidata)
    

    
