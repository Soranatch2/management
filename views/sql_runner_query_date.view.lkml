view: sql_runner_query_date {
  derived_table: {
    sql: SELECT
      Member,
      Day,
        sum(Time) AS time
      FROM
        `research-development-361301.management_detail.everhour_dataset`
      WHERE
        Day between '2022-09-01' and '2022-09-30'
        group by 1,2
        order by 1
       ;;
  }

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
  }

  dimension: member {
    type: string
    sql: ${TABLE}.Member ;;
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
}
