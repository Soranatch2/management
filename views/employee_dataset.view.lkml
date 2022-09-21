view: employee_dataset {
  sql_table_name: `management_detail.employee_dataset`
    ;;

  dimension: department_new {
    label: "Department"
    description: "Bigquery : Department"
    type: string
    sql: ${TABLE}.Department_New ;;
  }

  dimension: employee_name_en {
    label: "Employee"
    description: "Bigquery : Employee Name"
    type: string
    sql: ${TABLE}.Employee_Name_EN ;;
  }

  dimension: group {
    label: "Group"
    description: "Bigquery : Group of user"
    type: string
    sql: ${TABLE}.`Group` ;;
  }

  dimension: nickname_en {
    label: "Nickname"
    description: "Bigquery : Nickname"
    type: string
    sql: ${TABLE}.Nickname_EN ;;
  }

  dimension: no_ {
    label: "Number of Employee"
    description: "Bigquery : Number of Employee"
    type: number
    sql: ${TABLE}.`No` ;;
  }

  dimension: title {
    label: "Title"
    description: "Bigquery : Position / Roles / Job description"
    type: string
    sql: ${TABLE}.Title ;;
  }

  dimension: work_email {
    label: "Email"
    description: "Bigquery : Employye e-Mail "
    type: string
    sql: ${TABLE}.Work_Email ;;
  }

  measure: count {
    label: "Count"
    description: "Count it, Depend on dimension that you've selected."
    type: count
    drill_fields: []
  }
}
