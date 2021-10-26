from flask import Flask,request,jsonify
from flask_sqlalchemy import SQLAlchemy


app = Flask(__name__)

app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql+mysqlconnector://root@localhost:3306/spmproject'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
 
db = SQLAlchemy(app)
   
class Classes(db.Model):
    __tablename__ = 'class'
 
    classid = db.Column(db.Integer, primary_key=True)
    courseid = db.Column(db.Integer, primary_key=True)
    class_capacity = db.Column(db.Integer, primary_key=True)
    startdate =  db.Column(db.DateTime)
    enddate =  db.Column(db.DateTime)
    class_type =db.Column(db.String(50), nullable=False)
 
    def __init__(self, classid,courseid, class_name, class_capacity,startdate,enddate,class_type):
        self.classid = classid
        self.courseid = courseid
        self.class_name = class_name
        self.class_capacity = class_capacity
        self.startdate = startdate
        self.enddate = enddate
        self.class_type = class_type
 
    def json(self):
        return {"classid": self.classid,
                "courseid": self.courseid,
                "class_capacity": self.class_capacity,
                "startdate": self.startdate,
                "enddate": self.enddate,
                "class_type": self.class_type
                }
class Classes_Trainer(db.Model):
    __tablename__ = 'class_trainer'
 
    classid = db.Column(db.Integer, primary_key=True)
    eid = db.Column(db.Integer, primary_key=True)
    courseid = db.Column(db.Integer, primary_key=True)
    
 
    def __init__(self, classid, courseid, eid):
        self.classid = classid
        self.courseid = courseid
        self.courseid = courseid
        
    def json(self):
        return {"classid": self.classid,"courseid": self.courseid,"eid": self.eid}
    
class Class_Enrolled(db.Model):
    __tablename__ = 'Class_Enrolled'
 
    classid = db.Column(db.Integer, primary_key=True)
    eid = db.Column(db.Integer, primary_key=True)
    courseid = db.Column(db.Integer, primary_key=True)
    
 
    def __init__(self, classid, courseid, eid):
        self.classid = classid
        self.courseid = courseid
        self.courseid = courseid
        
    def json(self):
        return {"classid": self.classid,"courseid": self.courseid,"eid": self.eid}



@app.route("/")
def home():
    pass
    classlist = Classes.query.all()
    if len(classlist):
        return jsonify(
            {
                "code": 200,
                "data": {
                    "class": [ classs.json() for classs in classlist]
                }
            }
        )
    return jsonify(
        {
            "code": 404,
            "message": "There are no classs."
        }
    ), 404




if __name__ == "__main__":
    app.run( port="5000",debug=True)
