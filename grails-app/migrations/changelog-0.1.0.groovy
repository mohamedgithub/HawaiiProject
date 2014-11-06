databaseChangeLog = {

	changeSet(author: "operations (generated)", id: "1414763113771-1") {
		createTable(tableName: "form") {
			column(autoIncrement: "true", name: "id", type: "bigint") {
				constraints(nullable: "false", primaryKey: "true", primaryKeyName: "formPK")
			}

			column(name: "version", type: "bigint") {
				constraints(nullable: "false")
			}

			column(name: "email", type: "varchar(255)") {
				constraints(nullable: "false")
			}

			column(name: "name", type: "varchar(255)") {
				constraints(nullable: "false")
			}
		}
	}

	changeSet(author: "operations (generated)", id: "1414763113771-2") {
		createTable(tableName: "product") {
			column(autoIncrement: "true", name: "id", type: "bigint") {
				constraints(nullable: "false", primaryKey: "true", primaryKeyName: "productPK")
			}

			column(name: "version", type: "bigint") {
				constraints(nullable: "false")
			}

			column(name: "cost_price", type: "double precision") {
				constraints(nullable: "false")
			}

			column(name: "description", type: "longtext") {
				constraints(nullable: "false")
			}

			column(name: "file", type: "varchar(255)") {
				constraints(nullable: "false")
			}

			column(name: "filename", type: "varchar(255)") {
				constraints(nullable: "false")
			}

			column(name: "full_path", type: "varchar(255)") {
				constraints(nullable: "false")
			}

			column(name: "product_name", type: "varchar(255)") {
				constraints(nullable: "false")
			}

			column(name: "quantity", type: "bigint") {
				constraints(nullable: "false")
			}

			column(name: "selling_price", type: "double precision") {
				constraints(nullable: "false")
			}
		}
	}

	changeSet(author: "operations (generated)", id: "1414763113771-3") {
		createTable(tableName: "report") {
			column(autoIncrement: "true", name: "id", type: "bigint") {
				constraints(nullable: "false", primaryKey: "true", primaryKeyName: "reportPK")
			}

			column(name: "version", type: "bigint") {
				constraints(nullable: "false")
			}

			column(name: "date", type: "datetime")

			column(name: "product_name", type: "varchar(255)") {
				constraints(nullable: "false")
			}

			column(name: "quantity", type: "integer") {
				constraints(nullable: "false")
			}

			column(name: "selling_price", type: "double precision") {
				constraints(nullable: "false")
			}

			column(name: "total", type: "double precision") {
				constraints(nullable: "false")
			}
		}
	}

	changeSet(author: "operations (generated)", id: "1414763113771-4") {
		createTable(tableName: "role") {
			column(autoIncrement: "true", name: "id", type: "bigint") {
				constraints(nullable: "false", primaryKey: "true", primaryKeyName: "rolePK")
			}

			column(name: "version", type: "bigint") {
				constraints(nullable: "false")
			}

			column(name: "authority", type: "varchar(255)") {
				constraints(nullable: "false")
			}
		}
	}

	changeSet(author: "operations (generated)", id: "1414763113771-5") {
		createTable(tableName: "user") {
			column(autoIncrement: "true", name: "id", type: "bigint") {
				constraints(nullable: "false", primaryKey: "true", primaryKeyName: "userPK")
			}

			column(name: "version", type: "bigint") {
				constraints(nullable: "false")
			}

			column(name: "account_expired", type: "bit") {
				constraints(nullable: "false")
			}

			column(name: "account_locked", type: "bit") {
				constraints(nullable: "false")
			}

			column(name: "email", type: "varchar(255)") {
				constraints(nullable: "false")
			}

			column(name: "enabled", type: "bit") {
				constraints(nullable: "false")
			}

			column(name: "file", type: "varchar(255)")

			column(name: "filename", type: "varchar(255)")

			column(name: "full_path", type: "varchar(255)")

			column(name: "language", type: "varchar(255)")

			column(name: "location", type: "varchar(255)") {
				constraints(nullable: "false")
			}

			column(name: "password", type: "varchar(255)") {
				constraints(nullable: "false")
			}

			column(name: "password_expired", type: "bit") {
				constraints(nullable: "false")
			}

			column(name: "phonenumber", type: "varchar(255)") {
				constraints(nullable: "false")
			}

			column(name: "token", type: "varchar(255)")

			column(name: "username", type: "varchar(255)") {
				constraints(nullable: "false")
			}
		}
	}

	changeSet(author: "operations (generated)", id: "1414763113771-6") {
		createTable(tableName: "user_role") {
			column(name: "role_id", type: "bigint") {
				constraints(nullable: "false")
			}

			column(name: "user_id", type: "bigint") {
				constraints(nullable: "false")
			}
		}
	}

	changeSet(author: "operations (generated)", id: "1414763113771-7") {
		addPrimaryKey(columnNames: "role_id, user_id", constraintName: "user_rolePK", tableName: "user_role")
	}

	changeSet(author: "operations (generated)", id: "1414763113771-10") {
		createIndex(indexName: "product_name_uniq_1414763113575", tableName: "product", unique: "true") {
			column(name: "product_name")
		}
	}

	changeSet(author: "operations (generated)", id: "1414763113771-11") {
		createIndex(indexName: "authority_uniq_1414763113596", tableName: "role", unique: "true") {
			column(name: "authority")
		}
	}

	changeSet(author: "operations (generated)", id: "1414763113771-12") {
		createIndex(indexName: "email_uniq_1414763113599", tableName: "user", unique: "true") {
			column(name: "email")
		}
	}

	changeSet(author: "operations (generated)", id: "1414763113771-13") {
		createIndex(indexName: "username_uniq_1414763113603", tableName: "user", unique: "true") {
			column(name: "username")
		}
	}

	changeSet(author: "operations (generated)", id: "1414763113771-14") {
		createIndex(indexName: "FK143BF46A2139B722", tableName: "user_role") {
			column(name: "user_id")
		}
	}

	changeSet(author: "operations (generated)", id: "1414763113771-15") {
		createIndex(indexName: "FK143BF46A7C0EF342", tableName: "user_role") {
			column(name: "role_id")
		}
	}

	changeSet(author: "operations (generated)", id: "1414763113771-8") {
		addForeignKeyConstraint(baseColumnNames: "role_id", baseTableName: "user_role", constraintName: "FK143BF46A7C0EF342", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "role", referencesUniqueColumn: "false")
	}

	changeSet(author: "operations (generated)", id: "1414763113771-9") {
		addForeignKeyConstraint(baseColumnNames: "user_id", baseTableName: "user_role", constraintName: "FK143BF46A2139B722", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "user", referencesUniqueColumn: "false")
	}
}
