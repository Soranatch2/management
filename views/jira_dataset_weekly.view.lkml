view: jira_dataset_weekly {
  # You can specify the table name if it's different from the view name:
  sql_table_name: `management_detail.jira_dataset_weekly` ;;
  #
  # # Define your dimensions and measures here, like this:
  dimension: scope_ids {
    description: "Bigquery : Scope ID"
    type: number
    sql: ${TABLE}.scope_ids ;;
  }

  dimension_group: update_date {
    description: "Bigquery : Updated Status from Jira"
    type: time
    datatype: date
    timeframes: [date, week, month, year]
    sql: ${TABLE}.update_date ;;
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

  measure: total {
    label: "Total"
    description: "Biquery : Total"
    # hidden: yes
    type: sum
    sql: ${TABLE}.total ;;
  }

  measure: actual_score {
    label: "Actual Score"
    description: "Bigquery : Actual Score from Calculated by Task Status * Task Scoring"
    type: sum
    sql: ${TABLE}.actual_score ;;
  }

  measure: total_score {
    label: "Total Score"
    description: "Bigquery : Total Score from Calcaluted by Number of Task * 5"
    type: sum
    sql: ${TABLE}.total_score ;;
  }

  measure: percentage_progress {
    label: "Total Progress Percentage"
    description: "Custom Measure : Percentage of Project Completion"
    type: average
    sql: 1.0 * ${TABLE}.actual_score/ nullif(${TABLE}.total_score ,0) ;;
    value_format_name: percent_2
  }

  measure: count {
    label: "Count"
    description: "Default Looker : Count it depend on dimension that you've selected."
    type: count
    drill_fields: []
  }

}
