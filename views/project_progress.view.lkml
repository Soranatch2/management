view: project_progress {
  sql_table_name: `management_detail.project_progress`
    ;;

  dimension: actual_score {
    type: number
    sql: ${TABLE}.actual_score ;;
  }

  dimension: bd {
    type: string
    sql: ${TABLE}.BD ;;
  }

  dimension: done {
    type: number
    sql: ${TABLE}.Done ;;
  }

  dimension: estimate_manhours {
    type: number
    sql: ${TABLE}.estimate_manhours ;;
  }

  dimension: follow_up_clients {
    type: number
    sql: ${TABLE}.Follow_up_Clients ;;
  }

  dimension: in_progress {
    type: number
    sql: ${TABLE}.In_progress ;;
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
    sql: ${TABLE}.project_end ;;
  }

  dimension: project_name {
    type: string
    sql: ${TABLE}.project_name ;;
  }

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

  dimension: scope_ids {
    type: string
    sql: ${TABLE}.scope_ids ;;
  }


  measure: percentage_progress {
    type: number
    sql: ${TABLE}.percentage_progress ;;
    value_format_name: decimal_2
  }

  measure: man_day {
    type: number
    sql: ${TABLE}.man_day ;;
  }

  measure: man_hour {
    type: string
    sql: ${TABLE}.man_hour ;;
  }

  measure: manhour_number {
    type: number
    sql: ${TABLE}.manhour_number ;;
  }
  measure: total {
    type: number
    sql: ${TABLE}.total ;;
  }

  measure: total_score {
    type: number
    sql: ${TABLE}.total_score ;;
  }

  measure: count {
    type: count
    drill_fields: [project_name]
  }
}
