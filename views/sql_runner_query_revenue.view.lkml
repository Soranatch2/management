view: sql_runner_query_revenue {
  derived_table: {
    sql: With table1 as ( SELECT * FROM `research-development-361301.management_detail.project_plan`)
      ,
      table2 as (
      SELECT * FROM `research-development-361301.management_detail.everhour_time_tracking`
      )
      select table1.scope_id,client_company, Clients, Price_after_Discount__Exclude_Vat_, Total___Manhours, table2.manhour_number, Service_Type,pillar_, service, Project__Start_Date,sales_date_active, Project__End_Date, coalesce(Forecast_End_Date,Project__End_Date) as Forecast_End_Dates, client_prefix,Project_status,Product_Name from table1
      LEFT JOIN table2 ON table1.scope_id = table2.scope_id
      ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension_group: project_start_day {
    label: "Project Start"
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
    sql: ${TABLE}.Project__Start_Date ;;
  }

  dimension_group: project_end_day {
    label: "Project End"
    description: "Bigquery : Project End Date"
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
    sql: ${TABLE}.Project__End_Date ;;
  }

  dimension_group: sale_day {
    label: "Sale"
    description: "Bigquery : Sale Date"
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      day_of_week,
      quarter_of_year,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.sales_date_active ;;
  }

  dimension_group: forecast_end_day {
    label: "Forecast End"
    description: "Bigquery : Sale Date"
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
    sql: ${TABLE}.Forecast_End_Dates ;;
  }


  dimension: scope_id {
    label: "Scope ID"
    description: "Bigquery : Scope ID"
    type: string
    sql: ${TABLE}.scope_id ;;
  }

  dimension: client_company {
    label: "Client Company"
    description: "Bigquery : Client Company Level"
    type: string
    sql: ${TABLE}.client_company ;;
  }

  dimension: client_prefix {
    label: "Client Sub Project"
    description: "Bigquery : Client sub project"
    type: string
    sql: ${TABLE}.client_prefix ;;
  }

  dimension: pillar {
    label: "Pillar"
    description: "Bigquery : Pillar Team"
    type: string
    sql: ${TABLE}.pillar_;;
  }

  dimension : service_type {
    label: "Service Type"
    description: "Bigquery : Service type"
    type: string
    sql:${TABLE}.Service_Type;;
  }

  dimension : service {
    label: "Service"
    description: "Bigquery : Service Name"
    type: string
    sql:${TABLE}.Service;;
  }

  dimension: project_status_pm{
    label: "Project Status PM"
    description: "Bigquery : Project Status from PM Update"
    type: string
    sql: ${TABLE}.Project_status ;;
  }
  dimension: product_name {
    label: "Product Name"
    description: "Bigquery : Product Name (Related with SCOPE Dimension)"
    type: string
    sql: ${TABLE}.Product_Name ;;
  }


  measure: price_after_discount__exclude_vat_ {
    label: "Price After Discount excl. Vat"
    description: "Bigquery : Price After Discount excl. Vat"
    type: sum
    sql: ${TABLE}.Price_after_Discount__Exclude_Vat_ ;;
    drill_fields: [detail*]
  }

  measure: total___manhours {
    label: "Total Manhours"
    description: "Bigquery : Total Manhours by BD"
    type: sum
    sql: ${TABLE}.Total___Manhours ;;
  }

  measure: manhour_number {
    label: "Actual Manhours"
    description: "Bigquery : Actual Manhours in Everhour"
    type: sum
    sql: ${TABLE}.manhour_number ;;
  }

  measure: gross_profit {
    label: "Gross Profit"
    description: "Price After Discount excl. Vat - Actual Manhour Cost"
    type: number
    sql: ${price_after_discount__exclude_vat_}-350*${manhour_number} ;;
  }

  set: detail {
    fields: [
      scope_id,
      client_company,
      sale_day_date,
      forecast_end_day_date,
      price_after_discount__exclude_vat_,
      total___manhours,
      manhour_number,
      gross_profit

    ]
  }
}
