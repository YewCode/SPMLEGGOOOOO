from operator import add
from flask import Flask, request, jsonify
from flask.globals import session
from flask_sqlalchemy import SQLAlchemy
from sqlalchemy import *
from sqlalchemy.orm import query
from sqlalchemy.sql import expression
from flask_cors import CORS

import os
import sys
from os import environ
from werkzeug.utils import secure_filename
from sqlalchemy.sql.elements import *
import time


app = Flask(__name__)

app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql+mysqlconnector://root@localhost:3306/spmproject'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
app.config['SQLALCHEMY_ENGINE_OPTIONS'] = {'pool_recycle': 299}

db = SQLAlchemy(app)
CORS(app)

uploads_dir = os.path.join('uploadfiles')


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
    __tablename__ = 'Course'

    cid = db.Column(db.Integer, primary_key=True)
    coursename = db.Column(db.String(100), nullable=False)
    coursedescription = db.Column(db.String(500), nullable=False)
    startdate = db.Column(db.Date, nullable=False)
    enddate = db.Column(db.Date, nullable=False)
    courseimg = db.Column(db.String(100))

    def __init__(self, cid, coursename, coursedescription, startdate, enddate, courseimg):
        self.cid = cid
        self.coursename = coursename
        self.coursedescription = coursedescription
        self.startdate = startdate
        self.enddate = enddate
        self.courseimg = courseimg

    def json(self):
        return {"cid": self.cid, "coursename": self.coursename, "coursedescription": self.coursedescription, "startdate": self.startdate, "enddate": self.enddate, "courseimg": self.courseimg}


class Course_Trainer(db.Model):
    __tablename__ = 'course_trainer'

    cid = db.Column(db.Integer, primary_key=True)
    eid = db.Column(db.Integer, primary_key=True)

    def __init__(self, cid, eid):
        self.cid = cid
        self.eid = eid

    def json(self):
        return {"cid": self.cid, "eid": self.eid}


class Course_Enrolled(db.Model):
    __tablename__ = 'Course_Enrolled'

    cid = db.Column(db.Integer, primary_key=True)
    eid = db.Column(db.Integer, primary_key=True)
    active = db.Column(db.String(100), nullable=False)
    classid = db.Column(db.Integer, primary_key=True)

    def __init__(self, cid, eid, active,classid):
        self.cid = cid
        self.eid = eid
        self.active = active
        self.classid = classid

    def json(self):
        return {"cid": self.cid, "eid": self.eid, "active": self.active,"classid": self.classid}


class Course_EnrollmentPending(db.Model):
    __tablename__ = 'Course_EnrollmentPending'

    cid = db.Column(db.Integer, primary_key=True)
    eid = db.Column(db.Integer, primary_key=True)
    active = db.Column(db.Integer, nullable=False)

    def __init__(self, cid, eid, active):
        self.cid = cid
        self.eid = eid
        self.active = active

    def json(self):
        return {"cid": self.cid, "eid": self.eid, "active": self.active}


class Course_Completed(db.Model):
    __tablename__ = 'course_completed'

    cid = db.Column(db.Integer, primary_key=True)
    eid = db.Column(db.Integer, primary_key=True)

    def __init__(self, cid, eid):
        self.cid = cid
        self.eid = eid

    def json(self):
        return {"cid": self.cid, "eid": self.eid}


class Section(db.Model):
    __tablename__ = 'section'
# SectionID, ClassID, CourseID, SectionName, End_Date
    sectionid = db.Column(db.Integer, primary_key=True)
    classid = db.Column(db.Integer, primary_key=True)
    courseid = db.Column(db.Integer, primary_key=True)
    sectionName = db.Column(db.String(100), nullable=False)

    def __init__(self, sectionid, classid, courseid, sectionName):
        self.sectionid = sectionid
        self.classid = classid
        self.courseid = courseid
        self.sectionName = sectionName

    def json(self):
        return {"sectionid": self.sectionid,
                "classid": self.classid,
                "courseid": self.courseid,
                "sectionName": self.sectionName
                }
    def getsectionid(self):
        return self.sectionid
    
