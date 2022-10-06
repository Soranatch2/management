view: everhour_time_tracking {
  sql_table_name: `management_detail.everhour_time_tracking`
    ;;

  dimension_group: _timestamp {
    label: "Timestamp"
    description: "Bigquery : Timestamp from raw data (Everhours Tamplate Report)"
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      day_of_week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}._timestamp ;;
  }

  dimension: man_day {
    label: "Man Day"
    description: "Bigquery : Man Day from total manhour usage"
    type: number
    sql: ${TABLE}.man_day ;;
  }

  dimension: man_hour {
    label: "Man Hour"
    description: "Bigquery : Man Hour from total manhour usage"
    type: string
    sql: ${TABLE}.man_hour ;;
  }

  dimension: manhour_number {
    label: "Manhour Usage"
    description: "Bigquery : Manhour Usage from Everhour Template Report"
    type: number
    sql: ${TABLE}.manhour_number ;;
  }

  dimension: scope_id {
    label: "Scope ID"
    description: "Bigquery : SCOPE ID"
    type: string
    sql: ${TABLE}.scope_id ;;
  }

  measure: count {
    label: "Count"
    description: "Default Looker : Count it ,Depend on dimension that you've selected"
    type: count
    drill_fields: []
  }

  measure: manhour_usage {
    label: "Manhour Usage"
    description: "Bigquery : Manhour Usage from Everhour Template Report"
    type:sum
    sql: ${TABLE}.manhour_number ;;
  }

}
