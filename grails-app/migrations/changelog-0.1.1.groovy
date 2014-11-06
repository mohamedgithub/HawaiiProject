databaseChangeLog = {

	changeSet(author: "operations (generated)", id: "1414822468172-1") {
		addColumn(tableName: "report") {
			column(name: "profit", type: "double precision") {
				constraints(nullable: "false")
			}
		}
	}
}