class Classes(db.Model):
    __tablename__ = 'class'

    classid = db.Column(db.Integer, primary_key=True)
    courseid = db.Column(db.Integer, primary_key=True)
    capacity = db.Column(db.Integer, primary_key=True)
    classtime = db.Column(db.String(100), nullable=False)

    def __init__(self, classid, courseid, capacity, classtime):
        self.classid = classid
        self.courseid = courseid
        self.capacity = capacity
        self.classtime = classtime

    def json(self):
        return {"classid": self.classid,
                "courseid": self.courseid,
                "capacity": self.capacity,
                "classtime": self.classtime
                }


class Class_Trainer(db.Model):
    __tablename__ = 'class_trainer'

    classid = db.Column(db.Integer, primary_key=True)
    eid = db.Column(db.Integer, primary_key=True)
    courseid = db.Column(db.Integer, primary_key=True)

    def __init__(self, classid, courseid, eid):
        self.classid = classid
        self.courseid = courseid
        self.courseid = courseid

    def json(self):
        return {"classid": self.classid, "courseid": self.courseid, "eid": self.eid}



class Material (db.Model):
    __tablename__ = 'training_materials'

    materialid = db.Column(db.Integer, primary_key=True)
    filename = db.Column(db.String(50))
    url = db.Column(db.String(250))
    isHidden = db.Column(db.Integer)
    classid = db.Column(db.Integer)
    courseid = db.Column(db.Integer)
    sectionid = db.Column(db.Integer)

    def __init__(self, materialid, filename, url, isHidden, classid, courseid, sectionid):
        self.materialid = materialid
        self.filename = filename
        self.url = url
        self.isHidden = isHidden
        self.classid = classid
        self.courseid = courseid
        self.sectionid = sectionid

    def json(self):
        return {
            "materialid": self.materialid,
            "filename": self.filename,
            "url": self.url,
            "isHidden": self.isHidden,
            "classid": self.classid,
            "courseid": self.courseid,
            "sectionid": self.sectionid,
        }
    def getMaterialId(self):
        return self.materialid
    
    def getSectionId(self):
        return self.sectionid
    
class Quiz (db.Model):
    __tablename__ = 'quiz'
    
    quizid = db.Column(db.Integer, primary_key=True)
    courseid = db.Column(db.Integer)
    classid = db.Column(db.Integer,primary_key=True)
    sectionid = db.Column(db.Integer,primary_key=True)
    quiz_name = db.Column(db.String(50))
    timelimit = db.Column(db.String(50))
    isHidden = db.Column(db.Integer)
    passing_requirements = db.Column(db.Float(precision=2))
    isGraded = db.Column(db.Integer)

    def __init__(self, quizid, courseid,classid, sectionid,quiz_name,timelimit, isHidden, passing_requirements, isGraded):
        self.quizid = quizid
        self.courseid = courseid
        self.classid = classid
        self.sectionid = sectionid
        self.quiz_name = quiz_name
        self.timelimit = timelimit
        self.isHidden = isHidden
        self.passing_requirements = passing_requirements
        self.isGraded = isGraded

    def json(self):
        return {
            "quizid": self.quizid,
            "courseid": self.courseid,
            "classid": self.classid,
            "sectionid": self.sectionid,
            "quiz_name": self.quiz_name,
            "timelimit": self.timelimit,
            "isHidden": self.isHidden,
            "passing_requirements": self.passing_requirements,
            "isGraded": self.isGraded   
        }
        
class Question (db.Model):
    __tablename__ = 'question'

    quizid = db.Column(db.Integer,primary_key=True)
    qnNum = db.Column(db.Integer,primary_key=True)
    qn_type = db.Column(db.String(100))
    qn_Description = db.Column(db.String(250))
    options = db.Column(db.String(1000))
    answer = db.Column(db.String(100))
    

    def __init__(self, quizid, qnNum, qn_type,qn_Description,options, answer):
        self.quizid = quizid
        self.qnNum = qnNum
        self.qn_type = qn_type
        self.qn_Description = qn_Description
        self.options = options
        self.answer = answer
        

    def json(self):
        return {
            "quizid": self.quizid,
            "qnNum": self.qnNum,
            "qn_type": self.qn_type,
            "qn_Description": self.qn_Description,
            "options": self.options,
            "answer": self.answer   
        }
        
