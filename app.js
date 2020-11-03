//require packages
var mysql = require("mysql");
var inquirer = require("inquirer");
//establish connection with mysql
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
//run inquirer prompt to ask user what they would like to do
function runPrompt() {
    inquirer.prompt({
        name:"action",
        type:"list",
        message: "Press enter to select option:",
        choices: [
            "View Departments",
            "View Roles",
            "View Employees",
            "Update Employees roles",
            "exit"
        ]
        //direct the user to the approprate function depending on choice
    }).then(function(answer){
        switch (answer.action){
            case  "View Departments":
                viewDepartments();
                break;
            case "View Roles":
                viewRoles();
                break;
            case "View Employees":
                viewEmployees();
                break;
            case "Update Employees roles":
                updateRoles();
                break;
            case "exit":
                connection.end();
                break;
        };
    });

};

//select all colums from departments table and console.log the new table
function viewDepartments(){
    var sqlStr = "SELECT * FROM departments";
    connection.query(sqlStr, function(err, result){
        if (err) throw err;
        console.table(result)
        runPrompt();
    })

};
//select all roles from departments table and console.log the new table
function viewRoles(){
    var sqlStr = "SELECT * FROM roles";
    connection.query(sqlStr, function(err, result){
        if (err) throw err;
        console.table(result)
        runPrompt();
    })

};
//select first_name, last_name, title, and salary and join using roles_id
function viewEmployees(){
    var sqlStr = "SELECT first_name, last_name, title, salary FROM employees ";
    sqlStr += "LEFT JOIN roles ";
    sqlStr += "ON employees.roles_id = roles.id;"
    connection.query(sqlStr, function (err, result) {
        if (err) throw err;

        console.table(result)
        runPrompt();
    });
};
// define a function that will give us an arry with all the title values in roles table
var rolesArr = [];
function rolesList(){
    connection.query("SELECT * FROM roles", function(err, result){
        if(err) throw err;
        for (var i=0; i<result.length; i++){
            rolesArr.push(result[i].title)
        };
    });

    return rolesArr;
};


//update the role of an existing employee
function updateRoles(){
    //first call the first_name and role.title to see current roles of the employees
    var sqlStr = "SELECT employees.first_name, roles.title FROM employees ";
    sqlStr += "JOIN roles ";
    sqlStr += "ON employees.roles_id = roles.id;"
    connection.query(sqlStr, function(err, result){
        if (err) throw err;
        console.table(result);
//run to prompt the user which employee they would like to update
        inquirer.prompt([
            {
                name: "firstName",
                type: "list",
                //choice has a function that creates of all employee name user can chose from 
                choices: function(){
                    var firstNames = [];
                    for (var i = 0; i < result.length; i++){
                     firstNames.push(result[i].first_name);   
                    };
                return firstNames;
                },
                message: "Select name of employee: "
            },
            {
                name: "role",
                type: "rawlist",
                //calls on rolesList function that returns arry of all the avaliable roles
                choices: rolesList(),
                message: "Select their new role: "
            }
        ]).then(function(entry){
            //we asign the index of the users choice in our rolesArry that houses all the avaliable roles
            var roleId = rolesList().indexOf(entry.role) + 1;
            //we update the employees roles_id to our new roleId where the first_name was the same as our emtry choice 
            connection.query("UPDATE employees SET roles_id = ? WHERE first_name = ?", [roleId, entry.firstName], function(err){
                if(err) throw err;
                runPrompt();
            })
        });

    });
};