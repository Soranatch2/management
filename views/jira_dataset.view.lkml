view: jira_dataset {
  sql_table_name: `management_detail.jira_dataset`
    ;;

  dimension: actual_score {
    type: number
    sql: ${TABLE}.actual_score ;;
  }

  dimension: done {
    type: number
    sql: ${TABLE}.Done ;;
  }

  dimension: follow_up_clients {
    type: number
    sql: ${TABLE}.Follow_up_Clients ;;
  }

  dimension: in_progress {
    type: number
    sql: ${TABLE}.In_progress ;;
  }

  dimension: percentage_progress {
    type: number
    sql: ${TABLE}.percentage_progress ;;
  }

  dimension: quality_assurance {
    type: number
    sql: ${TABLE}.Quality_Assurance ;;
  }

  dimension: ready_to_send {
    type: number
    sql: ${TABLE}.Ready_To_Send ;;
  }

  dimension: scope_id {
    type: string
    sql: ${TABLE}.scope_id ;;
  }

  dimension: total {
    type: number
    sql: ${TABLE}.total ;;
  }

  dimension: total_score {
    type: number
    sql: ${TABLE}.total_score ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