class Quiz_Attempt (db.Model):
    __tablename__ = 'quiz_attempt'
    
# EngineerID, QuizID, AttemptID, QnNum, given_answer
    engineerid = db.Column(db.Integer, primary_key=True)
    quizid = db.Column(db.Integer)
    attemptID = db.Column(db.Integer)
    qnNum = db.Column(db.Integer)
    given_answer = db.Column(db.String(250))
    

    def __init__(self, engineerid, quizid, attemptID,qnNum,given_answer):
        self.engineerid = engineerid
        self.quizid = quizid
        self.attemptID = attemptID
        self.qnNum = qnNum
        self.given_answer = given_answer
        
    def json(self):
        return {
            "engineerid": self.engineerid,
            "quizid": self.quizid,
            "attemptID": self.attemptID,
            "qnNum": self.qnNum,
            "given_answer": self.given_answer
        }

class Pre_Requisites (db.Model):
    __tablename__ = 'prerequisites'

    prerequisites_cid = db.Column(db.Integer, primary_key=True)
    for_cid = db.Column(db.Integer, primary_key=True)

    def __init__(self, prerequisites_cid, for_cid):
        self.prerequisites_cid = prerequisites_cid
        self.for_cid = for_cid
    
    def json(self):
        return {
            "prerequisites_cid": self.prerequisites_cid,
            "for_cid": self.for_cid
        }
    def getForCid(self):
        return self.for_cid
    
    def getPreRequisite(self):
        return self.prerequisites_cid
        
# all routes
@app.route("/engineer")
def getAllEngineer():
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
    engineerlist = Engineer.query.filter_by(engineerid=eid).all()
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


@app.route("/course/<int:cid>")
def getCourseByCid(cid):

    courselist = db.session.query(Course).filter(Course.cid==cid).first()
    if courselist != None:
        return jsonify(
            {
                "code": 200,
                "data": {
                    "courses": courselist.json()
                }
            }
        )
    return jsonify(
        {
            "code": 404,
            "message": "There are no courses."
        }
    ), 404

@app.route("/section/<int:cid>")
def getSectionsByCid(cid):

    resultlist = db.session.query(Section).filter(Section.courseid==cid).all()
    print(resultlist)
    if resultlist != None:
        print(type(resultlist))
        return jsonify(
            {
                "code": 200,
                "data": {
                    "section": [result.json() for result in resultlist]
                }
            }
        )
    return jsonify(
        {
            "code": 404,
            "message": "There are no sections in course id"+str(cid)
        }
    ), 404
    
@app.route("/create/section/<int:sectionid>/course/<int:cid>/classid/<int:classid>")
def createSectionsByCid(sectionid,cid,classid):
    sectionname = 'Section ' + str(sectionid + 1)
    addsection = Section(sectionid + 1,classid,cid,sectionname)
    try:
        db.session.add(addsection)
        db.session.commit()
    except Exception as e:
        print(e)
        return jsonify(
            {
                "code": 500,
                "message": "An error occurred while creating the section. " + str(e)
            }
        ), 500

    return jsonify(
        {
            "code": 200,
            "section":  sectionid
        }
    )


@app.route("/course_trainer/cid/<int:cid>")
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
            "message": "There are no course trainer for course id: "+str(cid) + '.'
        }
    ), 404


@app.route("/course_trainer/eid/<int:eid>")
def getCourseTrainerByEid(eid):

    coursetrainerlist = Course_Trainer.query.filter_by(eid=eid).all()
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
            "message": "There are no course trainer for course id: "+str(eid) + '.'
        }
    ), 404


@app.route("/Course_Enrolled/eid/<int:eid>")
def getCourseEnrolledByEid(eid):

    coursetrainerlist = Course_Enrolled.query.filter_by(eid=eid).all()
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
            "message": "There are no course enrolled for engineer id: "+str(eid) + '.'
        }
    ), 404
    
