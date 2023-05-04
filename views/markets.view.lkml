view: markets {
  sql_table_name: sales.markets ;;

  dimension: markets_code {
    type: string
    sql: ${TABLE}.markets_code ;;
    primary_key: yes
  }

  dimension: markets_name {
    type: string
    sql: ${TABLE}.markets_name ;;
  }

  dimension: zone {
    type: string
    sql: ${TABLE}.zone ;;
  }

  measure: count {
    type: count
    drill_fields: [markets_name]
  }
}
