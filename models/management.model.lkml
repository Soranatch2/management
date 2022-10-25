connection: "management_details"

# include all the views
include: "/views/**/*.view"

datagroup: management_default_datagroup {
  # sql_trigger: SELECT MAX(scope_id) FROM project_progress;;
  max_cache_age: "24 hour"
}

persist_with: management_default_datagroup

explore: project_progress {
  label: "Master_Project"
  view_name: project_progress

  join: everhour_dataset {
    type: left_outer
    view_label: "Everhour"
    relationship: one_to_one
    sql_on: ${project_progress.scope_id} = trim(${everhour_dataset.scope_id}) ;;
  }

  join: jira_dataset {
    type: left_outer
    view_label: "Jira"
    relationship: one_to_one
    sql_on: ${project_progress.scope_id} = ${jira_dataset.scope_id} ;;
  }

  join: employee_dataset {
    type: left_outer
    view_label: "Employee"
    relationship: one_to_one
    sql_on: trim(${everhour_dataset.member}) = ${employee_dataset.employee_name_en} ;;
  }

  join: project_plan {
    type: left_outer
    view_label: "Project"
    relationship: one_to_one
    sql_on: ${project_progress.scope_id} = ${project_plan.scope_id} ;;
  }

}

explore: sql_runner_query_date {


}

# explore: jira_dataset {}

# explore: everhour_time_tracking {}

# explore: everhour_dataset {}

# explore: project_plan{}