@app.route("/Course_Enrolled/info/eid/<int:eid>")
def getCourseEnrolledInfoByEid(eid):

    courseinfolist = db.session.query(Course,Course_Enrolled)\
        .filter(and_(Course.cid==Course_Enrolled.cid, Course_Enrolled.eid==eid)).all()
    if courseinfolist != None:
        print(courseinfolist)
        return jsonify(
            {
                "code": 200,
                "data": {
                    "courses": [course.json() for (course,courseenrolled) in courseinfolist]
                }
            }
        )
    return jsonify(
        {
            "code": 404,
            "message": "There are no course enrolled for engineer id: "+str(eid) + '.'
        }
    ), 404


@app.route("/Engineer/getAllEid/<int:i_cid>")
def getListOfEnrolledAndUnenrolled(i_cid):

    returnlist = db.session.query(Engineer, Course_Enrolled).\
        outerjoin(Course_Enrolled, Course_Enrolled.eid == Engineer.engineerid)\
        .filter( or_(Course_Enrolled.cid == None, Course_Enrolled.cid == i_cid) ).all()
    if len(returnlist):
        return jsonify(
            {
                "code": 200,
                "data": {
                    "result": [({'engineer': engineer.json(), 'isenrolled': 'enrolled' if course_enrolled != None and course_enrolled.json()['cid'] == i_cid else 'unenrolled'}) for (engineer, course_enrolled) in returnlist]
                }
            }
        )
    return jsonify(
        {
            "code": 404,
            "message": "There are no results for cid: "+str(i_cid) + '.'
        }
    ), 404


@app.route("/class/courseid/<int:i_courseid>")
def getclassByCourseID(i_courseid):
    classlist = db.session.query(Classes, Engineer, Class_Trainer)\
        .outerjoin(Class_Trainer, and_(Class_Trainer.courseid == Classes.courseid, Class_Trainer.classid == Classes.classid))\
        .outerjoin(Engineer, Engineer.engineerid == Class_Trainer.eid)\
        .filter(Classes.courseid == i_courseid).all()

    if len(classlist):
        return jsonify(
            {
                "code": 200,
                "data": {
                    "classes": [({"classdetails": classs.json(), "engineer": en.json()}) for (classs, en, ct) in classlist]
                }
            }
        )
    return jsonify(
        {
            "code": 404,
            "message": "There are no classs."
        }
    ), 404


@app.route("/pending/<int:i_courseid>")
def getPendingEnrollmentByCourseID(i_courseid):
    pendinglist = db.session.query(Course_EnrollmentPending, Engineer)\
        .join(Engineer, Engineer.engineerid == Course_EnrollmentPending.eid)\
        .filter(and_(Course_EnrollmentPending.cid == i_courseid, Course_EnrollmentPending.active == 1)).first()
    # print('pending', pendinglist)
    if len([pendinglist]):
        return jsonify(
            {
                "code": 200,
                "data": {
                    "result": [engineer.json() for (pending, engineer) in [pendinglist]]
                }
            }
        )
    return jsonify(
        {
            "code": 404,
            "message": "There are no pending learners for course id " + str(i_courseid)
        }
    ), 404


@app.route("/Course_Enrolled/pending/eid/<int:eid>/cid/<int:cid>", methods=['GET', 'POST'])
def approveLearnersEnrollment(eid, cid):
    courseenrolling = Course_Enrolled(cid, eid, 1)
    pending = Course_EnrollmentPending.query\
        .filter(and_(cid == cid, eid == eid, Course_EnrollmentPending.active == 1)).first()
    if pending != None:
        pending.active = 0
    try:
        db.session.add(courseenrolling)
        db.session.commit()
    except Exception as e:
        print(e)
        return jsonify(
            {
                "code": 500,
                "message": "An error occurred while creating the enrollment. " + str(e)
            }
        ), 500

    return jsonify(
        {
            "code": 200,
            "enrolled":  courseenrolling.json()
        }
    )

