view: everhour_dataset {
  sql_table_name: `management_detail.everhour_dataset`
    ;;
  dimension_group: day {
    label: "Day"
    description: "Bigquery : Day of time tracking"
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      day_of_week,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.Day ;;
  }
  dimension: billing {
    label: "Billing Status"
    description: "Bigquery : Billing Status"
    type: string
    sql: ${TABLE}.Billing ;;
  }

  dimension: billing_type {
    hidden: yes
    label: "Billing Custom Field"
    description: "Bigquery : Custom Field in Jira software (User Billing status for seperate Billable/Non-Billable)"
    type: string
    sql: ${TABLE}.Billing_Type ;;
  }

  dimension: epic_link {
    label: "Epic Link"
    description: "Bigquery : Epic Link from Jira Software"
    type: string
    sql: ${TABLE}.Epic_Link ;;
  }

  dimension: member {
    label: "Member"
    description: "Bigquery : name of user who do this task"
    type: string
    sql: ${TABLE}.Member ;;
  }

  dimension: scope_id {
    label: "Scope ID"
    description: "Bigquery : Scope ID"
    type: string
    sql: ${TABLE}.Scope_ID ;;
  }

  dimension: task {
    label: "Task"
    description: "Bigquery : Task Name."
    type: string
    sql: ${TABLE}.Task ;;
  }


  dimension: task_start_date {
    label: "Task Start Date"
    description: "Bigquery : Task Start Date."
    type: string
    sql: ${TABLE}.Task_Start_Date ;;
  }

  dimension: task_due_date {
    label: "Task Due Date"
    description: "Bigquery : Task Due Date."
    type: string
    sql: ${TABLE}.Task_Due_Date ;;
  }


  dimension: task_status {
    label: "Task Status"
    description: "Bigquery : Task Status."
    type: string
    sql: ${TABLE}.Task_Status ;;
  }

  dimension: time {
    label: "Time"
    description: "Bigquery : Time tracking."
    type: number
    sql: ${TABLE}.Time ;;
  }

  measure: time_duration {
    label: "Time"
    description: "Bigquery : Time tracking."
    type: number
    sql: (${TABLE}.Time) ;;
  }


  measure: count {
    label: "Count"
    description: "Bigquery : Count it, Depend on dimension that you've selected."
    type: count
    drill_fields: []
  }
}
