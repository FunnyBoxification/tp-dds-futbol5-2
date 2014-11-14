dataSource {
    pooled = true
    driverClassName = "com.mysql.jdbc.Driver"
    username = "root"
    password = "password"
}

// environment specific settings
environments {
    development {
        dataSource {
            dbCreate = "create-drop" // one of 'create', 'create-drop', 'update', 'validate', ''
            url = "jdbc:mysql://localhost:5432/entrega9"
        }
    }
}