# assign learner
@app.route("/Course_Enrolled/assign/eid/<int:eid>/cid/<int:cid>/class/<int:classid>", methods=['GET', 'POST'])
def assignlearners(eid, cid,classid):
    # created the course enrolled row
    courseenrolling = Course_Enrolled(cid, eid, 1,classid)
    # check against pending
    pending = Course_EnrollmentPending.query\
        .filter(and_(cid == cid, eid == eid,classid==classid, Course_EnrollmentPending.active == 1)).first()
    if pending != None:
        pending.active = 0
    try:
        db.session.add(courseenrolling)
        db.session.commit()
    except Exception as e:
        print(e)
        return jsonify(
            {
                "code": 500,
                "message": "An error occurred while creating the enrollment. " + str(e)
            }
        ), 500

    return jsonify(
        {
            "code": 200,
            "enrolled":  courseenrolling.json()
        }
    )


# create new pending
@app.route("/pending/add/eid/<int:eid>/cid/<int:cid>", methods=['GET', 'POST'])
def addPendingEnrollment(eid, cid):
    pending = Course_EnrollmentPending(cid, eid, 1)
    try:
        db.session.add(pending)
        db.session.commit()
    except Exception as e:
        print(e)
        return jsonify(
            {
                "code": 500,
                "message": "An error occurred while adding to pending :" + str(e)
            }
        ), 500

    return jsonify(
        {
            "code": 200,
            "message": 'added successfully',
            "enrolled":  pending.json()
        }
    )

# upload material
@app.route("/upload/material", methods=['GET', 'POST'])
def uploadMaterials():
    formData = request.form
    formDict = formData.to_dict()
    material1 = request.files
    name = formDict['name']
    courseid = formDict['courseid']
    classid = formDict['classid']
    sectionid = formDict['sectionid']
    # create unique file name
    fileext = name.split('.')[-1]
    namewoext = name.split('.')[:-1]
    timestr = time.strftime("%Y%m%d-%H%M%S")
    finalfilename = str(timestr)+'_'+' '.join(namewoext) +'.'+fileext 
    # save file
    material1['material'].save(os.path.join(uploads_dir,secure_filename(finalfilename) ))
    
    addtodb = Material(0,finalfilename,None,False,classid,courseid,sectionid)
        
    try:
        db.session.add(addtodb)
        db.session.commit()
    except Exception as e:
        print(e)
        return jsonify(
            {
                "code": 500,
                "message": "An error occurred while adding material :" + str(e)
            }
        ), 500

    newlyadded = db.session.query(Material).order_by(Material.materialid).first()
    if newlyadded != None:
        return jsonify(
            {
                "code": 200,
                "message": 'added successfully',
                "enrolled":  newlyadded.json()
            }
        ),201
        
# upload link
@app.route("/upload/link", methods=['GET', 'POST'])
def uploadLink():
    formData = request.form
    formDict = formData.to_dict()
    link = formDict['link']
    courseid = formDict['courseid']
    classid = formDict['classid']
    sectionid = formDict['sectionid']
    print('section: ',sectionid)
    addtodb = Material(0,None,link,False,classid,courseid,sectionid)
        
    try:
        db.session.add(addtodb)
        db.session.commit()
    except Exception as e:
        print(e)
        return jsonify(
            {
                "code": 500,
                "message": "An error occurred while adding link :" + str(e)
            }
        ), 500

    newlyadded = db.session.query(Material).order_by(Material.materialid).first()
    if newlyadded != None:
        return jsonify(
            {
                "code": 200,
                "message": 'link added successfully',
                "enrolled":  newlyadded.json()
            }
        ),201

# retrieve materials
@app.route("/retrieve/materials/<int:courseid>/class/<int:classid>")
def retrieveMaterials(courseid,classid):
    result = db.session.query(Material).filter(and_(Material.courseid==courseid,\
        Material.classid==classid)).order_by(Material.sectionid).all()
    if result != None:
        newformat = {}
        for material in result:
            currentsectionid = 'Section '+str(material.getSectionId())
            if currentsectionid not in newformat.keys():
                newformat[currentsectionid] = [material.json()]
            else:
                newformat[currentsectionid].append(material.json())
        return jsonify(
            {
                "code": 200,
                "data": {
                    "result": newformat
                }
            }
        )
    return jsonify(
        {
            "code": 404,
            "message": "There are no results for cid: "+str(courseid) + '.'
        }
    ), 404
    


