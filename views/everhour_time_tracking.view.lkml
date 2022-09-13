view: everhour_time_tracking {
  sql_table_name: `management_detail.everhour_time_tracking`
    ;;

  dimension_group: _timestamp {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}._timestamp ;;
  }

  dimension: man_day {
    type: number
    sql: ${TABLE}.man_day ;;
  }

  dimension: man_hour {
    type: string
    sql: ${TABLE}.man_hour ;;
  }

  dimension: manhour_number {
    type: number
    sql: ${TABLE}.manhour_number ;;
  }

  dimension: scope_id {
    type: string
    sql: ${TABLE}.scope_id ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
