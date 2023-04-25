view: sql_runner_query_date {
  derived_table: {
    sql: SELECT
      Member,
      Day,
      Task,
      Billing,
      Scope_ID,
        sum(Time) AS time
      FROM
        `research-development-361301.management_detail.everhour_dataset`
        group by 1,2,3,4,5
        order by 1
       ;;
  }
  view_label: "Raw Everhour"

  measure: count {
    type: count
    drill_fields: [detail*]
  }

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
    drill_fields: [everhour_dataset.task,everhour_dataset.billing]
  }

  dimension: member {
    type: string
    sql: ${TABLE}.Member ;;
    drill_fields: [sql_runner_query_date.Task,sql_runner_query_date.Billing]
  }

  dimension: task {
    type: string
    sql: ${TABLE}.Task ;;
  }
  dimension: scope_id {
    type: string
    sql: cast(${TABLE}.Scope_ID as string);;
  }

  dimension: billing {
    type: string
    sql: ${TABLE}.Billing ;;
  }


  dimension: day {
    type: date
    datatype: date
    sql: ${TABLE}.Day ;;
  }

  dimension: time {
    type: number
    sql: ${TABLE}.time ;;
  }

  set: detail {
    fields: [member, day, time]
  }

  measure: times {
    type: sum
    sql: ${TABLE}.time ;;
    value_format: "0.00"
  }
}
