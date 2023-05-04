view: transactions {
  sql_table_name: sales.transactions ;;

  dimension: currency {
    type: string
    sql: ${TABLE}.currency ;;
  }

  dimension: customer_code {
    type: string
    sql: ${TABLE}.customer_code ;;
  }

  dimension: market_code {
    type: string
    sql: ${TABLE}.market_code ;;
  }

  dimension_group: order {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year,
      month_name
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.order_date ;;
  }
  dimension: cust_name {
    type: string
    sql: ${customers.custmer_name} ;;
  }


  measure: number {
    type: number
    sql: ${sales_qty} ;;
  }


  dimension: product_code {
    type: string
    sql: ${TABLE}.product_code ;;
  }

  dimension: sales_amount {
    type: number
    sql: ${TABLE}.sales_amount ;;
  }

  dimension: sales_qty {
    type: number
    sql: ${TABLE}.sales_qty ;;
  }


  measure: count {
    type: count
    drill_fields: []
  }
  measure: total_sales_amount {
    type: sum
    sql: ${sales_amount} ;;
  }

  measure: half_sales_amount{
    type: number
    sql: ${total_sales_amount}/2 ;;
  }
  measure: total_sale_quantity {
    type: sum
    sql: ${sales_qty} ;;

  }

  measure: other_half{
    type: number
    sql: ${half_sales_amount}-${total_sales_amount} ;;
    value_format_name: decimal_0
    label: "Half of measure ($)"
    # html:
    #   {% if value < 0 %}
    # <span style="color:darkred;">{{ rendered_value }}</span>
    # {% elsif value > 0 %}
    # <span style="color:darkgreen;">{{ rendered_value }}</span>
    # {% else %}
    # <span style="color:black;">{{ rendered_value }}</span>
    # {% endif %}  ;;

  }

  # Parameters

  parameter: product_type{
    type: string
    allowed_value: {value: "Own Brand"}
    allowed_value: {value: "Distribution"}
  }





}
