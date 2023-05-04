connection: "salesgcpea"


include: "/views/**/*.view"

datagroup: sales_gcp_isidro_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: sales_gcp_isidro_default_datagroup

explore: transactions {
  label: "Transactions Edher"

  sql_always_where: ${transactions.sales_amount}>0 AND
                    ${transactions.currency} != "USD\r" AND
                    ${transactions.currency} != "INR" AND
                    ${transactions.order_year} >2017;;

  join: customers {
    foreign_key: customer_code
    relationship: many_to_one
  }

  join: markets {
    foreign_key: market_code
    relationship: many_to_one
  }

  join: products {
    foreign_key: product_code
    relationship: many_to_one
  }
}
