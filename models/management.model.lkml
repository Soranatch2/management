connection: "management_detail"

# include all the views
include: "/views/**/*.view"

datagroup: management_default_datagroup {
   sql_trigger: SELECT MAX(scope_id) FROM project_progress;;
  max_cache_age: "1 hour"
}

persist_with: management_default_datagroup

explore: project_progress {
  label: "(1) Orders, Items and Users"
  view_name: project_progress

  join: everhour_dataset {
    type: left_outer
    view_label: "everhour_scope_id"
    relationship: one_to_one
    sql_on: ${project_progress.scope_id} = trim(${everhour_dataset.scope_id}) ;;
  }

  join: jira_dataset {
    type: left_outer
    view_label: "scope_id"
    relationship: one_to_one
    sql_on: ${project_progress.scope_id} = ${jira_dataset.scope_id} ;;
  }

}

explore: employee_dataset {

  join: everhour_dataset {
    type: left_outer
    view_label: "employee_match"
    relationship: one_to_many
    sql_on: ${employee_dataset.employee_name_en} = trim(${everhour_dataset.member}) ;;
  }

}

explore: jira_dataset {}

explore: everhour_time_tracking {}

explore: everhour_dataset {}
