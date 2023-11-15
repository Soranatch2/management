connection: "management_details"
include: "/views/**/*.view"

datagroup: management_default_datagroup {
  max_cache_age: "24 hour"
}

persist_with: management_default_datagroup
explore: test_jira {
  label: "Master_Project"
  view_name: jira_dataset_test
  view_label: "Jira"

  join: everhour_dataset {
    type: left_outer
    view_label: "Everhour"
    relationship: one_to_many
    sql_on: ${jira_dataset_test.scope_id} = trim(${everhour_dataset.scope_id}) ;;
  }

  join: everhour_time_tracking {
    type: left_outer
    view_label: "Everhour Time Summary"
    relationship: one_to_one
    sql_on: ${jira_dataset_test.scope_id} = trim(${everhour_time_tracking.scope_id}) ;;
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
    sql_on: ${jira_dataset_test.scope_id} = ${project_plan.scope_id} ;;
  }

}
