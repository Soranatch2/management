view: project_progress {
  sql_table_name: `management_detail.project_progress`
    ;;

  dimension_group: project_start {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.project_start ;;
  }

  dimension_group: project_end {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.Project__End_Date;;
  }

  dimension: project_name {
    type: string
    sql: ${TABLE}.project_name ;;
  }

  dimension: bd {
    type: string
    sql: ${TABLE}.BD ;;
  }

  dimension: in_progress {
    type: number
    sql: ${TABLE}.In_progress ;;
  }


  dimension: quality_assurance {
    type: number
    sql: ${TABLE}.Quality_Assurance ;;
  }

  dimension: follow_up_clients {
    type: number
    sql: ${TABLE}.Follow_up_Clients ;;
  }

  dimension: ready_to_send {
    type: number
    sql: ${TABLE}.Ready_To_Send ;;
  }

  dimension: done {
    type: number
    sql: ${TABLE}.Done ;;
  }


  dimension: scope_id {
    type: string
    sql: ${TABLE}.scope_id ;;
  }

  dimension: scope_ids {
    type: string
    sql: ${TABLE}.scope_ids ;;
  }


  measure: percentage_progress {
    label: "Total Progress Percentage"
    type: average
    sql: 1.0 * ${TABLE}.actual_score/ nullif(${TABLE}.total_score ,0) ;;
    value_format_name: percent_2
    drill_fields: [detail_mh*]
  }

  measure: estimate_manhours {
    type: sum
    sql: ${TABLE}.estimate_manhours ;;
    value_format_name: decimal_2
  }

  measure: man_day {
    type: sum
    sql: ${TABLE}.man_day ;;
  }

  measure: man_hour {
    type: sum
    sql: ${TABLE}.man_hour ;;
  }

  measure: actual_manhour {
    type: sum
    sql: ${TABLE}.manhour_number ;;
    value_format_name: decimal_2
  }
  measure: total {
    type: sum
    sql: ${TABLE}.total ;;
  }

  measure: actual_score {
    type: sum
    sql: ${TABLE}.actual_score ;;
  }

  measure: total_score {
    type: sum
    sql: ${TABLE}.total_score ;;
  }

  measure: calculated_mh {
    type: sum
    sql: ${TABLE}.estimate_manhours - ${TABLE}.manhour_number  ;;
    value_format_name: decimal_2
  }
  measure: count {
    type: count
    drill_fields: [project_name]
  }

  set: detail_mh {
    fields: [scope_id,everhour_dataset.member ,everhour_dataset.task ,everhour_dataset.billing ,everhour_dataset.time]
  }
}
