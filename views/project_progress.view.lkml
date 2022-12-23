view: project_progress {
  sql_table_name: `management_detail.project_progress`
    ;;


  dimension: qt_number {
    label: "Quotation Number"
    description: "Bigquery : Quotation Number"
    type: string
    sql: ${TABLE}.qt_number ;;
    drill_fields: [scope_id,project_plan.BD]
  }


# NULLIF(${sale_price},0)
  dimension: result {
    label: "Result"
    description: "Custom Dimension : Calculate Project for Profit and Loss"
    type: string
    sql:
    case
    when project_plan.Total___Manhours is null then "Total Mh missing"
    when ${TABLE}.manhour_number is null then "Actual Mh missing"
    when(project_plan.Total___Manhours - ${TABLE}.manhour_number) > 0.00 then "Profit"
    when(project_plan.Total___Manhours - ${TABLE}.manhour_number) < 0.00 then "Loss"
    when(project_plan.Total___Manhours - ${TABLE}.manhour_number) = 0.00 then "Loss"
    else "Others"
    end ;;
  }

  dimension: in_progress {
    label : "In Progress "
    description: "Bigquery : Jira status - In progress"
    type: number
    sql: ${TABLE}.In_progress ;;
  }

  dimension: quality_assurance {
    label: "Quality Assurance"
    description: "Bigquery : Jira status - Quality Assurance"
    type: number
    sql: ${TABLE}.Quality_Assurance ;;
  }

  dimension: follow_up_clients {
    label: "Follow Up Clients"
    description: "Bigquery : Jira status - Follow Up Clients"
    type: number
    sql: ${TABLE}.Follow_up_Clients ;;
  }

  dimension: ready_to_send {
    label: "Ready To Send"
    description: "Bigquery : Jira status - Ready To Send"
    type: number
    sql: ${TABLE}.Ready_To_Send ;;
  }

  dimension: done {
    label: "Done"
    description: "Bigquery : Jira status - Done"
    type: number
    sql: ${TABLE}.Done ;;
  }

  dimension: scope_id {
    label: "Scope ID"
    description: "Bigquery : Scope ID from Jira Dataset (Orignal)"
    type: string
    sql: ${TABLE}.scope_id ;;
    tags: ["string"]
    link: {
      label: "User Lookup Dashboard"
      url: "/dashboards/30?Billing=&Scope%20ID={{ project_progress.scope_id }}"
      icon_url: "https://www.looker.com/static/assets/looker_logo_meta.png"
    }
  }

  measure: percentage_progress {
    label: "Total Progress Percentage"
    description: "Custom Measure : Percentage of Project Completion"
    type: average
    sql: 1.0 * ${TABLE}.actual_score/ nullif(${TABLE}.total_score ,0) ;;
    value_format_name: percent_2
    drill_fields: [detail_mh*]
  }

  measure: man_day {
    label: "Manday"
    description: "Bigquery : Total Mandays that employee doing in this task (Convert from Total Number manhour)"
    type: sum
    sql: ${TABLE}.man_day ;;
  }

  measure: man_hour {
    label: "ManHours"
    description: "Bigquery : Total ManHours that employee doing in this task (Convert from Total Number manhour)"
    type: sum
    sql: ${TABLE}.man_hour ;;
  }

  measure: actual_manhour {
    label: "Actual Manhour"
    description: "Bigquery : Actual Manhour (Int64 Type Not convert by duration format)"
    type: sum
    sql: ${TABLE}.manhour_number ;;
    value_format_name: decimal_2
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

  measure: calculated_mh {
    label: "Calculated Manhour"
    description: "Custom Measure : Calcalated Manhour Balance from Total Manhour Usage"
    type: sum
    sql: NULLIF(project_plan.Total___Manhours,0) - ${TABLE}.manhour_number  ;;
    value_format_name: decimal_2
  }
  measure: count {
    label: "Count"
    description: "Default Looker : Count it Depend on dimesion that you've selected"
    type: count
  }

  set: detail_mh {
    fields: [scope_id,everhour_dataset.member ,everhour_dataset.task ,everhour_dataset.billing ,everhour_dataset.time,everhour_dataset.day_date]
  }
}
