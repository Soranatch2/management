view: sql_runner_analytics_budget {
  derived_table: {
    sql: SELECT * FROM `research-development-361301.financial_dataset.analytics_budget_dataset`
      ;;
  }

  measure: count {
    label: "Count"
    description: "Looker : Auto Generate"
    type: count
    drill_fields: [detail*]
  }

  # dimension: month {
  #   label: ""
  #   description: "Google Sheet : "
  #   type: date
  #   datatype: date
  #   sql: ${TABLE}.Month ;;
  # }

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
    drill_fields: [everhour_dataset.task,everhour_dataset.billing]
  }


  dimension: mentor {
    label: "Mentor"
    description: "Google Sheet : Mentor Name"
    type: string
    sql: ${TABLE}.Mentor ;;
  }

  measure: common_expenses__actual_ {
    label: "Common Expenses (Actual) "
    description: "Google Sheet : ค่าใช้จ่ายส่วนกลาง "
    type: sum
    sql: ${TABLE}.Common_Expenses__Actual_ ;;
  }

  measure: gross_profit__actual_ {
    label: "Gross Profit (Actual)"
    description: "Google Sheet : กำไรขั้นต้น Actual "
    type: sum
    sql: ${TABLE}.Gross_Profit__Actual_ ;;
  }

  measure: gross_profit_percent__actual_ {
    label: "Gross Profit Percent (Actual)"
    description: "Google Sheet : กำไรขั้นต้น % Actual "
    type: sum
    sql: ${TABLE}.Gross_Profit_Percent__Actual_ ;;
  }

  measure: income__actual_ {
    label: "Income (Actual)"
    description: "Google Sheet : รายได้ Actual "
    type: sum
    sql: ${TABLE}.Income__Actual_ ;;
  }

  measure: income___expense__actual_ {
    label: "Income - Expenses (Actual)"
    description: "Google Sheet : รายได้ - ค่าใช้จ่าย Actual"
    type: sum
    sql: ${TABLE}.Income___Expense__Actual_ ;;
  }

  measure: net_profit__actual_ {
    label: "Net Profit (Actual)"
    description: "Google Sheet : กำไรสุทธิ Actual"
    type: sum
    sql: ${TABLE}.Net_Profit__Actual_ ;;
  }

  measure: net_profit_percent__actual_ {
    label: "Net Profit Percent (Actual)"
    description: "Google Sheet : กำไรสุทธิ % Actual"
    type: sum
    sql: ${TABLE}.Net_Profit_Percent__Actual_ ;;
  }

  measure: services_revenue_analytics__actual_ {
    label: "Service Revenue Analytics (Actual)"
    description: "Google Sheet : Services Revenue Analytics Actual"
    type: sum
    sql: ${TABLE}.Services_Revenue_Analytics__Actual_ ;;
  }

  measure: team_cost__actual_ {
    label: "Team Cost (Actual)"
    description: "Google Sheet : ต้นทุนทีม Actual"
    type: sum
    sql: ${TABLE}.Team_Cost__Actual_ ;;
  }

  measure: tools__actual_ {
    label: "Tools (Actual)"
    description: "Google Sheet : เครื่องมือ Actual"
    type: sum
    sql: ${TABLE}.Tools__Actual_ ;;
  }

  measure: welfare_cost__actual_ {
    label: "Welfare Cost (Actual)"
    description: "Google Sheet : สวัสดิการ Actual"
    type: sum
    sql: ${TABLE}.Welfare_Cost__Actual_ ;;
  }

  measure: common_expenses__target_ {
    label: "Common Expenses (Target)"
    description: "Google Sheet : ค่าใช้จ่ายทั่วไป Target"
    type: sum
    sql: ${TABLE}.Common_Expenses__Target_ ;;
  }

  measure: gross_profit__target_ {
    label: "Gross Profit (Target)"
    description: "Google Sheet : กำไรขั้นต้น Target"
    type: sum
    sql: ${TABLE}.Gross_Profit__Target_ ;;
  }

  measure: gross_profit_percent__target_ {
    label: "Gross Profit Percent (Target)"
    description: "Google Sheet : กำไรขั้นต้น % Target"
    type: sum
    sql: ${TABLE}.Gross_Profit_Percent__Target_ ;;
  }

  measure: income__target_ {
    label: "Income (Target)"
    description: "Google Sheet :  รวมรายได้ Target"
    type: sum
    sql: ${TABLE}.Income__Target_ ;;
  }

  measure: income___expense__target_ {
    label: "Income - Expenses (Target)"
    description: "Google Sheet : รายได้ - ค่าใช้จ่าย Target "
    type: sum
    sql: ${TABLE}.Income___Expense__Target_ ;;
  }

  measure: net_profit__target_ {
    label: "Net Profit (Target)"
    description: "Google Sheet : กำไรสุทธิ Target"
    type: sum
    sql: ${TABLE}.Net_Profit__Target_ ;;
  }

  measure: net_profit_percent__target_ {
    label: "Net Profit Percent (Target)"
    description: "Google Sheet : กำไรสุทธิ % Target"
    type: sum
    sql: ${TABLE}.Net_Profit_Percent__Target_ ;;
  }

  measure: services_revenue_analytics__target_ {
    label: "Services Revenue Analytics (Target)"
    description: "Google Sheet : Service Revenue Targ"
    type: sum
    sql: ${TABLE}.Services_Revenue_Analytics__Target_ ;;
  }

  measure: team_cost__target_ {
    label: "Team Cost (Target)"
    description: "Google Sheet : ต้นทุนทีม Target"
    type: sum
    sql: ${TABLE}.Team_Cost__Target_ ;;
  }

  measure: tools__target_ {
    label: "Tools (Target)"
    description: "Google Sheet : เครื่องมือ Target"
    type: sum
    sql: ${TABLE}.Tools__Target_ ;;
  }

  measure: welfare_cost__target_ {
    label: "Welfare Cost (Target)"
    description: "Google Sheet : สวัสดิการ Target"
    type: sum
    sql: ${TABLE}.Welfare_Cost__Target_ ;;
  }

  set: detail {
    fields: [
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
