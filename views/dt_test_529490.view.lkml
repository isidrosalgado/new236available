view: dt_test_529490 {
  derived_table: {
    sql: SELECT
          order_items.id as id,
          orders.id  AS id_order,
          inventory_items.cost  AS cost,
          order_items.sale_price  AS sale_price,
          orders.status  AS status,
          orders.created_at  AS created_date
      FROM demo_db.order_items  AS order_items
      LEFT JOIN demo_db.orders  AS orders ON order_items.order_id = orders.id
      LEFT JOIN demo_db.inventory_items  AS inventory_items ON order_items.inventory_item_id = inventory_items.id
      WHERE not(status like {% parameter tag_name %} );;
  }

  filter: tag_name {
    type: string
    #sql: {% condition status %} not tag_name {% endcondition %} ;;
    #case_sensitive: yes
  }


  parameter: tag_name_p {
    type: string
    #sql: {% condition status %} not tag_name {% endcondition %} ;;
  }

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: id_order {
    group_label: "📊 - Orders informations"
  }

  dimension: cost {
    group_label: "📊 - Orders informations"
  }

  measure: number_of_orders {
    group_label: "📊 - Orders"
    type: count_distinct
    sql: ${id_order} ;;
  }

  measure: sum_of_costs {
    hidden: yes
    type: sum
    sql:  ${cost};;
  }

  measure: avg_pages_per_visit {
    group_label: "📊 - Orders"
    type: number
    sql: ROUND(${sum_of_costs} / NULLIF(${number_of_orders},0),1) ;;
  }

  dimension: sale_price {
    type: number
    sql: ${TABLE}.sale_price ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;


  }

  dimension_group: created_date {
    type: time
    sql: ${TABLE}.created_date ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }


  set: detail {
    fields: [
      id,
      id_order,
      cost,
      sale_price,
      status,
      created_date_time
    ]
  }
}
