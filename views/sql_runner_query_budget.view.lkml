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

    dimension: type {
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

  dimension: service_type {
    type: string
    sql:
    case when ${type} like "%Revenue%" then "Tools"
    else "Services"
    end;;
  }

  dimension: team_leader {
    type: string
    sql:
    case when ${TABLE}.team =" DA1" then "Au"
    when ${TABLE}.team =" DA2" then "Champ"
    when ${TABLE}.team =" DA3" then "Fern"
    when ${TABLE}.team =" DA4" then "Krumkrim"
    when ${TABLE}.team =" DA5" then "Tay"
    when ${TABLE}.team =" SEO" then "SEO"
    when ${TABLE}.team =" DS" then "DS"
    when ${TABLE}.team =" B1" then "B1"
    when ${TABLE}.team =" B2" then "B2"
    end;;
  }


  measure: revenue_target {
    type: sum
    filters: [type: "%Revenue%"]
    sql: ${TABLE}.Target ;;
    value_format: "#,##0.00"
  }

  measure: revenue_actual {
    type: sum
    filters: [type: "%Revenue%"]
    sql: ${TABLE}.Actual ;;
    value_format: "#,##0.00"
  }

  measure: cost_target {
    type: sum
    filters: [type: "-%Revenue%"]
    sql: ${TABLE}.Target ;;
    value_format: "#,##0.00"
  }

  measure: cost_actual {
    type: sum
    filters: [type: "-%Revenue%"]
    sql: ${TABLE}.Actual ;;
    value_format: "#,##0.00"
  }


  measure: cost_tool_team_target {
    hidden: no
    type: sum
    filters: [type: "%Tools%,%Team%,-%Selling%"]
    sql: ${TABLE}.Target;;
    value_format: "#,##0.00"
  }



  measure: cost_tool_team_actual {
    hidden: no
    type: sum
    filters: [type: "%Tools%,%Team%,-%Selling%"]
    sql: ${TABLE}.Actual;;
    value_format: "#,##0.00"
  }

  measure: gross_profit_target {
    type: number
    sql: ${revenue_target}-${cost_tool_team_target} ;;
    value_format: "#,##0.00"
  }

  measure: gross_profit_actual {
    type: number
    sql: ${revenue_actual}-${cost_tool_team_actual} ;;
    value_format: "#,##0.00"
  }

  measure: net_profit_actual {
    type: number
    sql: ${revenue_actual}-${cost_actual} ;;
    value_format: "#,##0.00"
  }


  measure: net_profit_target {
    type: number
    sql: ${revenue_target}-${cost_target} ;;
    value_format: "#,##0.00"
  }

measure: percent_gross_profit_target {
  type: number
  sql: ${gross_profit_target}/${revenue_target}*100 ;;
  value_format: "0.0\%"
}

  measure: percent_gross_profit_actual {
    type: number
    sql: ${gross_profit_actual}/${revenue_actual}*100 ;;
    value_format: "0.0\%"
  }

  measure: percent_net_profit_target {
    type: number
    sql: ${net_profit_target}/${revenue_target}*100 ;;
    value_format: "0.0\%"
  }

  measure: percent_net_profit_actual {
    type: number
    sql: ${net_profit_actual}/${revenue_actual}*100 ;;
    value_format: "0.0\%"
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
