view: jira_dataset {
  sql_table_name: `management_detail.jira_dataset`
    ;;

  dimension: actual_score {
    label: "Actual Score"
    description: "Bigquery : Actual score by Jira Task Status * Task Scoring"
    type: number
    sql: ${TABLE}.actual_score ;;
  }

  dimension: in_progress {
    label: "In Progress"
    description: "Bigquery : Jira Task status - In Progress"
    type: number
    sql: ${TABLE}.In_progress ;;
  }

  dimension: quality_assurance {
    label: "Quality Assurance"
    description: "Bigquery : Jira Task status - Quality Assurrance"
    type: number
    sql: ${TABLE}.Quality_Assurance ;;
  }


  dimension: ready_to_send {
    label: "Ready To Send"
    description: "Bigquery : Jira Task status - Ready To Send"
    type: number
    sql: ${TABLE}.Ready_To_Send ;;
  }

  dimension: follow_up_clients {
    label: "Follow Up Clients"
    description: "Bigquery : Jira Task status - Follow Up Clients"
    type: number
    sql: ${TABLE}.Follow_up_Clients ;;
  }

  dimension: done {
    label: "Done"
    description: "Bigquery : Jira Task status - Done"
    type: number
    sql: ${TABLE}.Done ;;
  }


  dimension: percentage_progress {
    label: "Percentage Progress"
    description: "Bigquery : Percentage of Project completion"
    type: number
    sql: ${TABLE}.percentage_progress ;;
  }

  dimension: scope_id {
    label: "Scope ID"
    description: "Bigquery : Scope ID"
    type: string
    sql: ${TABLE}.scope_id ;;
  }

  dimension: total {
    hidden: yes
    label: "Total"
    description: "Bigquery : Total"
    type: number
    sql: ${TABLE}.total ;;
  }

  dimension: total_score {
    label: "Total Score"
    description: "Bigquery : Total Score ,Calculated from Number of Task * 5"
    type: number
    sql: ${TABLE}.total_score ;;
  }

  measure: count {
    label: "Count"
    description: "Default Looker : Count it depend on dimension that you've selected."
    type: count
    drill_fields: []
  }
}
