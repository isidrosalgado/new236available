# The name of this view in Looker is "Orders"
view: orders {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: demo_db.orders ;;
  drill_fields: [id]
  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.created_at ;;
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Status" in Explore.

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: user_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.user_id ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      users.id,
      users.first_name,
      users.last_name,
      billion_orders.count,
      fakeorders.count,
      hundred_million_orders.count,
      hundred_million_orders_wide.count,
      order_items.count,
      order_items_vijaya.count,
      ten_million_orders.count
    ]
  }

#testsssssssssssssssssssssconcat


  dimension: week_test {
    sql: WEEK(${TABLE}.created_at);;
    group_label: "Date Date"
    group_item_label: "Week Test"
  }
  dimension: day_test {
    hidden: yes
    sql: DAY(${TABLE}.created_at);;
    group_label: "Date Date"
    group_item_label: "Week Test"
  }

  dimension_group: date {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      month_name,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.created_at ;;
  }


  dimension: test {
    type: string
    sql: CONCAT(CAST(${date_month_name} AS CHAR(3)), ' ', CAST(YEAR(${TABLE}.created_at) AS CHAR)) ;;
  }


  # dimension: test {
  #  type: string
  # sql: CONCAT(CAST(${date_month_name} AS CHAR),' || Wk- ', CAST(ROUND((CONVERT(DAY(${TABLE}.created_at),DECIMAL)+6)/7) AS CHAR)) ;;
  #}

#testssssssssssssssssAlankritaconcat

#testssssssssssssssssAkhmerovliquid

  dimension: prior_month_label {
    label: "Prior Month"
    type: string
    sql:{% assign yr = 'now' | date: '%Y' %} {% assign month = 'now' | date: '%m' %}

      {% assign prior_month = 'now' | date: '%m' | minus:1 %}

      {% assign prior_date = yr | append: '-' | append: prior_month | append: '-01' %}

      {{ prior_date | date: '%b %Y' }};;
  }


  dimension: test_date_format1 {
    sql: '2022-01-01' ;;
    html: {{rendered_value | date: "%b %d, %Y"}} ;;
  }

  dimension: test_date_format2 {
    sql: '2022-1-01' ;;
    html: {{rendered_value | date: "%b %d, %Y"}} ;;
  }


#testssssssssssssssssAkhmerovliquid

#testsssssssssssssssssssZianWang
  dimension: time_stamp{
    sql:  ${TABLE}.created_at ;;

  }

  dimension: test_date {
    sql: ${TABLE}.created_at ;;
    html: {{rendered_value |date:"%s"}};;

  }
#testsssssssssssssssssssZianWang

  parameter: date_start {
    type: date
    description: "Use this field to select a date to filter results by."
  }

  parameter: date_end {
    type: date
    description: "Use this field to select a date to filter results by."
  }

  dimension_group: orders{
    type: time
    timeframes: [
      raw,
      date,
      hour,
      minute,
      second
    ]
    sql: ${TABLE}.created_at ;;
  }
  #test

  dimension: max_create_date {
    type: string
    sql: (SELECT MAX(created_at) FROM  demo_db.orders) ;;
  }


#test_yes_no.............................

  dimension: status_yes_no {
    label: "yes no"
    type: yesno
    sql:${TABLE}.status IN ('pending', 'complete') ;;
  }

  measure: count_yes_no {
    type: sum_distinct
    sql: ${status_yes_no};;
    value_format: "$#.00;($#.00)"

  }

  measure:count_yes_no_percent {
    type: percent_of_total
    sql: ${status_yes_no};;
    value_format: "0.000"
  }

  #test_yes_no.............................

  measure: Orders_sum {
    type: sum
    sql: ${user_id} ;;
  }





  measure: count_of_cancellations {
    type: number
    sql:COUNT(distinct ${id}) ;;
    drill_fields: [id,user_id,status]
    #sql_distinct_key: ${user_id} ;;
  }
  #bug testing
  measure: negative_count {
    type: number
    sql: ${count_of_cancellations}*-1 ;;
  }

  measure: negative_1 {
    type: number
    sql: ${count_of_cancellations}*-1+1;;
  }

  measure: test_cunt {
    type: count_distinct
    sql: ${id} ;;
  }

  measure: test_avg {
    type: number
    sql: 1.0 * ${test_cunt}/${Orders_sum};;
  }

  filter: date_filter {
    type: date
  }



}
