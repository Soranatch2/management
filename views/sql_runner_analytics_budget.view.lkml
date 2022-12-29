view: sql_runner_analytics_budget {
  derived_table: {
    sql: SELECT * FROM `research-development-361301.financial_dataset.analytics_budget_dataset`
      ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: month {
    type: date
    datatype: date
    sql: ${TABLE}.Month ;;
  }

  dimension: mentor {
    type: string
    sql: ${TABLE}.Mentor ;;
  }

  dimension: common_expenses__actual_ {
    type: number
    sql: ${TABLE}.Common_Expenses__Actual_ ;;
  }

  dimension: gross_profit__actual_ {
    type: number
    sql: ${TABLE}.Gross_Profit__Actual_ ;;
  }

  dimension: gross_profit_percent__actual_ {
    type: number
    sql: ${TABLE}.Gross_Profit_Percent__Actual_ ;;
  }

  dimension: income__actual_ {
    type: number
    sql: ${TABLE}.Income__Actual_ ;;
  }

  dimension: income___expense__actual_ {
    type: number
    sql: ${TABLE}.Income___Expense__Actual_ ;;
  }

  dimension: net_profit__actual_ {
    type: number
    sql: ${TABLE}.Net_Profit__Actual_ ;;
  }

  dimension: net_profit_percent__actual_ {
    type: number
    sql: ${TABLE}.Net_Profit_Percent__Actual_ ;;
  }

  dimension: services_revenue_analytics__actual_ {
    type: number
    sql: ${TABLE}.Services_Revenue_Analytics__Actual_ ;;
  }

  dimension: team_cost__actual_ {
    type: number
    sql: ${TABLE}.Team_Cost__Actual_ ;;
  }

  dimension: tools__actual_ {
    type: number
    sql: ${TABLE}.Tools__Actual_ ;;
  }

  dimension: welfare_cost__actual_ {
    type: number
    sql: ${TABLE}.Welfare_Cost__Actual_ ;;
  }

  dimension: common_expenses__target_ {
    type: number
    sql: ${TABLE}.Common_Expenses__Target_ ;;
  }

  dimension: gross_profit__target_ {
    type: number
    sql: ${TABLE}.Gross_Profit__Target_ ;;
  }

  dimension: gross_profit_percent__target_ {
    type: number
    sql: ${TABLE}.Gross_Profit_Percent__Target_ ;;
  }

  dimension: income__target_ {
    type: number
    sql: ${TABLE}.Income__Target_ ;;
  }

  dimension: income___expense__target_ {
    type: number
    sql: ${TABLE}.Income___Expense__Target_ ;;
  }

  dimension: net_profit__target_ {
    type: number
    sql: ${TABLE}.Net_Profit__Target_ ;;
  }

  dimension: net_profit_percent__target_ {
    type: number
    sql: ${TABLE}.Net_Profit_Percent__Target_ ;;
  }

  dimension: services_revenue_analytics__target_ {
    type: number
    sql: ${TABLE}.Services_Revenue_Analytics__Target_ ;;
  }

  dimension: team_cost__target_ {
    type: number
    sql: ${TABLE}.Team_Cost__Target_ ;;
  }

  dimension: tools__target_ {
    type: number
    sql: ${TABLE}.Tools__Target_ ;;
  }

  dimension: welfare_cost__target_ {
    type: number
    sql: ${TABLE}.Welfare_Cost__Target_ ;;
  }

  set: detail {
    fields: [
      month,
      mentor,
      common_expenses__actual_,
      gross_profit__actual_,
      gross_profit_percent__actual_,
      income__actual_,
      income___expense__actual_,
      net_profit__actual_,
      net_profit_percent__actual_,
      services_revenue_analytics__actual_,
      team_cost__actual_,
      tools__actual_,
      welfare_cost__actual_,
      common_expenses__target_,
      gross_profit__target_,
      gross_profit_percent__target_,
      income__target_,
      income___expense__target_,
      net_profit__target_,
      net_profit_percent__target_,
      services_revenue_analytics__target_,
      team_cost__target_,
      tools__target_,
      welfare_cost__target_
    ]
  }
}
