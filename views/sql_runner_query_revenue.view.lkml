view: sql_runner_query_revenue {
  derived_table: {
    sql: With table1 as ( SELECT * FROM `research-development-361301.management_detail.project_plan`)
      ,
      table2 as (
      SELECT * FROM `research-development-361301.management_detail.everhour_time_tracking`
      )
      select table1.scope_id,client_company, Clients, Price_after_Discount__Exclude_Vat_, Total___Manhours, table2.manhour_number, Service_Type,pillar_, service, Project__Start_Date as date from table1
      LEFT JOIN table2 ON table1.scope_id = table2.scope_id
      ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension_group: day {
    label: "Project Start Date"
    description: "Bigquery : Project Start Date"
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
    sql: ${TABLE}.date ;;
  }

  dimension: scope_id {
    type: string
    sql: ${TABLE}.scope_id ;;
  }

  dimension: client_company {
    type: string
    sql: ${TABLE}.client_company ;;
  }

  dimension: clients {
    type: string
    sql: ${TABLE}.Clients ;;
  }

  # dimension: price_after_discount__exclude_vat_ {
  #   type: number
  #   sql: ${TABLE}.Price_after_Discount__Exclude_Vat_ ;;
  # }
  measure: price_after_discount__exclude_vat_ {
    type: sum
    sql: ${TABLE}.Price_after_Discount__Exclude_Vat_ ;;
    drill_fields: [detail*]
  }

  # dimension: total___manhours {
  #   type: number
  #   sql: ${TABLE}.Total___Manhours ;;
  # }
  measure: total___manhours {
    type: sum
    sql: ${TABLE}.Total___Manhours ;;
  }

  # dimension: manhour_number {
  #   type: number
  #   sql: ${TABLE}.manhour_number ;;
  # }
  measure: manhour_number {
    type: sum
    sql: ${TABLE}.manhour_number ;;
  }

  dimension: pillar {
    type: string
    sql: ${TABLE}.pillar_;;
  }

  dimension : service_type {
    type: string
    sql:${TABLE}.Service_Type;;
  }

  dimension : service {
    type: string
    sql:${TABLE}.Service;;
  }

  set: detail {
    fields: [
      scope_id,
      client_company,
      clients,
      price_after_discount__exclude_vat_,
      total___manhours,
      manhour_number,
    ]
  }
}
