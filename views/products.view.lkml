view: products {
  sql_table_name: sales.products ;;

  dimension: product_code {
    type: string
    sql: ${TABLE}.product_code ;;
    primary_key: yes
  }

  dimension: product_type {
    type: string
    sql: ${TABLE}.product_type ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }

  parameter: product_type_param{
    type: string
    allowed_value: {value: "Own Brand"}
    allowed_value: {value: "Distribution"}
  }
  filter: product_tye_filter {
    type: string
    suggest_dimension: product_type

  }
  # measure: sum_product_type {
  #   type: sum
  #   sql: WHERE ${product_type} = {% condition product %} ;;
  # }
}
