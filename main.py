from flask import Flask,request,jsonify
from flask_sqlalchemy import SQLAlchemy


app = Flask(__name__)

app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql+mysqlconnector://root@localhost:3306/spmproject'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
 
db = SQLAlchemy(app)
 
class Engineer(db.Model):
    __tablename__ = 'engineer'
 
    engineerid = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(64), nullable=False)
    role =db.Column(db.String(64), nullable=False)
 
    def __init__(self, engineerid, name, role):
        self.engineerid = engineerid
        self.name = name
        self.role = role
 
    def json(self):
        return {"engineerid": self.engineerid, "name": self.name, "role": self.role}
    
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
 

@app.route("/engineer")
def getAllEngineer():
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
    
@app.route("/engineer/<int:eid>")
def getEngineerByEid(eid):
    pass
    engineerlist = Engineer.query.filter_by(engineerid=eid)
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




if __name__ == "__main__":
    app.run( port="5000",debug=True)
