view: employee_dataset {
  sql_table_name: `management_detail.employee_dataset`
    ;;

  dimension: department_new {
    label: "Department"
    description: "Bigquery : Department"
    type: string
    sql: ${TABLE}.Department_New ;;
  }

  dimension: employee_name_en {
    label: "Employee"
    description: "Bigquery : Employee Name"
    type: string
    sql: ${TABLE}.Employee_Name_EN ;;
  }

  dimension: group {
    label: "Group"
    description: "Bigquery : Group of user"
    type: string
    sql: ${TABLE}.`Group` ;;
  }

  dimension: nickname_en {
    label: "Nickname"
    description: "Bigquery : Nickname"
    type: string
    sql: ${TABLE}.Nickname_EN ;;
  }

  dimension: no_ {
    label: "Number of Employee"
    description: "Bigquery : Number of Employee"
    type: number
    sql: ${TABLE}.`No` ;;
  }

  dimension: title {
    label: "Title"
    description: "Bigquery : Position / Roles / Job description"
    type: string
    sql: ${TABLE}.Title ;;
  }

  dimension: work_email {
    label: "Email"
    description: "Bigquery : Employye e-Mail "
    type: string
    sql: ${TABLE}.Work_Email ;;
    action: {
      label: "Send Emails Warning"
      url: "https://segment.com"
      icon_url: "https://logos-world.net/wp-content/uploads/2020/11/Gmail-Logo.png"
      form_url: "https://example.com/ping/{{ value }}/form.json"
      param: {
        name: "name string"
        value: "value string"
      }
      form_param: {
        name: "possibly-localized-string"
        type: string
        label: "Message Input"
        option: {
          name: "name string"
          label: "possibly-localized-string"
        }
        required: yes
        description: "Welcome"
        default: "string"
      }
      user_attribute_param: {
        user_attribute: project_access
        name: "name_for_json_payload"
      }
    }
  }

  measure: count {
    label: "Count"
    description: "Count it, Depend on dimension that you've selected."
    type: count
    drill_fields: []
  }
}
