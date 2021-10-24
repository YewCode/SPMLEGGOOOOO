from flask import Flask,request,jsonify
from flask_sqlalchemy import SQLAlchemy


app = Flask(__name__)

app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql+mysqlconnector://root@localhost:3306/spmproject'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
 
db = SQLAlchemy(app)
   
class Course(db.Model):
    __tablename__ = 'course'
 
    cid = db.Column(db.Integer, primary_key=True)
    course_name = db.Column(db.String(100), nullable=False)
    course_desc =db.Column(db.String(500), nullable=False)
 
    def __init__(self, cid, course_name, course_desc):
        self.cid = cid
        self.course_name = course_name
        self.course_desc = course_desc
 
    def json(self):
        return {"cid": self.cid, "course_name": self.course_name, "course_desc": self.course_desc}
    
class Course_Trainer(db.Model):
    __tablename__ = 'course_trainer'
 
    cid = db.Column(db.Integer, primary_key=True)
    eid = db.Column(db.Integer, primary_key=True)
 
    def __init__(self, cid,eid):
        self.cid = cid
        self.eid = eid
 
    def json(self):
        return {"cid": self.cid, "eid": self.eid }
    
class Course_Assigned(db.Model):
    __tablename__ = 'course_assigned'
 
    cid = db.Column(db.Integer, primary_key=True)
    eid = db.Column(db.Integer, primary_key=True)
    assignment_reason = db.Column(db.String(100), nullable=False)

    def __init__(self, cid,eid,assignment_reason):
        self.cid = cid
        self.eid = eid
        self.assignment_reason = assignment_reason
 
    def json(self):
        return {"cid": self.cid, "eid": self.eid, "assignment_reason":self.assignment_reason }
    
class Course_Enrolled(db.Model):
    __tablename__ = 'Course_Enrolled'
 
    cid = db.Column(db.Integer, primary_key=True)
    eid = db.Column(db.Integer, primary_key=True)
    active = db.Column(db.String(100), nullable=False)

    def __init__(self, cid,eid,active):
        self.cid = cid
        self.eid = eid
        self.active = active
 
    def json(self):
        return {"cid": self.cid, "eid": self.eid, "active":self.active }

class Course_EnrollmentPending(db.Model):
    __tablename__ = 'Course_EnrollmentPending'
 
    cid = db.Column(db.Integer, primary_key=True)
    eid = db.Column(db.Integer, primary_key=True)
    active = db.Column(db.String(100), nullable=False)

    def __init__(self, cid,eid,active):
        self.cid = cid
        self.eid = eid
        self.active = active
 
    def json(self):
        return {"cid": self.cid, "eid": self.eid, "active":self.active }
    
class Course_Completed(db.Model):
    __tablename__ = 'course_completed'
 
    cid = db.Column(db.Integer, primary_key=True)
    eid = db.Column(db.Integer, primary_key=True)
 
    def __init__(self, cid,eid):
        self.cid = cid
        self.eid = eid
 
    def json(self):
        return {"cid": self.cid, "eid": self.eid }
 
@app.route("/course")
def getCourse():
    
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
            "message": "There are no courses."
        }
    ), 404

@app.route("/course/<int: cid>")
def getCourseByCid(cid):
    
    courselist = Course.query.filter_by(cid=cid)
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
            "message": "There are no courses."
        }
    ), 404
    

@app.route("/course_trainer/cid/<int: cid>")
def getCourseTrainerByCid(cid):
    
    coursetrainerlist = Course_Trainer.query.filter_by(cid=cid)
    if len(coursetrainerlist):
        return jsonify(
            {
                "code": 200,
                "data": {
                    "courses": [coursetrainer.json() for coursetrainer in coursetrainerlist]
                }
            }
        )
    return jsonify(
        {
            "code": 404,
            "message": "There are no course trainer for course id: "+cid + '.' 
        }
    ), 404
    
@app.route("/course_trainer/eid/<int: eid>")
def getCourseTrainerByEid(eid):
    
    coursetrainerlist = Course_Trainer.query.filter_by(eid=eid)
    if len(coursetrainerlist):
        return jsonify(
            {
                "code": 200,
                "data": {
                    "courses": [coursetrainer.json() for coursetrainer in coursetrainerlist]
                }
            }
        )
    return jsonify(
        {
            "code": 404,
            "message": "There are no course trainer for course id: "+cid + '.' 
        }
    ), 404
    
@app.route("/Course_Assigned/cid/<int: cid>")
def getCourseAssignedByCid(cid):
    
    coursetrainerlist = Course_Assigned.query.filter_by(cid=cid)
    if len(coursetrainerlist):
        return jsonify(
            {
                "code": 200,
                "data": {
                    "courses": [coursetrainer.json() for coursetrainer in coursetrainerlist]
                }
            }
        )
    return jsonify(
        {
            "code": 404,
            "message": "There are no course trainer for course id: "+cid + '.' 
        }
    ), 404
    
@app.route("/Course_Assigned/eid/<int: eid>")
def getCourseAssignedByEid(eid):
    
    coursetrainerlist = Course_Assigned.query.filter_by(eid=eid)
    if len(coursetrainerlist):
        return jsonify(
            {
                "code": 200,
                "data": {
                    "courses": [coursetrainer.json() for coursetrainer in coursetrainerlist]
                }
            }
        )
    return jsonify(
        {
            "code": 404,
            "message": "There are no course trainer for course id: "+cid + '.' 
        }
    ), 404
    





if __name__ == "__main__":
    app.run( port="5000",debug=True)
