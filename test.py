from flask import Flask, request, jsonify
from flask_sqlalchemy import SQLAlchemy
from flask_cors import CORS

import os
import sys
from os import environ

app = Flask(__name__)

app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql+mysqlconnector://root@localhost:3306/testdb'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
app.config['SQLALCHEMY_ENGINE_OPTIONS'] = {'pool_recycle': 299}

db = SQLAlchemy(app)
CORS(app)


class Engineer(db.Model):
    __tablename__ = 'engineer'

    engineerid = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(64), nullable=False)
    role = db.Column(db.String(64), nullable=False)

    def __init__(self, engineerid, name, role):
        self.engineerid = engineerid
        self.name = name
        self.role = role

    def json(self):
        return {"engineerid": self.engineerid, "name": self.name, "role": self.role}

class Course(db.Model):
    __tablename__ = 'course'

    cid = db.Column(db.Integer, primary_key=True)
    coursename = db.Column(db.String(100), nullable=False)
    description = db.Column(db.String(100), nullable=False)
    startdate = db.Column(db.Date, nullable=False)
    enddate = db.Column(db.Date, nullable=False)

    def __init__(self, cid, coursename, description, startdate, enddate):
        self.cid = cid
        self.coursename = coursename
        self.description = description
        self.startdate = startdate
        self.enddate = enddate

    def json(self):
        return {"cid": self.cid, "coursename": self.coursename, "description": self.description, "startdate": self.startdate, "enddate": self.enddate}


class Pending(db.Model):
    __tablename__ = 'pending'

    pid = db.Column(db.Integer, primary_key=True)
    eid = db.Column(db.Integer, nullable=False)
    cid = db.Column(db.Integer, nullable=False)

    def __init__(self, pid, eid, cid):
        self.pid = pid
        self.eid = eid
        self.cid = cid

    def json(self):
        return {"pid": self.pid, "eid": self.eid, "cid": self.cid}

class Classes(db.Model):
    __tablename__ = 'classes'

    classid = db.Column(db.Integer, primary_key=True)
    courseid = db.Column(db.Integer, nullable=False)
    capacity = db.Column(db.Integer, nullable=False)
    classtime = db.Column(db.DateTime, nullable=False)
    trainerid = db.Column(db.Integer, nullable=False)

    def __init__(self, classid, courseid, capacity, classtime, trainerid):
        self.classid = classid
        self.courseid = courseid
        self.capacity = capacity
        self.classtime = classtime
        self.trainerid = trainerid

    def json(self):
        return {"classid": self.classid, "courseid": self.courseid, "capacity": self.capacity, "classtime": self.classtime, "trainerid": self.trainerid}

@app.route("/getengineers")
def home():
    pass
    engineerlist = Engineer.query.all()
    if len(engineerlist):
        return jsonify(
            {
                "code": 200,
                "data": {
                    "engineers": [engineer.json() for engineer in engineerlist]
                }
            }
        )
    return jsonify(
        {
            "code": 404,
            "message": "There are no engineers."
        }
    ), 404

@app.route("/course")
def getCourses():
    courselist = Course.query.all()
    if len(courselist):
        return jsonify(
            {
                "code": 200,
                "data": {
                    "courses": [course.json() for course in courselist]
                }
            }
        )
    return jsonify(
        {
            "code": 404,
            "message": "There are no courses found in the database."
        }
    ), 404

@app.route("/pending/<courseid>")
def getPendingList(courseid):
    pendingList = Pending.query.filter_by(cid=courseid).all()
    if len(pendingList):
        return jsonify(
            {
                "code": 200,
                "data": {
                    "pending": [pending.json() for pending in pendingList]
                }
            }
        )
    return jsonify(
        {
            "code": 404,
            "message": "There are no students in the pending list for this course"
        }
    ), 404

@app.route("/class/<courseid>")
def getClassesByCourse(courseid):
    classList = Classes.query.filter_by(courseid=courseid).all() #Handle logic for getting trainer name
    if len(classList):
        return jsonify(
            {
                "code": 200,
                "data": {
                    "classList": [classes.json() for classes in classList]
                }
            }
        )
    return jsonify(
        {
            "code": 404,
            "message": "There are no classes found in the database."
        }
    ), 404





if __name__ == "__main__":
    app.run(port="5004", debug=True)