# add new Quiz 
@app.route("/quiz/add",methods=['POST'])
def addNewQuiz():
    formdata = request.form
    formdict = formdata.to_dict()
    print(formdict)
    newQuiz = Quiz(0,formdict['courseid'],formdict['classid'],formdict['sectionid'],formdict['quizname'],\
        formdict['timelimit'],formdict['isHidden'],formdict['passingreq'],formdict['graded'])
    try:
        db.session.add(newQuiz)
        db.session.commit()
    except Exception as e:
        print(e)
        return jsonify(
            {
                "code": 500,
                "message": "An error occurred while adding quiz :" + str(e)
            }
        ), 500
    return jsonify(
            {
                "code": 200,
                "message": 'added successfully',
                "enrolled":  newQuiz.json()
            }
        ),201

#add new quiz questions
@app.route("/quiz/questions/add/<int:quizid>",methods=['GET','POST'])
def addNewQuestions(quizid):
    # QuizID, QnNum, Qn_type, Qn_Description, options, answer
    formdata = request.form
    formdict = formdata.to_dict()
    print(formdict)
    newquestion = Question(quizid,formdata['qnNum'],formdata['qn_type'],formdata['qn_description'],\
        formdata['options'],formdata['answer'])
    try:
        db.session.add(newquestion)
        db.session.commit()
    except Exception as e:
        print(e)
        return jsonify(
            {
                "code": 500,
                "message": "An error occurred while adding question :" + str(e)
            }
        ), 500
    return jsonify(
            {
                "code": 200,
                "message": 'added successfully',
                "enrolled":  newquestion.json()
            }
        ),201
#retreive quiz 
@app.route("/quiz/retrieve/<int:quizid>")
def retrieveQuiz(quizid):
    result = db.session.query(Quiz).filter(quizid==quizid).first()
    if result != None:
        return jsonify(
            {
                "code": 200,
                "data": {
                    "result": result.json()
                }
            }
        )
    return jsonify(
        {
            "code": 404,
            "message": "There are no results for quiz id: "+str(quizid) + '.'
        }
    ), 404
    
#retreive quiz question
@app.route("/quiz/question/retrieve/<int:quizid>")
def retrieveQuestion(quizid):
    result = db.session.query(Question).filter(quizid==quizid).all()
    if result != None:
        return jsonify(
            {
                "code": 200,
                "data": {
                    "result": [ quiz.json() for quiz in result]
                }
            }
        )
    return jsonify(
        {
            "code": 404,
            "message": "There are no results for quiz id: "+str(quizid) + '.'
        }
    ), 404
        
@app.route("/coursecompleted/<int:eid>")
def retrieveCompletedByEid(eid):
    result = db.session.query(Course_Completed, Pre_Requisites)\
        .join(Course_Completed, Pre_Requisites.prerequisites_cid == Course_Completed.cid)\
        .filter(Course_Completed.eid==eid).all()
    # print(result)
    if result != None:
        return jsonify(
            {
                "code": 200,
                "data": {
                    "result": [ pre.json() for (coursecompleted,pre) in result]
                }
            }
        )
    return jsonify(
        {
            "code": 404,
            "message": "Engineer " + str(eid) + " has not completed any courses which have pre-requisites."
        }
    ), 404
    
@app.route("/courseEligible/learner/<int:i_eid>")
def retrieveEligibleCourseByEid(i_eid):
    # all courses that has prereq learners can take
    allcoursewprereq = db.session.query(Pre_Requisites.for_cid)\
        .filter(and_(Course_Completed.cid==Pre_Requisites.prerequisites_cid,\
            Course_Completed.eid==i_eid)).subquery()
    
    coursesCannotTake = db.session.query(Course.cid)\
        .filter(and_(Course.cid==Pre_Requisites.for_cid,\
            Course.cid.notin_(allcoursewprereq))).subquery()
    
    result = db.session.query(Course).filter(Course.cid.notin_(coursesCannotTake) ).all()
    print(result)
    if result != None:
        return jsonify(
            {
                "code": 200,
                "data": {
                    "result": [ course.json() for course in result]
                }
            }
        )
    return jsonify(
        {
            "code": 404,
            "message": "Engineer " + str(i_eid) + " has not completed any courses which have pre-requisites."
        }
    ), 404
    
if __name__ == "__main__":
    app.run(port="5000", debug=True)
