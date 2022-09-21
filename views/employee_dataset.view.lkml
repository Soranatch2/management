view: employee_dataset {
  sql_table_name: `management_detail.employee_dataset`
    ;;

  dimension: department_new {
    type: string
    sql: ${TABLE}.Department_New ;;
  }

  dimension: employee_name_en {
    type: string
    sql: ${TABLE}.Employee_Name_EN ;;
  }

  dimension: group {
    type: string
    sql: ${TABLE}.`Group` ;;
  }

  dimension: nickname_en {
    type: string
    sql: ${TABLE}.Nickname_EN ;;
  }

  dimension: no_ {
    type: number
    sql: ${TABLE}.`No` ;;
  }

  dimension: title {
    type: string
    sql: ${TABLE}.Title ;;
  }

  dimension: work_email {
    type: string
    sql: ${TABLE}.Work_Email ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
