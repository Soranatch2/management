view: jira_dataset_daily {
    sql_table_name: `management_detail.jira_dataset`
      ;;

  dimension_group: upload_date {
    description: "Bigquery : Jira uploaded date"
    type: time
    datatype: date
    timeframes: [date, week, month, year]
    sql:parse_date("%Y%m%d",${TABLE}.upload_date) ;;
  }

  dimension_group: last_updated_date {
    description: "Bigquery : Updated Status from Jira"
    type: time
    datatype: date
    timeframes: [date, week, month, year]
    sql: ${TABLE}.last_updated_date ;;
  }

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

  dimension: result {
    label: "Result"
    description: "Custom Dimension : Calculate Project for Profit and Loss"
    type: string
    sql:
    case
    when project_plan.Total___Manhours is null then "Total Mh missing"
    when everhour_time_tracking.manhour_number is null then "Actual Mh missing"
    when(project_plan.Total___Manhours - everhour_time_tracking.manhour_number) > 0.00 then "Profit"
    when(project_plan.Total___Manhours - everhour_time_tracking.manhour_number) < 0.00 then "Loss"
    when(project_plan.Total___Manhours - everhour_time_tracking.manhour_number) = 0.00 then "Loss"
    else "Others"
    end ;;
  }


  measure: custom_percentage_progress {
    label: "Total Progress Percentage"
    description: "Custom Measure : Percentage of Project Completion"
    type: average
    sql: 1.0 * ${TABLE}.actual_score/ nullif(${TABLE}.total_score ,0) ;;
    value_format_name: percent_2
  }

  # measure: percentage_progress {
  #   label: "Progress Percentage"
  #   description: "Custom Measure : Percentage of Project Completion"
  #   type: sum
  #   sql: ${TABLE}.percentage_progress ;;
  # }


    dimension: scope_id {
      label: "Scope ID"
      description: "Bigquery : Scope ID"
      type: string
      primary_key: yes
      sql: ${TABLE}.scope_id ;;
    }

    dimension: total {
      # hidden: yes
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
