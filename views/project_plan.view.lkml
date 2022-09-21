view: project_plan {
  # # You can specify the table name if it's different from the view name:
  sql_table_name: management_detail.project_plan ;;
  #
  # # Define your dimensions and measures here, like this:

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
    sql: ${TABLE}.Project__Start_Date ;;
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

  dimension: bd {
    description: "Unique ID for each user that has ordered"
    type: string
    sql: ${TABLE}.BD ;;
  }

  dimension:pm {
    description: "Unique ID for each user that has ordered"
    type: string
    sql: ${TABLE}.PM ;;
  }

  dimension: mentor {
    description: "Unique ID for each user that has ordered"
    type: string
    sql: ${TABLE}.Mentor ;;
  }

  dimension: Clients {
    description: "Unique ID for each user that has ordered"
    type: string
    sql: ${TABLE}.Clients ;;
  }

  dimension: Customer_AR {
    description: "Unique ID for each user that has ordered"
    type: string
    sql: ${TABLE}.Customer_AR ;;
  }

  dimension: scope_id {
    description: "Unique ID for each user that has ordered"
    type: string
    sql: ${TABLE}.Scope_ID ;;
  }

  dimension: project_name {
    description: "Unique ID for each user that has ordered"
    type: string
    sql: ${TABLE}.Project_Name ;;
  }

  dimension: SCOPE {
    description: "Unique ID for each user that has ordered"
    type: string
    sql: ${TABLE}.SCOPE ;;
  }

  dimension: Product_Name {
    description: "Unique ID for each user that has ordered"
    type: string
    sql: ${TABLE}.Product_Name ;;
  }
  dimension: Department {
    description: "Unique ID for each user that has ordered"
    type: string
    sql: ${TABLE}.Department ;;
  }

  measure: total_mh {
    type: sum
    sql: ${TABLE}.Total___Manhours ;;
    value_format_name: percent_2
  }




  measure: count {
    type: count
    drill_fields: []
  }
}
