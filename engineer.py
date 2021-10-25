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
    


@app.route("/")
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
