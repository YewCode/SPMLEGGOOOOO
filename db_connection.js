var common = exports;
var mysql = require("mysql");

var con = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "",
  database: "spmproject",
});


con.connect(function(err) {
    if (err) throw err;
    con.query("SELECT * FROM Engineer", function (err, result, fields) {
      console.log(result);
    });
});

function getLastRecord(name)
{
    return new Promise(function(resolve, reject) {
        // The Promise constructor should catch any errors thrown on
        // this tick. Alternately, try/catch and reject(err) on catch.
        var connection = getMySQL_connection();

        var query_str =
        "SELECT name, " +
        "FROM engineer " +   
        // "WHERE (name = ?) " +
        "LIMIT 1 ";

        var query_var = [name];

        connection.query(query_str, query_var, function (err, rows, fields) {
            // Call reject on error states,
            // call resolve with results
            if (err) {
                return reject(err);
            }
            resolve(rows);
        });
    });
}

getLastRecord('name_record').then(function(rows) {
    // now you have your rows, you can see if there are <20 of them
}).catch((err) => setImmediate(() => { throw err; })); // Throw async to escape the promise chain
  
