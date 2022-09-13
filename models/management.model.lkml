connection: "management_detail"

# include all the views
include: "/views/**/*.view"

datagroup: management_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: management_default_datagroup

explore: everhour_dataset {}

explore: everhour_time_tracking {}

explore: jira_dataset {}

explore: project_progress {}
