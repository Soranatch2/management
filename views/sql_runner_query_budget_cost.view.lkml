view: sql_runner_query_budget_cost {
  derived_table: {
    sql: select * from `research-development-361301.financial_dataset.budget_cost_dataset`
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

  dimension: pillar {
    label: "Pillar"
    description: "Google Sheet : Pillar Cost"
    type: string
    sql:
    case
    when ${TABLE}.Pillar ="A" then "Customer Analytics"
    when ${TABLE}.Pillar ="B" then "Customer Activation"
    else "Others"
    end;;
  }

  measure: cost_tool_target {
    label: "Cost Tool (Target)"
    description: "Google Sheet : Cost Tools Target"
    type:sum
    sql: ${TABLE}.cost_tool_target;;
    value_format: "#,##0.00"
    }

  measure: cost_tool_actual {
    label: "Cost Tool (Actual)"
    description: "Google Sheet : Cost Tools Actual"
    type: sum
    sql: ${TABLE}.cost_tool_actual;;
    value_format: "#,##0.00"
    }

  measure: cost_team_target {
    label: "Cost Team (Target)"
    description: "Google Sheet : Cost Team Target"
    type: sum
    sql: ${TABLE}.cost_team_target;;
    value_format: "#,##0.00"
    }

  measure: cost_team_actual {
    label: "Cost Team (Actual)"
    description: "Google Sheet : Cost Team Actual "
    type: sum
    sql: ${TABLE}.cost_team_actual;;
    value_format: "#,##0.00"
    }

  measure: cost_selling_team_target {
    label: "Selling Team (Target)"
    description: "Google Sheet : Selling Team Target"
    type: sum
    sql: ${TABLE}.cost_selling_team_target;;
    value_format: "#,##0.00"
  }
  measure: cost_selling_team_actual {
    label: "Selling Team (Actual)"
    description: "Google Sheet : Selling Team Target"
    type: sum
    sql: ${TABLE}.cost_selling_team_actual;;
    value_format: "#,##0.00"
  }

  measure: common_expenses_target {
    label: "Common Expenses (Target)"
    description: "Google Sheet : Selling ส่วนกลาง Target"
    type: sum
    sql: ${TABLE}.common_expenses_target;;
    value_format: "#,##0.00"
  }

  measure: common_expenses_actual {
    label: "Common Expenses (Actual)"
    description: "Google Sheet : Selling ส่วนกลาง Actual"
    type: sum
    sql: ${TABLE}.common_expenses_actual;;
    value_format: "#,##0.00"
  }

  measure: common_expenses_admin_target {
    label: "Admin Target"
    description: "Google Sheet : Admin ส่วนกลาง Target"
    type: sum
    sql: ${TABLE}.common_expenses_admin_target;;
    value_format: "#,##0.00"
  }

  measure: common_expenses_admin_actual {
    label: "Admin Actual"
    description: "Google Sheet : Admin ส่วนกลาง Target"
    type: sum
    sql: ${TABLE}.common_expenses_admin_actual;;
    value_format: "#,##0.00"
  }

  set: detail {
    fields: [
      Month_date,
      pillar,
      cost_tool_target,
      cost_tool_actual,
      cost_team_target,
      cost_team_actual,
      cost_selling_team_target,
      cost_selling_team_actual,
      common_expenses_target,
      common_expenses_actual,
      common_expenses_admin_target
    ]
  }
}
