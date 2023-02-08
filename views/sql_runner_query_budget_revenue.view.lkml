view: sql_runner_query_budget_revenue {
  derived_table: {
    sql: select * from `research-development-361301.financial_dataset.budget_revenue_dataset`
      ;;
  }

  measure: count {
    label: "Count"
    description: "Looker : Auto Generate"
    type: count
    drill_fields: [detail*]
  }



  dimension_group: Month {
    label: "Month"
    description: "Google Sheet : First Date Of Month"
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
    sql: ${TABLE}.Month ;;
    # drill_fields: [everhour_dataset.task,everhour_dataset.billing]
  }

  dimension: service {
    label: "Services"
    description: "Google Sheet: Services"
    type: string
    sql: ${TABLE}.Service ;;
  }

  dimension: account_no {
    label: "Account No."
    description: "Google Sheet: Account Number"
    type: string
    sql: ${TABLE}.Account_No ;;
  }

  dimension: pillar {
    label: "Pillar"
    description: "Google Sheet: Pillar Revenue"
    type: string
    sql:
    case when ${TABLE}.Pillar ="A" then "Customer Analytics"
    when ${TABLE}.Pillar ="B" then "Customer Activation"
    when ${TABLE}.Pillar ="C" then "Software Development"
    when ${TABLE}.Pillar ="D" then "Product Development"
    else "Quality Assurance"
    end;;
  }

  measure: target {
    label: "Revenue (Target)"
    description: "Google Sheet : Revenue Target"
    type:sum
    sql: ${TABLE}.Target;;
    value_format: "#,##0.00"

  }

  measure: actual {
    label: "Revenue (Actual)"
    description: "Google Sheet : Revenue Target"
    type: sum
    sql: ${TABLE}.Actual;;
    value_format: "#,##0.00"


  }

  set: detail {
    fields: [service, account_no, pillar, target]
  }
}
