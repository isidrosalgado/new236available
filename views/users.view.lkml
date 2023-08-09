# The name of this view in Looker is "Users"
view: users {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: demo_db.users ;;
  drill_fields: [id]
  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }


  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Age" in Explore.


  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.


  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
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

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}.first_name ;;
    html: <div style="border: 2px solid #your-border-color; border-radius: your-border-radius;">
    Your Content Here
    </div>
  }
  }

  dimension: gender {
    type: string
    sql: ${TABLE}.gender ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}.last_name ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension: zip {
    type: zipcode
    sql: ${TABLE}.zip ;;
  }


  measure: total_revenue {
    type: average
    sql: ${age} ;;
  }



  dimension: age {
    type: number
    sql: ${TABLE}.age ;;
  }




  #################decimales intento con case when

##parameter: decimal_selector {
  ##type: unquoted
  ##allowed_value: {
  ##  label: "decimal_1"
  ##  value: "decimal_1"
  ##}
  ##allowed_value: {
    ##label: "decimal_2"
    ##value: "decimal_2"
##  }
  ##default_value: "decimal_1"
##}

##measure: percent_of_total_revenue {
##  type: number
##  sql: ${customer_revenue} / ${total};;
##  hidden: yes
##}

##measure: formatted_percent_of_total_revenue {
  ##type: string
  ##sql: CASE
    ##WHEN {% parameter decimal_selector %} = 'decimal_1' THEN CONCAT(FORMAT(${percent_of_total_revenue}, 1), '.0')
    ##WHEN {% parameter decimal_selector %} = 'decimal_2' THEN CONCAT(FORMAT(${percent_of_total_revenue}, 2), '.00')
    ##ELSE FORMAT(${percent_of_total_revenue}, 2)
  ##END;;
##}

#################decimales intento con case when
#################decimales intento seleccionando diferentes measures con case when tambien
  measure: customer_revenue {
    type: count
    drill_fields: [detail*]
    value_format: "$#.00;($#.00)"
  }

  measure: total {
    type: sum
    sql: ${age} ;;
    value_format: "$#.00;($#.00)"
  }

  parameter: decimal_selector {
    type: string
    allowed_value: {
      label: "decimal_1"
      value: "1"
    }
    allowed_value: {
      label: "decimal_2"
      value: "2"
    }
    allowed_value: {
      label: "decimal_3"
      value: "3"
    }
    allowed_value: {
      label: "decimal_4"
      value: "4"
    }
    allowed_value: {
      label: "decimal_5"
      value: "5"
    }
    allowed_value: {
      label: "decimal_6"
      value: "6"
    }
    allowed_value: {
      label: "decimal_7"
      value: "7"
    }
    allowed_value: {
      label: "decimal_8"
      value: "8"
    }
    allowed_value: {
      label: "decimal_9"
      value: "9"
    }
    allowed_value: {
      label: "decimal_10"
      value: "10"
    }
    allowed_value: {
      label: "decimal_11"
      value: "11"
    }
    allowed_value: {
      label: "decimal_12"
      value: "12"
    }
    default_value: "1"
  }

  measure: percent_of_total_revenue_decimal_1 {
    type: number
    sql: ${total} / ${customer_revenue}  ;;
    hidden: yes
  }

  measure: percent_of_total_revenue_decimal_2 {
    type: number
    sql: ${total} / ${customer_revenue}  ;;
    hidden: yes
    value_format: "$#.00;($#.00)"
  }

  measure: percent_of_total_revenue_decimal_3 {
    type: number
    sql: ${total} / ${customer_revenue}  ;;
    hidden: yes
  }

  measure: percent_of_total_revenue_decimal_4 {
    type: number
    sql: ${total} / ${customer_revenue}  ;;
    hidden: yes
  }

  measure: percent_of_total_revenue_decimal_5 {
    type: number
    sql: ${total} / ${customer_revenue}  ;;
    hidden: yes
  }

  measure: percent_of_total_revenue_decimal_6 {
    type: number
    sql: ${total} / ${customer_revenue}  ;;
    hidden: yes

  }

  measure: percent_of_total_revenue_decimal_7 {
    type: number
    sql: ${total} / ${customer_revenue}  ;;
    hidden: yes
  }

  measure: percent_of_total_revenue_decimal_8 {
    type: number
    sql: ${total} / ${customer_revenue}  ;;
    hidden: yes
  }

  measure: percent_of_total_revenue_decimal_9 {
    type: number
    sql: ${total} / ${customer_revenue}  ;;
    hidden: yes
  }

  measure: percent_of_total_revenue_decimal_10 {
    type: number
    sql: ${total} / ${customer_revenue}  ;;
    hidden: yes
  }

  measure: percent_of_total_revenue_decimal_11 {
    type: number
    sql: ${total} / ${customer_revenue}  ;;
    hidden: yes
  }

  measure: percent_of_total_revenue_decimal_12 {
    type: number
    sql: ${total} / ${customer_revenue}  ;;
    hidden: yes
  }



  measure: percent_of_total_revenue {
    type: string
    sql: CASE
    WHEN {% parameter decimal_selector %} = '1' THEN CAST(ROUND(${percent_of_total_revenue_decimal_1}, 1) AS DECIMAL(10,1))
    WHEN {% parameter decimal_selector %} = '2' THEN CAST(ROUND(${percent_of_total_revenue_decimal_2}, 2) AS DECIMAL(10,2))
    WHEN {% parameter decimal_selector %} = '3' THEN CAST(ROUND(${percent_of_total_revenue_decimal_3}, 3) AS DECIMAL(10,3))
    WHEN {% parameter decimal_selector %} = '4' THEN CAST(ROUND(${percent_of_total_revenue_decimal_4}, 4) AS DECIMAL(10,4))
    WHEN {% parameter decimal_selector %} = '5' THEN CAST(ROUND(${percent_of_total_revenue_decimal_5}, 5) AS DECIMAL(10,5))
    WHEN {% parameter decimal_selector %} = '6' THEN CAST(ROUND(${percent_of_total_revenue_decimal_6}, 6) AS DECIMAL(10,6))
    WHEN {% parameter decimal_selector %} = '7' THEN CAST(ROUND(${percent_of_total_revenue_decimal_7}, 7) AS DECIMAL(10,7))
    WHEN {% parameter decimal_selector %} = '8' THEN CAST(ROUND(${percent_of_total_revenue_decimal_8}, 8) AS DECIMAL(10,8))
    WHEN {% parameter decimal_selector %} = '9' THEN CAST(ROUND(${percent_of_total_revenue_decimal_9}, 9) AS DECIMAL(10,9))
    WHEN {% parameter decimal_selector %} = '10' THEN CAST(ROUND(${percent_of_total_revenue_decimal_10}, 10) AS DECIMAL(12,10))
    WHEN {% parameter decimal_selector %} = '11' THEN CAST(ROUND(${percent_of_total_revenue_decimal_11}, 11) AS DECIMAL(12,11))
    WHEN {% parameter decimal_selector %} = '12' THEN CAST(ROUND(${percent_of_total_revenue_decimal_12}, 12) AS DECIMAL(12,12))

    END;;
  }
#################decimales intento con "value" seleccionando diferentes measures con case when tambien

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      first_name,
      last_name,
      events.count,
      orders.count,
      user_data.count
    ]
  }
}
