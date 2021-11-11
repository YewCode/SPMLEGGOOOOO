from main import *
import unittest


class TestIntegrations(unittest.TestCase):
    def setUp(self):
        self.app = app.test_client()

    def testEngineerRoute(self):
        response = self.app.get('/engineer')
        suppposedresult = {
            "code": 200,
            "data": {
                "engineers": [
                    {
                        "engineerid": 1,
                        "name": "Ben Lim",
                        "role": "Engineer"
                    },
                    {
                        "engineerid": 2,
                        "name": "John Tan",
                        "role": "Senior Engineer"
                    },
                    {
                        "engineerid": 3,
                        "name": "May Chan",
                        "role": "Senior Engineer"
                    },
                    {
                        "engineerid": 4,
                        "name": "Tiffany Lim",
                        "role": "Engineer"
                    },
                    {
                        "engineerid": 5,
                        "name": "Alice Chong",
                        "role": "Engineer"
                    },
                    {
                        "engineerid": 6,
                        "name": "Bob Chang",
                        "role": "Engineer"
                    }
                ]
            }
        }
        print(response.status)
        # this is how u test the output of the response
        # self.assertEqual( response.get_json(),suppposedresult)
        # this is how u test the status of response eg. 200 for get, 201 for post 
        self.assertEqual( response.status,'200 OK')
