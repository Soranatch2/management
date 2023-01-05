view: project_plan {
  # # You can specify the table name if it's different from the view name:
  sql_table_name: management_detail.project_plan ;;
  #
  # # Define your dimensions and measures here, like this:

  dimension_group: project_start {
    label: "Project Start Date"
    description: "Bigquery : Project Start Date"
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.Project__Start_Date ;;
  }

  dimension_group: predict_end_date {
    label: "Predict End Date"
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    description: "Bigquery : Project End Date Max(Forecast , AllProject)"
    sql: case
          when ${TABLE}.project__End_Date > ${TABLE}.Forecast_End_Date then ${TABLE}.Project__End_Date
          when ${TABLE}.Forecast_End_Date >= ${TABLE}.project__End_Date then ${TABLE}.Forecast_End_Date
          else COALESCE(${TABLE}.Project__End_Date , ${TABLE}.Forecast_End_Date)
          end ;;


    }

  dimension_group: project_end {
    label: "Project End Date"
    description: "Bigquery : Project End Date"
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.Project__End_Date ;;
  }

  dimension_group: Forecast_End_Date {
    label: "Project Forecast End Date"
    description: "Bigquery : Project Forecast End Date"
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.Forecast_End_Date ;;
  }

  dimension_group: sale_date_active {
    label: "Sale Date"
    description: "Bigquery : Sale Year + Month + Day01"
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.sales_date_active ;;
  }


  dimension: bd {
    label: "Business Development Name"
    description: "Bigquery : Business Development who responsible for this project"
    type: string
    sql: ${TABLE}.BD ;;
  }

  dimension: project_status_pm{
    label: "Project Status PM"
    description: "Bigquery : Project Status from PM Update"
    type: string
    sql: ${TABLE}.Project_status ;;
  }

  dimension: pillar{
    label: "Team Pillar"
    description: "Bigquery : Pillar updated from ALL Project"
    type: string
    sql: ${TABLE}.Pillar_ ;;
  }


  dimension:pm {
    label: "Project Development Name"
    description: "Bigquery : Project Manager who responsible for this project"
    type: string
    sql: ${TABLE}.PM ;;
  }

  dimension: mentor {
    label: "Mentor"
    description: "Bigquery : Mentor/Manager who responsible for this project"
    type: string
    sql: ${TABLE}.Mentor ;;
  }

  dimension: clients {
    label: "Client Name"
    description: "Bigquery : Client Name"
    type: string
    sql: ${TABLE}.Clients ;;
    drill_fields: [project_detial*]
    }

  dimension: client_prefix {
    label: "Client Sub Project"
    description: "Bigquery : Client sub project"
    type: string
    sql: ${TABLE}.client_prefix ;;
  }

  dimension: client_company {
    label: "Client Company"
    description: "Bigquery : Client Company Level"
    type: string
    sql: ${TABLE}.client_company ;;
  }


  dimension: customer_ar {
    label: "Customer AR"
    description: "Bigquery : Customer Full Name"
    type: string
    sql: ${TABLE}.Customer_AR ;;
  }

  dimension: scope_id {
    primary_key: yes
    label: "Scope ID"
    description: "Bigquery : Scope ID from project plan Google Sheet"
    type: string
    sql: ${TABLE}.Scope_ID ;;
    tags: ["string"]
    link: {
      label: "User Lookup Dashboard"
      url: "/dashboards/30?Billing=&Scope%20ID={{ project_progress.scope_id }}"
      icon_url: "https://www.looker.com/static/assets/looker_logo_meta.png"
    }
  }

  dimension: project_name {
    label: "Project Name"
    description: "Bigquery : Project Name"
    type: string
    sql: ${TABLE}.Project_Name ;;
  }

  dimension: scope {
    label: "SCOPE"
    description: "Bigquery : Split Scope of work by Department from Scope ID"
    type: string
    sql: ${TABLE}.SCOPE ;;
    drill_fields: [scope_drill*]
  }

  dimension: product_name {
    label: "Product Name"
    description: "Bigquery : Product Name (Related with SCOPE Dimension)"
    type: string
    sql: ${TABLE}.Product_Name ;;
  }
  dimension: department {
    label: "Department"
    description: "Bigquery - Department of Predictvie Company"
    type: string
    sql: ${TABLE}.Department ;;
  }
  # dimension: service {
  #   label: "Department"
  #   description: "Bigquery - Department of Predictvie Company"
  #   type: string
  #   sql: ${TABLE}.Department ;;
  # }

  dimension: project_status{
    label: "Project Status From plan"
    description: "Custom Dimension : Project Status by Due date"
    type: string
    sql:
    case
    when (date_diff(case
          when ${TABLE}.project__End_Date > ${TABLE}.Forecast_End_Date then ${TABLE}.Project__End_Date
          when ${TABLE}.Forecast_End_Date >= ${TABLE}.project__End_Date then ${TABLE}.Forecast_End_Date
          else COALESCE(Project__End_Date , Forecast_End_Date)
          end , (current_date()-1), day)) is null then "End date missing"
    when (date_diff(case
          when ${TABLE}.project__End_Date > ${TABLE}.Forecast_End_Date then ${TABLE}.Project__End_Date
          when ${TABLE}.Forecast_End_Date >= ${TABLE}.project__End_Date then ${TABLE}.Forecast_End_Date
          else COALESCE(Project__End_Date , ${TABLE}.Forecast_End_Date)
          end , (current_date()-1), day)) between 1 and 30 then "Coming soon"
    when (date_diff(case
          when ${TABLE}.project__End_Date > ${TABLE}.Forecast_End_Date then ${TABLE}.Project__End_Date
          when ${TABLE}.Forecast_End_Date >= ${TABLE}.project__End_Date then ${TABLE}.Forecast_End_Date
          else COALESCE(${TABLE}.Project__End_Date , ${TABLE}.Forecast_End_Date)
          end , (current_date()-1), day)) > 30 then "Not over due"
    when (date_diff(case
          when ${TABLE}.project__End_Date > ${TABLE}.Forecast_End_Date then ${TABLE}.Project__End_Date
          when ${TABLE}.Forecast_End_Date >= ${TABLE}.project__End_Date then ${TABLE}.Forecast_End_Date
          else COALESCE(${TABLE}.Project__End_Date , ${TABLE}.Forecast_End_Date)
          end , (current_date()-1), day)) < 0 then "Over due"
    when (date_diff(case
          when ${TABLE}.project__End_Date > ${TABLE}.Forecast_End_Date then ${TABLE}.Project__End_Date
          when ${TABLE}.Forecast_End_Date >= ${TABLE}.project__End_Date then ${TABLE}.Forecast_End_Date
          else COALESCE(${TABLE}.Project__End_Date , ${TABLE}.Forecast_End_Date)
          end , (current_date()-1), day)) = 0 then "Over due"
    else "Contact Support"
    end
    ;;
  }




  dimension: IsOverDue {
    label: "Is Project over due?"
    description: "Bigquery - Project over due or not"
    type: yesno
    sql:(date_diff(${TABLE}.Project__End_Date, (current_date()-1), day)) <= 0  ;;
    drill_fields: [project_overdue*]
  }


  measure: total_mh {
    label: "Total Manhour"
    description: "Bigquery - Total Manhour (For sale Customer)"
    type: sum
    sql: ${TABLE}.Total___Manhours ;;
    value_format_name: decimal_2
  }

  measure: count {
    label: "Count"
    description: "Default Looker : Count it depend on dimension that you've selected"
    type: count
    drill_fields: []
  }

  set: scope_drill {
    fields: [department,customer_ar,total_mh]
  }

  set: project_detial {
    fields: [bd,pm,mentor,project_start_date,project_end_date,client_prefix]
  }

  set: project_overdue {
    fields: [project_name,clients,count]
  }
}
