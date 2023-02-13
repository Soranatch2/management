view: sql_runner_query_budget {
  derived_table: {
    sql: select * from `research-development-361301.financial_dataset.budget_dataset`
      ;;
  }

  measure: count {
    type: count
    # drill_fields: [detail*]
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

  # dimension: service {
  #   type: string
  #   sql: ${TABLE}.Service ;;
  # }

    dimension: service {
    type: string
    sql: ${TABLE}.Service ;;
  }


  dimension: account_no {
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

  measure: revenue_target {
    type: sum
    filters: [service: "%Revenue%"]
    sql: ${TABLE}.Target ;;
  }

  measure: revenue_actual {
    type: sum
    filters: [service: "%Revenue%"]
    sql: ${TABLE}.Actual ;;
  }


  measure: cost_target {
    type: sum
    filters: [service: "-%Revenue%"]
    sql: ${TABLE}.Target ;;
  }

  measure: cost_actual {
    type: sum
    filters: [service: "-%Revenue%"]
    sql: ${TABLE}.Actual ;;
  }

#   set: detail {
#     fields: [
#       Month,
#       service,
#       account_no,
#       pillar,
#       target,
#       actual
#     ]
#   }
}
