view: everhour_dataset {
  sql_table_name: `management_detail.everhour_dataset`
    ;;

  dimension: billing {
    type: string
    sql: ${TABLE}.Billing ;;
  }

  dimension: billing_type {
    type: string
    sql: ${TABLE}.Billing_Type ;;
  }

  dimension: epic_link {
    type: string
    sql: ${TABLE}.Epic_Link ;;
  }

  dimension: member {
    type: string
    sql: ${TABLE}.Member ;;
  }

  dimension: scope_id {
    type: string
    sql: ${TABLE}.Scope_ID ;;
  }

  dimension: task {
    type: string
    sql: ${TABLE}.Task ;;
  }

  dimension: task_due_date {
    type: string
    sql: ${TABLE}.Task_Due_Date ;;
  }

  dimension: task_start_date {
    type: string
    sql: ${TABLE}.Task_Start_Date ;;
  }

  dimension: task_status {
    type: string
    sql: ${TABLE}.Task_Status ;;
  }

  dimension: time {
    type: number
    sql: ${TABLE}.Time ;;
  }

  dimension: day {
    type: number
    sql: ${TABLE}.Day ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
