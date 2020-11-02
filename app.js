var mysql = require("mysql");
var inquirer = require("inquirer");

var connection = mysql.createConnection({
    host: "localhost",
    port: 3306,
    user: "root",
    password: "happyface",
    database: "employees_db"
  });

connection.connect(function(err){
    if (err) throw err;
    console.log("conected as Id: " + connection.threadId);
    runPrompt();
});

function runPrompt() {
    inquirer.prompt({
        name:"action",
        type:"list",
        message: "Press enter to select option:",
        choices: [
            "View Departments",
            "View Roles",
            "View Employees",
            "Update Employees",
            "exit"
        ]
    }).then(function(answer){
        switch (answer.action){
            case  "View Departments":
                viewDepartment();
                break;
            case "View Roles":
                viewRoles();
                break;
            case "View Employees":
                viewEmployees();
                break;
            case "Update Employees":
                updateEmployee();
                break;
            case "exit":
                connection.end();
                break;
        };
    });

};