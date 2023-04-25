connection: "management_details"
include: "/views/**/*.view"

datagroup: management_default_datagroup {
  max_cache_age: "24 hour"
}

persist_with: management_default_datagroup

explore: sql_runner_query_date {

}


explore: sql_runner_query_revenue{
  access_filter: {
    field: pillar
    user_attribute: employee_type
  }
  # join: jira_dataset_period {
  #   type: left_outer
  #   view_label: "Jira by Month"
  #   relationship: one_to_many
  #   sql_on:${sql_runner_query_revenue.scope_id}= ${jira_dataset_period.scope_ids}   ;;
  # }
  }


explore: sql_runner_query_budget{
  access_filter: {
    field: pillar
    user_attribute: employee_type

  }
  }
